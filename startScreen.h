
//{{BLOCK(startScreen)

//======================================================================
//
//	startScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 568 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 36352 + 2048 = 38912
//
//	Time-stamp: 2019-03-20, 19:31:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN_H
#define GRIT_STARTSCREEN_H

#define startScreenTilesLen 36352
extern const unsigned short startScreenTiles[18176];

#define startScreenMapLen 2048
extern const unsigned short startScreenMap[1024];

#define startScreenPalLen 512
extern const unsigned short startScreenPal[256];

#endif // GRIT_STARTSCREEN_H

//}}BLOCK(startScreen)
