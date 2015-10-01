#include <stdbool.h>
#include <stdio.h>
#include <string.h>

// Don't support the `-e` and `-E` options
int main(int argc, const char *argv[]) {
  // the `-n` option, see `man echo`
  bool nflag;

  if (argv[1] && !strcmp(argv[1], "-n")) {
    nflag = true;
  } else {
    nflag = false;
  }

  if (argv[1]) {
    printf("%s", argv[1]);

    for (size_t i = 2; i < argc; i++) {
      printf(" %s", argv[i]);
    }
  }

  if (!nflag) {
    putchar('\n');
  }

  return 0;
}
