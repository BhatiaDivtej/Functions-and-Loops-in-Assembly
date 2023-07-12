/* Complete the C version of the driver program for compare. This C code does
 * not need to compile. */

// I Compiled Using: -> gcc compare-main.c compare.c -o comparison

#include <stdio.h>

extern long compare(long, long);

int main(int argc, char *argv[]) {

  // args -> number of arguments
  // argv -> array of arguments
  int n = argc;

  // Check if number of arguments is okay!
  if (n!=3){
    printf("Two arguments required.\n");
    return 0;
  }

  // Initialise counter to prevent error in login.khoury...
  int i = 0;

  // Test printing total number of arguments
  // printf("%d\n", n);

  // Test print both numbers
  // for(i = 1; i < 3; i ++){
  //   printf("%s\n",argv[i]);
  // }

  // Convert the char to int
  int a = atol(argv[1]); // using atol
  int b = atol(argv[2]); // using atol

  // printf("%d\n", a);
  // printf("%d\n", b);

  long k = compare(a,b) ;

  /* Compare two (signed) long integers a and b and return:
  * * -1 if a < b
  * * 0 if a == b
  * * 1 if a > b
  */

  if (k == -1){
    printf("less\n");
  }

  if (k == 0){
    printf("equal\n");
  }

  if (k == 1){
    printf("greater\n");
  }

  return 0;
}

