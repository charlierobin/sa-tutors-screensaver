#import "Caption.h"

@implementation Caption

- (id)init: ( struct Globals) globals
{
    self.scaling = globals.scale * 0.2 * ( globals.random.nextUniform + 0.5 );
    
    self.x = globals.frame.size.width / 2;
    
    self.x = globals.random.nextBool ? self.x + ( globals.random.nextUniform * ( ( 750 * self.scaling ) - self.x ) ) : self.x - ( globals.random.nextUniform * ( ( 750 * self.scaling ) - self.x ) );
    
    self.y = globals.frame.size.height / 2;
    
    self.y = globals.random.nextBool ? self.y + ( globals.random.nextUniform * ( ( 150 * self.scaling ) - self.y ) ) : self.y - ( globals.random.nextUniform * ( ( 150 * self.scaling ) - self.y ) );
    
    [NSTimer scheduledTimerWithTimeInterval: ( globals.random.nextUniform * 20 ) + 10 target: self selector: @selector( timerFireMethod: ) userInfo: nil repeats: NO];
    
    self.opacity = 0.0;
    
    self.state = StateFadingIn;
    
    return self;
}

- (void)timerFireMethod:(NSTimer *)timer
{
    self.state = StateFadingOut;
}

- (void)update: ( struct Globals) globals
{
    switch ( self.state )
    {
        case StateFadingIn:
            
            self.opacity = self.opacity + 0.02;
            
            if ( self.opacity > 1.0 )
            {
                self.opacity = 1.0;
                self.state = StateConstant;
            }
            
            break;
            
        case StateConstant:
                    
            break;
            
        case StateFadingOut:
            
            self.opacity = self.opacity - 0.01;
            
            if ( self.opacity < 0.0 )
            {
                self.opacity = 0.0;
                self.state = StateDead;
            }
            
            break;
        
        case StateDead:
            
            self.remove = YES;
            
            break;
            
        default: break;
    }
}

- (void)draw:(struct Globals) globals
{
}

@end
