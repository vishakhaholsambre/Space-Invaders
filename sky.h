
//{{BLOCK(sky)

//======================================================================
//
//	sky, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 589 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 37696 + 2048 = 40256
//
//	Time-stamp: 2019-03-20, 16:10:39
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKY_H
#define GRIT_SKY_H

#define skyTilesLen 37696
extern const unsigned short skyTiles[18848];

#define skyMapLen 2048
extern const unsigned short skyMap[1024];

#define skyPalLen 512
extern const unsigned short skyPal[256];

#endif // GRIT_SKY_H

//}}BLOCK(sky)
