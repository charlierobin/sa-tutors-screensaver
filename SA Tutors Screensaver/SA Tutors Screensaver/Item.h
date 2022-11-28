#import <Foundation/Foundation.h>

#import <AppKit/AppKit.h>

#import <GameKit/GameKit.h>

#import "Header.h"

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property float x;
@property float y;

@property float xSpeed;
@property float ySpeed;

@property float rotation;
@property float rotationSpeed;

@property float scaling;

@property bool remove;

@property unsigned long index;

@property Type type;

@property State state;
@property bool wantsToDie;

@property NSString * colour;
@property float opacity;

@property SubState subState;
@property float subStateOpacity;
@property float subStateIncrement;
@property NSString * subStateColourFill;
@property NSString * subStateColourStroke;

- (id)init: ( struct Globals) globals;
- (void)update: ( struct Globals) globals;
- (void)draw: ( struct Globals) globals;

- (void)timerFireMethod:(NSTimer *)timer;

@end

NS_ASSUME_NONNULL_END
