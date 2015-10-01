#include <stdbool.h>
#include <stdio.h>
#include <string.h>

// Don't support the `-e` and `-E` options
int main(int argc, const char *argv[]) {
  // the `-n` option, see `man echo`
  bool nflag;

  argv++;

  if ((argc > 1) && !strcmp(*argv, "-n")) {
    nflag = true;
    argv++;
  } else {
    nflag = false;
  }

  if (*argv) {
    printf("%s", *argv);

    for (size_t i = 2; i < argc; i++) {
      printf(" %s", *(argv += 1));
    }
  }

  if (nflag == false) {
    putchar('\n');
  }

  return 0;
}
