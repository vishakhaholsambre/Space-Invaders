// Player Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int bulletTimer;
} PLAYER;

// Enemy Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int active;
	int state;
	int counter;
	int curFrame;
	int numFrames;
	int bulletTimer;
} ENEMY;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
	int erased;
	int index;
} BULLET;

// Life Struct
typedef struct {
	int row;
	int col;
	int width;
    int height;
    int index;
    int active;
} LIFE;

// Enemy Bullet Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
	int erased;
	int index;
	int bulletType;
} ENEMYBULLET;

// Prototypes
void initGame();
void drawGame();
void updateGame();

void initPlayer();
void drawPlayer();
void updatePlayer();

void initEnemies();
void drawEnemy();
void updateEnemy();

void initLives();
void drawLives();
void updateLives();

void initBullets();
void drawBullet();
void updateBullet();
void firePlayerBullet();

void initEnemyBullets();
void updateEnemyBullets(ENEMYBULLET *);
void drawEnemyBullets(ENEMYBULLET *);
void fireEnemyBullets(ENEMY *);

// Definitions
#define ENEMYCOUNT 25
#define BULLETCOUNT 20
#define LIFECOUNT 3
#define ENEMYBULLETCOUNT 10

// Variables
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern int livesRemaining;
extern int enemiesCaught;