#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdlib.h>
//------------------------------------------------------------------------------
// DEFINITIONS
//------------------------------------------------------------------------------
#define ERROR -1
#define SUCCESS 0
#define INITIAL 100
#define VERSION "0.2"
const char help_str[] = "Usage:\n"
        "  tp0 -h\n"
        "  tp0 -V\n"
        "  tp0 [options]\n"
        "Options:\n"
        "  -V, --version\tPrint version and quit.\n"
        "  -h, --help\tPrint this information.\n"
        "  -i, --input\tLocation of the input file.\n"
        "  -o, --output\tLocation of the output file.\n"
        "Examples:\n"
        "  tp0 -i ~/input -o\n";
#define SPACE_SIZE 65
#define SPACE_INDEX 123
#define EMPTY -1
const char ENTER = '\n';
char space[SPACE_SIZE];
int spaceIndex[SPACE_INDEX];
const char version[] = "--version";
const char help[] = "--help";
const char input[] = "--input";
const char output[] = "--output";
//------------------------------------------------------------------------------
// CHARGE SPACE
//------------------------------------------------------------------------------
// Del 97 al 122 estan las letras de a-z
// Del 65 al 90 estan las letras de A-Z
// Del 48 al 57 estan los numeros de 0-9
// '-' es 45
// '_' es 95
void chargeSpace() {
    int pos = 0;
    for (int i = 0; i < SPACE_INDEX; i++) spaceIndex[i] = EMPTY;
    //--------------------------------------------------------------------------
    for (int i = 97; i <= 122; i++) {
        space[pos] = (char)i;
        spaceIndex[i] = pos;
        pos++;
    }
    //--------------------------------------------------------------------------
    for (int i = 65; i <= 90; i++) {
        space[pos] = (char)i;
        spaceIndex[i] = pos;
        pos++;
    }
    //--------------------------------------------------------------------------
    for (int i = 48; i <= 57; i++) {
        space[pos] = (char)i;
        spaceIndex[i] = pos;
        pos++;
    }
    //--------------------------------------------------------------------------
    // incluyo el guion medio
    pos++;
    space[pos] = '-';
    spaceIndex[45] = pos;
    //--------------------------------------------------------------------------
    // incluyo el guion bajo
    pos++;
    space[pos] = '_';
    spaceIndex[95] = pos;
}
//------------------------------------------------------------------------------
// BELONGS TO SPACE
//------------------------------------------------------------------------------
bool belongsToSpace(int aChar) {
    if (aChar >= SPACE_INDEX) return false;
    return spaceIndex[aChar] != EMPTY;
}
//------------------------------------------------------------------------------
// WRITE OUT FILE
//------------------------------------------------------------------------------
int writeOutFile(FILE* archIn, long begin, long end, FILE* archOut) {
    int c;
    if (fseek(archIn, begin, SEEK_SET) < 0) return ERROR;
    for (long i = 0; i < (end - begin); i++) {
        if (fread((char*)(&c), sizeof(char), 1, archIn) <= 0) return ERROR;
        if (fwrite((char*)(&c), sizeof(char), 1, archOut) <= 0) return ERROR;
    }
    if (fwrite((char*)(&ENTER), sizeof(char), 1, archOut) <= 0) return ERROR;
    return SUCCESS;
}
//------------------------------------------------------------------------------
// READ LETTER
//------------------------------------------------------------------------------
int readLetter(FILE* arch, long pos, char* letter) {
    if (fseek(arch, pos, SEEK_SET) == ERROR) return ERROR;
    if (fread(letter, sizeof(char), 1, arch) <= 0) return ERROR;
    return SUCCESS;
}
//------------------------------------------------------------------------------
// CAPICUA
//------------------------------------------------------------------------------
int capicua(FILE *archIn, long begin, long end, FILE *archOut) {
    char letterA, letterB;
    bool isCapicua = true;
    long size = (end - begin);
    long leftPos = begin, rightPos = end-1;
    if (size == 0) return SUCCESS;
    while (leftPos <= rightPos) {
        if (readLetter(archIn, leftPos, &letterA) == ERROR) return ERROR;
        if (readLetter(archIn, rightPos, &letterB) == ERROR) return ERROR;
        int a = tolower(letterA);
        int b = tolower(letterB);
        if (a != b) {
            isCapicua = false;
            break;
        }
        rightPos--;
        leftPos++;
    }
    if (!isCapicua) return SUCCESS;
    if (writeOutFile(archIn, begin, end, archOut) == ERROR) return ERROR;
    return SUCCESS;
}
//------------------------------------------------------------------------------
// READ FILE
//------------------------------------------------------------------------------
int readFile(FILE* archIn, FILE* archOut) {
    if (fseek(archIn, 0, SEEK_END) == ERROR) return ERROR;
    if (ftell(archIn) == 0) return SUCCESS;
    if (fseek(archIn, 0, SEEK_SET) == ERROR) return ERROR;
    if (fseek(archOut, 0, SEEK_SET) == ERROR) return ERROR;
    long begin = ftell(archIn);
    long end = begin;
    long last;
    int c = getc(archIn);
    bool first = false;
    while (c != EOF) {
        if (belongsToSpace(c)) {
            if (!first) {
                first = true;
                begin = ftell(archIn) - 1;
            }
            end = ftell(archIn);
        } else {
            first = false;
            last = ftell(archIn);
            if (capicua(archIn, begin, end, archOut) == ERROR) return ERROR;
            begin = end;
            if (fseek(archIn, last, SEEK_SET) == ERROR) return ERROR;
        }
        c = getc(archIn);
    }
    return SUCCESS;
}
//------------------------------------------------------------------------------
// ARG PARSE
//------------------------------------------------------------------------------
int arg_parse(int argc, char** argv, FILE** descriptors, int* clean_exit) {
    int arg = 1;
    const char flags[] = {'i', 'o', 'V', 'h'};
    char flag = 0;
    while (arg < argc) {
        if (!flag && argv[arg][0] == '-') {
            for (int i = 0; i < 4; i++) {
                if (argv[arg][1] == flags[i]) {
                    flag = argv[arg][1];
                    break;
                }
            }

            if (flag == 'h') {
                printf("%s\n", help_str);
                *clean_exit = 1;
                return SUCCESS;
            }
            if (flag == 'V') {
                printf("tp0: version %s\n", VERSION);
                *clean_exit = 1;
                return SUCCESS;
            }
            if (!flag) {
                printf("Invalid argument: %s", argv[arg]);
                descriptors[0] = NULL;
                return SUCCESS;
            }
        } else {
            if (flag == 'i') {
                descriptors[0] = fopen(argv[arg], "r");
                if (descriptors[0] == NULL) return ERROR;
            } else if (flag == 'o') {
                descriptors[1] = fopen(argv[arg], "w");
                if (descriptors[1] == NULL) return ERROR;
            }
            flag = 0;
        }
        arg++;
    }
    return SUCCESS;
}
//------------------------------------------------------------------------------
// MAIN
//------------------------------------------------------------------------------
int main(int argc, char** argv) {
    FILE* fdescriptors[2] = {stdin, stdout};
    int clean_exit = 0;
    if (arg_parse(argc, argv, fdescriptors, &clean_exit) == ERROR) return 1;
    if (clean_exit) return 0;  // finalizacion limpia, cuando se usa -h o -V
    chargeSpace();
    if (readFile(fdescriptors[0], fdescriptors[1]) == ERROR) return 1;
    if (fdescriptors[0] != stdin) {
        if (fclose(fdescriptors[0]) == EOF) return 1;
    }
    if (fdescriptors[1] != stdout) {
        if (fclose(fdescriptors[1]) == EOF) return 1;
    }
    return 0;
}
//------------------------------------------------------------------------------
