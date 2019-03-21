#include <stdlib.h>
#include "game.h"
#include "myLib.h"
#include "startScreen.h"
#include "win.h"
#include "lose.h"
#include "pause.h"
#include "sky.h"
#include "spritesheet.h"

// Prototypes
void initialize();
void initGame();
void updateGame();
void drawGame();

// State Prototypes
void start();
void goToStart();
void game();
void goToGame();
void pause();
void goToPause();
void win();
void goToWin();
void lose();
void goToLose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// ShadowOAM Structure
OBJ_ATTR shadowOAM[128];

// Variables
int livesRemaining;
int enemiesCaught;

unsigned short buttons;
unsigned short oldButtons;
unsigned short hOff;

int main() {

	initialize();

	while(1) {
		
		oldButtons = buttons;
		buttons = BUTTONS;

		// Game states
		switch(state) {
        	case START:
        		start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
            default:
                break;
        }
	}
}

// Initializes game upon launching
void initialize() {

	// Loads spritsheet palette and tiles
	DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
	DMANow(3, spritesheetTiles, &CHARBLOCK[1], spritesheetTilesLen/2);

    hideSprites();

    // Initialize Mode 0 and memory allocation
	REG_BG0CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	// Define variables for later use
	hOff = 0;
	livesRemaining = 3;
	enemiesCaught = 0;
	buttons = BUTTONS;

	goToStart();
}

// Switches to start state of game
void goToStart() {

	// Loads start screen palette, tiles, and map
    DMANow(3, startScreenPal, PALETTE, startScreenPalLen/2);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen / 2);

	state = START;
}

// Start state of game
void start() {

	hideSprites();

	// Initialize game with start button
	if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }

    hOff++;

    waitForVBlank();

    REG_BG1HOFF = hOff;
}

// Switches to game state of game
void goToGame() {

	// Loads sky palette, tiles, and map
	DMANow(3, skyPal, PALETTE, skyPalLen / 2);
    DMANow(3, skyTiles, &CHARBLOCK[0], skyTilesLen / 2);
    DMANow(3, skyMap, &SCREENBLOCK[28], skyMapLen / 2);

	state = GAME;
}

// Game state of game
void game() {

	// Pauses with start button
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // Loses with B button
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }

    // Loses with no lives remaining
    if (livesRemaining == -1) {
    	goToLose();
    }

    // Wins with all enemies destroyed
    if (enemiesCaught == 25) {
    	goToWin();
    }

    updateGame();
    waitForVBlank();
    drawGame();
    
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Switches to pause state of game
void goToPause() {

	// Loads pause screen palette, tiles, and map
	DMANow(3, pausePal, PALETTE, pausePalLen/2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);

	state = PAUSE;
}

// Pause state of game
void pause() {

	hideSprites();
	
	// Resume game with start button
	if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } 
}

// Switches to win state of game
void goToWin() {

	// Loads win screen palette, tiles, and map
    DMANow(3, winPal, PALETTE, winPalLen/2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen/2);

	state = WIN;
}

// Win state of game
void win() {

	hideSprites();

	// Initialize game from beginning with start button
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    } 
}

// Switches to lose state of game
void goToLose() {

	// Loads lose screen palette, tiles, and map
    DMANow(3, losePal, PALETTE, losePalLen/2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen/2);

	state = LOSE;
}

// Lose state of game
void lose() {

	hideSprites();

	// Initialize game from beginning with start button
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    }
}