#import <Foundation/Foundation.h>

#import <AppKit/AppKit.h>

#import <GameKit/GameKit.h>

#import "Header.h"

NS_ASSUME_NONNULL_BEGIN

@interface Caption : NSObject

@property float x;
@property float y;

@property float scaling;

@property bool remove;

@property float opacity;

@property State state;

- (id)init: ( struct Globals) globals;
- (void)update: ( struct Globals) globals;
- (void)draw: ( struct Globals) globals;

- (void)timerFireMethod:(NSTimer *)timer;

@end

NS_ASSUME_NONNULL_END
