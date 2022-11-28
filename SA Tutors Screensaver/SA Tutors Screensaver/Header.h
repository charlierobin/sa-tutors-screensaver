#ifndef Header_h
#define Header_h

#import <ScreenSaver/ScreenSaverDefaults.h>

typedef enum
{
    StateFadingIn,
    StateConstant,
    StateFadingOut,
    StateDead
    
} State;

typedef enum
{
    TypeSolid,
    TypeOutlined
    
} Type;

typedef enum
{
    SubStateConstant,
    SubStateFlashing
    
} SubState;

struct Globals
{
    ScreenSaverDefaults * defaults;
    NSRect frame;
    float scale;
    GKRandomSource * random;
    NSMutableDictionary * colours;
};

#define LIGHT_GREEN_TUTORS @"lightGreen_Tutors"
#define MID_GREEN_SA @"midGreen_SA"
#define DARK_GREEN @"darkGreen"

#endif /* Header_h */
