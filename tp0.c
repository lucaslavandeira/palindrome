#include <stdio.h>
#include <string.h>

#define VERSION "dev"
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

// Parsea los argumentos
void arg_parse(int argc, char** argv, FILE** descriptors) {
    int arg = 1;
    const char flags[] = {'i', 'o', 'V', 'h'};
    char flag = 0;
    while(arg < argc) {
        if (!flag && argv[arg][0] == '-') {
            for (int i = 0; i < strlen(flags); i++) {
                if (argv[arg][1] == flags[i]) {
                    flag = argv[arg][1];
                    break;
                }
            }

            if (flag == 'h') {
                printf("%s\n", help_str);
                descriptors[0] = NULL;
                return;
            }
            if (flag == 'V') {
                printf("tp0: version %s\n", VERSION);
                descriptors[0] = NULL;
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

int main(int argc, char** argv) {
    FILE* fdescriptors[2] = {stdin, stdout};
    arg_parse(argc, argv, fdescriptors);
    if (!fdescriptors[0]) {        
        return 0;
    }

    // Print que muestra los fd para comprobar que los archivos pasados por parámetro
    // se abrieron exitosamente
    printf("Executing ... Files %d, %d\n", fdescriptors[0]->_fileno, fdescriptors[1]->_fileno);

    if (fdescriptors[0] != stdin) {
        fclose(fdescriptors[0]);
    }

    if (fdescriptors[1] != stdout) {
        fclose(fdescriptors[1]);
    }

    return 0;
}
