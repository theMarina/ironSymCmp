#ifndef SRC_BUMPER_H_
#define SRC_BUMPER_H_

#include <stdint.h>
#include <time.h>
#define SIGNAL_TIME 250000
#define FLASH_TIME  125000

struct Bumper {
    // LED States
    uint8_t outer_left;
    uint8_t inner_left;
    uint8_t inner_right;
    uint8_t outer_right;
    // Bumper states
    uint8_t has_flashed;
    uint8_t brake_state;
	uint8_t flash_lock;
	uint8_t num_flashes;
	// Turn Signal related variables
	uint8_t need_to_signal;
	uint8_t left_lock, right_lock;  // used for giving priority to turn signal > brakes
	uint8_t signal;
	// Time
	clock_t flash_timer;
    clock_t signal_timer;


};


void init_bumper(struct Bumper* bumper);

void brake(struct Bumper* bumper);

void brake_flash(struct Bumper* bumper);

void turn_signal_routine(struct Bumper* bumper);

void brake_routine(struct Bumper* bumper);

#endif /* SRC_BUMPER_H_ */