#include <assert.h>
#include <string.h>
#include "klee.h"
#include "bumper.h"

int vuln_main();
int patched_main();

extern int vuln_g_brake_status; // output
extern int patched_g_brake_status; // output

extern unsigned char vuln_buf[8]; // input
extern unsigned char patched_buf[8]; // input
extern struct Bumper vuln_bumper;
extern struct Bumper patched_bumper;

int main()
{
	unsigned char buf[8] = { 0, 1, 2, 3, 4, 5, 6, 7};
	klee_make_symbolic(buf, sizeof(buf), "buf");

	struct Bumper bumper;
	klee_make_symbolic(&bumper, sizeof(bumper), "bumper");

	memcpy(vuln_buf, buf, sizeof(buf));
	memcpy(patched_buf, buf, sizeof(buf));

	memcpy(&vuln_bumper, &bumper, sizeof(bumper));
	memcpy(&patched_bumper, &bumper, sizeof(bumper));

	vuln_main();
	patched_main();

	//klee_assert(patched_g_brake_status == vuln_g_brake_status);
	klee_assert(memcmp(&patched_bumper, &vuln_bumper, sizeof(bumper)) == 0);
}
