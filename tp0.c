#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
//------------------------------------------------------------------------------
// DEFINITIONS
//------------------------------------------------------------------------------
#define VERSION "0.1"
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
const char* ENTER = "\n";
char space[SPACE_SIZE];
int spaceIndex[SPACE_INDEX];
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
// IS CAPICUA
//------------------------------------------------------------------------------
bool isCapicua(char* word, size_t size) {
    if (size == 0) return false;
    if (size == 1) return true;
    size_t rightPos = 0, leftPos = size-1;
    while (rightPos < leftPos) {
        int a = tolower(word[rightPos]);
        int b = tolower(word[leftPos]);
        if (a != b) return false;
        rightPos++;
        leftPos--;
    }
    return true;
}
//------------------------------------------------------------------------------
// READ FILE
//------------------------------------------------------------------------------
void readFile(FILE* archIn, FILE* archOut) {
    fseek(archIn, 0, SEEK_SET);
    fseek(archOut, 0, SEEK_SET);
    int c = getc(archIn);
    size_t size = 0;
    char word[100];
    while (c != EOF) {
        if (belongsToSpace(c)) {
            word[size] = (char)c;
            size++;
        } else {
            if (isCapicua(word, size)) {
                fwrite(word, sizeof(char)*size, 1, archOut);
                fwrite(ENTER, sizeof(char)*1, 1, archOut);
            }
            size = 0;
        }
        c = getc(archIn);
    }
}
//------------------------------------------------------------------------------
// Parsea los argumentos
//------------------------------------------------------------------------------
void arg_parse(int argc, char** argv, FILE** descriptors, int* clean_exit) {
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
                return;
            }
            if (flag == 'V') {
                printf("tp0: version %s\n", VERSION);
                *clean_exit = 1;
                return;
            }
            if (!flag) {
                printf("Invalid argument: %s", argv[arg]);
                descriptors[0] = NULL;
                return;
            }
        } else {
            if (flag == 'i') {
                descriptors[0] = fopen(argv[arg], "r");
            } else if (flag == 'o') {
                descriptors[1] = fopen(argv[arg], "w");
            }
            flag = 0;
        }
        arg++;
    }
}
//------------------------------------------------------------------------------
// MAIN
//------------------------------------------------------------------------------
int main(int argc, char** argv) {
    FILE* fdescriptors[2] = {stdin, stdout};
    int clean_exit = 0;
    arg_parse(argc, argv, fdescriptors, &clean_exit);
    if (clean_exit) return 0; // finalizacion limpia, cuando se usa -h o -V
    if (!fdescriptors[0] || !fdescriptors[1]) return 1;

    chargeSpace();
    readFile(fdescriptors[0], fdescriptors[1]);
    if (fdescriptors[0] != stdin) fclose(fdescriptors[0]);
    if (fdescriptors[1] != stdout) fclose(fdescriptors[1]);
    return 0;
}
//------------------------------------------------------------------------------
