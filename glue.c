#include "../bumper.h"

void rx_brake_routine( unsigned char buff[], struct Bumper *bumper );

unsigned char buf[8]; // initialized in superglue
struct Bumper bumper;

int main() {
  rx_brake_routine(buf, &bumper); 
  return 0;
}
