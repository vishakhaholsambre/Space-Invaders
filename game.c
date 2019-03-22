#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "startScreen.h"
#include "spritesheet.h"

// Variables
int move;
int livesRemaining = 3;
int enemiesCaught = 0;

// Game Structures 
PLAYER player;
ENEMY enemies[ENEMYCOUNT];
BULLET bullets[BULLETCOUNT];
LIFE lives[LIFECOUNT];
ENEMYBULLET enemybullets[ENEMYBULLETCOUNT];

// ShadowOAM Structure
OBJ_ATTR shadowOAM[128];

// Initializes games and sprites
void initGame() {

	// Loads spritesheet palette and tiles
	DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
   	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

   	// Initializes all sprites used in game
	initPlayer();
	initEnemies();
	initBullets();
	initLives();
	initEnemyBullets();
}

// Draws sprites to screen display
void drawGame() {

	drawPlayer();

	for (int i = 0; i < ENEMYCOUNT; i++) {
		drawEnemy(&enemies[i], i + 6);
	}

	for (int i = 0; i < BULLETCOUNT; i++){
		drawBullet(&bullets[i]);
	}

	for (int i = 0; i < LIFECOUNT; i++){
		drawLives(&lives[i]);
	}

	for (int i = 0; i < ENEMYBULLETCOUNT; i++){
		drawEnemyBullets(&enemybullets[i]);
	}
}

// Updates sprites on screen display
void updateGame() {

	updatePlayer();

	for (int i = 0; i < ENEMYCOUNT; i++) {
		if (enemies[i].col < 1 || enemies[i].col + enemies[i].width > SCREENWIDTH - 1) {
			move = 1;
	 	}
		updateEnemy(&enemies[i]); 
	}

	for (int i = 0; i < BULLETCOUNT; i++){
		updateBullet(&bullets[i]);
	}

	for (int i = 0; i < LIFECOUNT; i++){
		updateLives(&lives[i]);
	}

	for (int i = 0; i < ENEMYBULLETCOUNT; i++){
		updateEnemyBullets(&enemybullets[i]);
	}

	// Fire bullets at randomly generated time
	if (enemies->bulletTimer % 60 == 0) {
		fireEnemyBullets(&enemies[rand() % 8]);
		enemies->bulletTimer = 0;
	}
	enemies->bulletTimer++;
}

// Initialize player sprite
void initPlayer() {

	player.width = 16;
	player.height = 16;
	player.rdel = 2;
	player.cdel = 2;
	player.row = 142;
	player.col = 112;
	player.bulletTimer = 20;
}

// Draw player sprite
void drawPlayer() {

	// Retrieve player sprite from spritesheet
	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,0);
}

// Update player sprite
void updatePlayer() {

	// Right key movement
	if (BUTTON_HELD(BUTTON_RIGHT)) {

		if (player.col + player.width < 239) {
			player.col++;
		}
	}

	// Left key movement
	if (BUTTON_HELD(BUTTON_LEFT)) {

		if (player.col > 1) {
			player.col--;
		}
	}

	// Bullet firing with A button
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 20) {
		firePlayerBullet();
		player.bulletTimer = 0;
	}

	// Check for collision from enemy bullets
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {

		if (enemybullets[i].active == 1) {

			// If collision, loses one life and enemy bullet is pooled to inactive
			if (collision(enemybullets[i].row, enemybullets[i].col, enemybullets[i].height, enemybullets[i].width, player.row, player.col, player.height, player.width)) {
					enemybullets[i].active = 0;
					livesRemaining--;
			}
		}
	}
	player.bulletTimer++;
}

