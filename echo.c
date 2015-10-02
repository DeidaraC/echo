#include <stdbool.h>
#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[]) {
  bool nflag; // the `-n` flag

  argv++;

  if ((*argv) && (strcmp(*argv, "-n") == 0)) {
    nflag = true;
    argv++;
  } else {
    nflag = false;
  }

  while (*argv) {
    printf("%s", *argv);
    argv++;
    if (*argv) {
      putchar(' ');
    }
  }

  if (nflag == false) {
    putchar('\n');
  }

  return 0;
}
