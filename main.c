#include <stdio.h>
#include "foo.h"
#include "bar.h"

int main(int argc, char *argv[]) {
    printf("foo() = %d\n", foo());
    printf("bar() = %d\n", bar());
    return 0;
}