// Initialize enemy sprites
void initEnemies() {

	int row = 0;
	int state = 0;

	// Determine rows and arrangement for enemies
	for (int i = 0; i < ENEMYCOUNT; i++) {
		
		// Check each row
		if (i % 5 == 0) {

			enemies[i].col = 10;
			row += 18;
	
			if (state < 4) {
				state += 2;
			} else {
				state = 0;
			}

		} else {
			enemies[i].col = enemies[i - 1].col + 25;
		}

		enemies[i].row = row;
		enemies[i].rdel = 2;
		enemies[i].cdel = -1;
		enemies[i].width = 14;
		enemies[i].height = 14;
		enemies[i].active = 1;
		enemies[i].state = state;
		enemies[i].counter = 0;
		enemies[i].curFrame = 0;
		enemies[i].numFrames = 2;
		enemies[i].bulletTimer = 0;
	}
}

// Draw enemy sprites
void drawEnemy(ENEMY* e, int index) {

	if (e->active) {

		// Retrieve enemy sprite from spritesheet
		shadowOAM[index].attr0 = e->row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[index].attr1 = e->col | ATTR1_SMALL;
		shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(e->curFrame * 2 + 2, e->state);

	} else {

		// Hide sprite if inactive or already hit with bullet
		shadowOAM[index].attr0 = ATTR0_HIDE;
	}
}

// Update enemy sprite
void updateEnemy(ENEMY* e) {

	// Move enemy every 20 frames
	if (e->counter % 20 == 0) {

		// Sets animation of enemy
		if (e->curFrame < e->numFrames - 1) {
			e->curFrame++;
		} else {
			e->curFrame = 0;
		}
	}
	e->counter++;

	// Switch movement direction if right wall hit
	if (((e[0].col >= 240 - e->width) && (e[0].cdel == -1) && (e[0].active == 1)) || 
		((e[1].col >= 240 - e->width) && (e[1].cdel == -1) && (e[1].active == 1)) ||
		((e[2].col >= 240 - e->width) && (e[2].cdel == -1) && (e[2].active == 1)) ||
		((e[3].col >= 240 - e->width) && (e[3].cdel == -1) && (e[3].active == 1)) ||
		((e[4].col >= 240 - e->width) && (e[4].cdel == -1) && (e[4].active == 1))) {

		for (int i = 0; i < ENEMYCOUNT; i++) {

			// Change direction of every alien column or block
			enemies[i].cdel *= -1;
			// Move alien block downwards towards player
			enemies[i].row += 5;
		}
	} 

	// Switch movement direction if left wall hit
	if (((e[0].col <= 1) && (e[0].cdel == 1) && (e[0].active == 1)) ||
		((e[1].col <= 0) && (e[1].cdel == 1) && (e[1].active == 1)) ||
		((e[2].col <= 0) && (e[2].cdel == 1) && (e[2].active == 1)) ||
		((e[3].col <= 0) && (e[3].cdel == 1) && (e[3].active == 1)) ||
		((e[4].col <= 0) && (e[4].cdel == 1) && (e[4].active == 1))) {

		for (int i = 0; i < ENEMYCOUNT; i++) {

			// Change direction of every alien column or block
			enemies[i].cdel *= -1;
			// Move alien block downwards towards player
			enemies[i].row += 5;
		}
	} 

	// Automatic loss if enemies get too close to the player
	if (e->active == 1 && e->row > 146) {
		livesRemaining = -1;
	}

	// Movement of enemies to left or right walls
	e->col -= e->cdel;

	// Check for collision of enemy with player bullets
	for (int i = 0; i < BULLETCOUNT; i++) {

		if (bullets[i].active == 1) {

			// If collision, enemy destroyed and hidden
			if (collision(bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width, e->row, e->col, e->height, e->width)) {
				if (e->active == 1) {
					bullets[i].active = 0;
					e->active = 0;
					enemiesCaught++;
				}
			}
		}
	}
}

// Initialize life sprite
void initLives() {

	// First life
	lives[0].row = 0;
	lives[0].col = 1;
	lives[0].height = 8;
	lives[0].width = 8;
	lives[0].active = 1;
	lives[0].index = 1;

	// Second life
	lives[1].row = 0;
	lives[1].col = 11;
	lives[1].height = 8;
	lives[1].width = 8;
	lives[1].active = 1;
	lives[1].index = 2;

	// Third life
	lives[2].row = 0;
	lives[2].col = 21;
	lives[2].height = 8;
	lives[2].width = 8;
	lives[2].active = 1;
	lives[2].index = 3;
}

// Draw life sprite
void drawLives(LIFE* b) {

	if (b->active) {

		// Retrieve heart sprite from spritesheet
		shadowOAM[b->index].attr0 = (b->row)| ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_SMALL;
		shadowOAM[b->index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 0);

	} else {

		// Hide sprite if life lost
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

// Update life sprite
void updateLives() {

	// Lost one life, two remaining
	if (livesRemaining == 2) {
		lives[2].active = 0;
	}

	// Lost two lives, one remaining
	if (livesRemaining == 1) {
		lives[1].active = 0;
	}

	// Lost three lives, none remaining
	if (livesRemaining == 0) {
		lives[0].active = 0;
	}
}

// Initialize player bullet sprite
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].row = -bullets[i].height;
        bullets[i].col = 0;
        bullets[i].height = 8;
        bullets[i].width = 8;
        bullets[i].rdel = -2;
        bullets[i].cdel = 0;
        bullets[i].active = 0;
        bullets[i].index = i + 61;
    }
}

// Draw player bullet sprite
void drawBullet(BULLET *b){

	if (b->active) {

		// Retrieve player bullet sprite from spritesheet
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;	  	  	
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_SMALL;
	   	shadowOAM[b->index].attr2 =  ATTR2_TILEID(0, 5) | ATTR2_PALROW(0);

	} else if (!b->erased) {

		// Hide sprite if enemy hit
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

// Update player bullet sprite
void updateBullet(BULLET* b) {

	if (b->active) {

		// Movement of player bullet towards enemies
		if (b->row + b->height - 10 >= 0 && b->col + b->cdel > 0 && b->col + b->cdel < SCREENWIDTH - 1) {
			b->row += b->rdel;
            b->col += b->cdel;

		} else {
			b->active = 0;
		}
	}
}

// Fire player bullets at enemies
void firePlayerBullet(){

	for (int i = 0; i < BULLETCOUNT; i++) {

		// Fire bullets at enemies with A button
		if (!bullets[i].active) {
			bullets[i].row = player.row;
			bullets[i].col = player.col;
			bullets[i].active = 1;
			bullets[i].erased = 0;
			break;
		}
	}
}

// Initialize enemy bullet sprite
void initEnemyBullets() {

	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		enemybullets[i].height = 8; 
		enemybullets[i].width = 8;   
		enemybullets[i].row = -enemybullets[i].height;
		enemybullets[i].col = 0;
		enemybullets[i].rdel = 2;
        enemybullets[i].cdel = 0;
		enemybullets[i].active = 0;
		enemybullets[i].index = i + 85; 
	}
}

// Draw enemy bullet sprite
void drawEnemyBullets(ENEMYBULLET* b) {

	if(b->active) {

		// Retrieve enemy bullet sprite from spritesheet
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_SMALL;
		shadowOAM[b->index].attr2 = ATTR2_TILEID(0, 3) | ATTR2_PALROW(0);

	} else {

		// Hide enemy bullet when player hit
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

// Update enemy bullet sprite
void updateEnemyBullets(ENEMYBULLET* b) {

	if (b->active) {

		// Movement of enemy bullet towards player
		if (b->row + b->height-1 >= 0 && b->col + b->cdel > 0 && b->col + b->cdel < SCREENWIDTH - 1 && b->row <= SCREENHEIGHT) {
			b->row += b->rdel;
            b->col += b->cdel;

		} else {
			b->active = 0;
		}
	}
}

// Fire enemy bullet towards player
void fireEnemyBullets(ENEMY* b) {

	if (b->active) {

		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
			
			// Fire enemy bullets towards player
			if (!enemybullets[i].active) {
				enemybullets[i].row = b->row;
				enemybullets[i].col = b->col + b->width / 2 - enemybullets[i].width / 2;
				enemybullets[i].active = 1;
				break;
			}
		}
	}
}