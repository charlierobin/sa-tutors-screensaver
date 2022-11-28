#import "Item.h"

@implementation Item

- (id)init: ( struct Globals) globals
{
    self.scaling = globals.scale * 2.2 * ( globals.random.nextUniform + 0.5 );
    
    self.x = globals.random.nextUniform * globals.frame.size.width;
    self.y = globals.random.nextUniform * globals.frame.size.height;
    
    self.xSpeed = globals.random.nextBool ? globals.random.nextUniform + 0.1 : - globals.random.nextUniform - 0.1;
    self.ySpeed = globals.random.nextBool ? globals.random.nextUniform + 0.1 : - globals.random.nextUniform - 0.1;
    
    self.rotation = globals.random.nextUniform * 360;

    self.rotationSpeed = globals.random.nextBool ? globals.random.nextUniform + 0.1 : - globals.random.nextUniform - 0.1;
    
    self.index = [ globals.random nextIntWithUpperBound: 17 ];
    
    self.opacity = 0.0;
    
    self.state = StateFadingIn;
    
    if ( [globals.defaults boolForKey:@"OutlinedOnly"] && [globals.defaults boolForKey:@"FilledOnly"] )
    {
        self.type = [ globals.random nextIntWithUpperBound: 10 ] > 7 ? TypeSolid : TypeOutlined;
    }
    else
    {
        if ( [globals.defaults boolForKey:@"OutlinedOnly"] )
        {
            self.type = TypeOutlined;
        }
        else
        {
            self.type = TypeSolid;
        }
    }
    
    NSArray * keys = [globals.colours allKeys];
    
    self.colour = keys[ [ globals.random nextIntWithUpperBound: keys.count] ];
    
    
    self.subState = SubStateConstant;
    
    self.subStateOpacity = 0.0;
    
    self.subStateIncrement = 0.0;
    
    
    NSMutableDictionary * otherColours = [NSMutableDictionary dictionaryWithDictionary: globals.colours];
    
    [otherColours removeObjectForKey:self.colour];
    
    keys = [otherColours allKeys];
    
    self.subStateColourFill = keys[ [ globals.random nextIntWithUpperBound: keys.count] ];
    
    [otherColours removeObjectForKey:self.subStateColourFill];
    
    self.subStateColourStroke = keys[0];
    
    
    [NSTimer scheduledTimerWithTimeInterval: ( globals.random.nextUniform * 40 ) + 20 target: self selector: @selector( timerFireMethod: ) userInfo: nil repeats: NO];
    
    return self;
}

- (void)update: ( struct Globals) globals
{
    self.x = self.x + ( self.xSpeed * self.scaling );
    self.y = self.y + ( self.ySpeed * self.scaling );
    
    self.rotation = self.rotation + self.rotationSpeed;
    
    if ( self.x < 0 || self.x > globals.frame.size.width )
    {
        self.xSpeed = self.xSpeed * -1;
        self.ySpeed = self.ySpeed + ( ( globals.random.nextUniform - 0.5 ) * 0.5 );
        
        self.rotationSpeed = globals.random.nextBool ? globals.random.nextUniform + 0.1 : - globals.random.nextUniform - 0.1;
    }
    
    if ( self.y < 0 || self.y > globals.frame.size.height )
    {
        self.ySpeed = self.ySpeed * -1;
        self.xSpeed = self.xSpeed + ( ( globals.random.nextUniform - 0.5 ) * 0.5 );
        
        self.rotationSpeed = globals.random.nextBool ? globals.random.nextUniform + 0.1 : - globals.random.nextUniform - 0.1;
    }
    
    if ( self.xSpeed > 2.0 )
    {
        self.xSpeed = 2.0;
    }
    else if ( self.xSpeed < -2.0 )
    {
        self.xSpeed = -2.0;
    }
    else if ( self.xSpeed == 0 )
    {
        self.xSpeed = globals.random.nextBool ? globals.random.nextUniform + 0.1 : - globals.random.nextUniform - 0.1;
    }
    
    if ( self.ySpeed > 2.0 )
    {
        self.ySpeed = 2.0;
    }
    else if ( self.ySpeed < -2.0 )
    {
        self.ySpeed = -2.0;
    }
    else if ( self.ySpeed == 0 )
    {
        self.ySpeed = globals.random.nextBool ? globals.random.nextUniform + 0.1 : - globals.random.nextUniform - 0.1;
    }
    
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
            
            if ( self.subState == SubStateConstant )
            {
                if ( self.wantsToDie )
                {
                    self.state = StateFadingOut;
                }
                else
                {
                    if ( [ globals.random nextIntWithUpperBound: 1000 ] > 997 )
                    {
                        self.subState = SubStateFlashing;
                        self.subStateIncrement = 0.2;
                    }
                }
            }
            else
            {
                self.subStateOpacity = self.subStateOpacity + self.subStateIncrement;
                
                if ( self.subStateIncrement > 0 )
                {
                    if ( self.subStateOpacity > 1.0 )
                    {
                        self.subStateOpacity = 1.0;
                        self.subStateIncrement = - 0.03;
                    }
                }
                else
                {
                    if ( self.subStateOpacity < 0.0 )
                    {
                        self.subState = SubStateConstant;
                        
                        self.subStateOpacity = 0.0;
                        self.subStateIncrement = 0;
                        
                        if ( globals.random.nextBool )
                        {
                            NSString * temp = self.subStateColourFill;
                            self.subStateColourFill = self.subStateColourStroke;
                            self.subStateColourStroke = temp;
                        }
                    }
                }
            }
            
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
            
        default:
            
            break;
    }
}

- (void)timerFireMethod:(NSTimer *)timer
{
    self.wantsToDie = YES;
}

- (void)draw: ( struct Globals) globals
{
    NSBezierPath* path = [NSBezierPath bezierPath];
    
    switch ( self.index ) {
            
        case 0:
            
            [path moveToPoint: NSMakePoint(-9.5, -37)];
            [path lineToPoint: NSMakePoint(-9.5, -17.46)];
            [path lineToPoint: NSMakePoint(10.56, -17.46)];
            [path lineToPoint: NSMakePoint(10.56, -37)];
            [path lineToPoint: NSMakePoint(-9.5, -37)];
            [path closePath];
            [path moveToPoint: NSMakePoint(36, 7.12)];
            [path lineToPoint: NSMakePoint(36, -9.99)];
            [path lineToPoint: NSMakePoint(-35, -9.99)];
            [path lineToPoint: NSMakePoint(-35, 7.12)];
            [path lineToPoint: NSMakePoint(36, 7.12)];
            [path closePath];
            [path moveToPoint: NSMakePoint(10.56, 34)];
            [path lineToPoint: NSMakePoint(10.56, 14.53)];
            [path lineToPoint: NSMakePoint(-9.5, 14.53)];
            [path lineToPoint: NSMakePoint(-9.5, 34)];
            [path lineToPoint: NSMakePoint(10.56, 34)];
            [path closePath];
            
            break;
            
        case 1:
            
            [path moveToPoint: NSMakePoint(18.96, -28.23)];
            [path curveToPoint: NSMakePoint(28.2, -20.91) controlPoint1: NSMakePoint(22.38, -28.23) controlPoint2: NSMakePoint(25.47, -25.79)];
            [path curveToPoint: NSMakePoint(32.31, -8.12) controlPoint1: NSMakePoint(30.94, -16.03) controlPoint2: NSMakePoint(32.31, -11.76)];
            [path curveToPoint: NSMakePoint(31.03, -3.07) controlPoint1: NSMakePoint(32.31, -6.1) controlPoint2: NSMakePoint(31.88, -4.42)];
            [path curveToPoint: NSMakePoint(27.26, -1.05) controlPoint1: NSMakePoint(30.17, -1.73) controlPoint2: NSMakePoint(28.92, -1.05)];
            [path curveToPoint: NSMakePoint(18.34, -9.89) controlPoint1: NSMakePoint(24.05, -1.05) controlPoint2: NSMakePoint(21.08, -4)];
            [path curveToPoint: NSMakePoint(14.23, -22.81) controlPoint1: NSMakePoint(15.6, -15.78) controlPoint2: NSMakePoint(14.23, -20.09)];
            [path curveToPoint: NSMakePoint(15.58, -26.92) controlPoint1: NSMakePoint(14.23, -24.68) controlPoint2: NSMakePoint(14.68, -26.05)];
            [path curveToPoint: NSMakePoint(18.96, -28.23) controlPoint1: NSMakePoint(16.49, -27.79) controlPoint2: NSMakePoint(17.61, -28.23)];
            [path closePath];
            [path moveToPoint: NSMakePoint(24.56, 3.76)];
            [path curveToPoint: NSMakePoint(32.43, 0.83) controlPoint1: NSMakePoint(27.8, 3.76) controlPoint2: NSMakePoint(30.42, 2.79)];
            [path curveToPoint: NSMakePoint(35.43, -7.8) controlPoint1: NSMakePoint(34.43, -1.13) controlPoint2: NSMakePoint(35.43, -4.01)];
            [path curveToPoint: NSMakePoint(30.06, -24.05) controlPoint1: NSMakePoint(35.43, -12.94) controlPoint2: NSMakePoint(33.64, -18.36)];
            [path curveToPoint: NSMakePoint(15.65, -32.59) controlPoint1: NSMakePoint(26.48, -29.74) controlPoint2: NSMakePoint(21.68, -32.59)];
            [path curveToPoint: NSMakePoint(6.88, -28.87) controlPoint1: NSMakePoint(12.25, -32.59) controlPoint2: NSMakePoint(9.33, -31.35)];
            [path curveToPoint: NSMakePoint(3.21, -19.32) controlPoint1: NSMakePoint(4.44, -26.39) controlPoint2: NSMakePoint(3.21, -23.21)];
            [path curveToPoint: NSMakePoint(9.85, -3.6) controlPoint1: NSMakePoint(3.21, -13.75) controlPoint2: NSMakePoint(5.42, -8.51)];
            [path curveToPoint: NSMakePoint(24.56, 3.76) controlPoint1: NSMakePoint(14.27, 1.31) controlPoint2: NSMakePoint(19.17, 3.76)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-20.06, -1.05)];
            [path curveToPoint: NSMakePoint(-10.67, 6.33) controlPoint1: NSMakePoint(-16.57, -1.05) controlPoint2: NSMakePoint(-13.44, 1.41)];
            [path curveToPoint: NSMakePoint(-6.52, 20.47) controlPoint1: NSMakePoint(-7.9, 11.26) controlPoint2: NSMakePoint(-6.52, 15.97)];
            [path curveToPoint: NSMakePoint(-6.75, 23.04) controlPoint1: NSMakePoint(-6.52, 21.85) controlPoint2: NSMakePoint(-6.59, 22.71)];
            [path curveToPoint: NSMakePoint(-8.08, 24.01) controlPoint1: NSMakePoint(-6.9, 23.38) controlPoint2: NSMakePoint(-7.34, 23.7)];
            [path curveToPoint: NSMakePoint(-10.44, 25.38) controlPoint1: NSMakePoint(-8.81, 24.34) controlPoint2: NSMakePoint(-9.6, 24.8)];
            [path curveToPoint: NSMakePoint(-12.12, 26.25) controlPoint1: NSMakePoint(-11.28, 25.96) controlPoint2: NSMakePoint(-11.84, 26.25)];
            [path curveToPoint: NSMakePoint(-20.31, 17.51) controlPoint1: NSMakePoint(-14.72, 26.25) controlPoint2: NSMakePoint(-17.45, 23.34)];
            [path curveToPoint: NSMakePoint(-24.6, 4.18) controlPoint1: NSMakePoint(-23.17, 11.68) controlPoint2: NSMakePoint(-24.6, 7.24)];
            [path curveToPoint: NSMakePoint(-23.48, 0.37) controlPoint1: NSMakePoint(-24.6, 2.59) controlPoint2: NSMakePoint(-24.23, 1.32)];
            [path curveToPoint: NSMakePoint(-20.06, -1.05) controlPoint1: NSMakePoint(-22.73, -0.58) controlPoint2: NSMakePoint(-21.59, -1.05)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-14.5, 30.75)];
            [path curveToPoint: NSMakePoint(-7.05, 28.14) controlPoint1: NSMakePoint(-12.15, 30.75) controlPoint2: NSMakePoint(-9.66, 29.88)];
            [path curveToPoint: NSMakePoint(1.74, 25.52) controlPoint1: NSMakePoint(-4.43, 26.39) controlPoint2: NSMakePoint(-1.5, 25.52)];
            [path curveToPoint: NSMakePoint(10.88, 27.45) controlPoint1: NSMakePoint(5.08, 25.52) controlPoint2: NSMakePoint(8.12, 26.16)];
            [path curveToPoint: NSMakePoint(17.81, 32.04) controlPoint1: NSMakePoint(13.63, 28.73) controlPoint2: NSMakePoint(15.94, 30.26)];
            [path lineToPoint: NSMakePoint(21.39, 32.04)];
            [path lineToPoint: NSMakePoint(-15.56, -33.87)];
            [path lineToPoint: NSMakePoint(-20.79, -33.87)];
            [path lineToPoint: NSMakePoint(11.75, 24.33)];
            [path curveToPoint: NSMakePoint(6.56, 22.7) controlPoint1: NSMakePoint(10.37, 23.72) controlPoint2: NSMakePoint(8.64, 23.17)];
            [path curveToPoint: NSMakePoint(0.78, 21.99) controlPoint1: NSMakePoint(4.48, 22.22) controlPoint2: NSMakePoint(2.56, 21.99)];
            [path curveToPoint: NSMakePoint(-0.48, 22.03) controlPoint1: NSMakePoint(0.29, 21.99) controlPoint2: NSMakePoint(-0.13, 22)];
            [path curveToPoint: NSMakePoint(-3.3, 22.45) controlPoint1: NSMakePoint(-0.83, 22.06) controlPoint2: NSMakePoint(-1.77, 22.2)];
            [path curveToPoint: NSMakePoint(-3.17, 20.06) controlPoint1: NSMakePoint(-3.21, 20.49) controlPoint2: NSMakePoint(-3.17, 19.69)];
            [path curveToPoint: NSMakePoint(-7.94, 4.41) controlPoint1: NSMakePoint(-3.17, 14.98) controlPoint2: NSMakePoint(-4.76, 9.76)];
            [path curveToPoint: NSMakePoint(-22.49, -5.32) controlPoint1: NSMakePoint(-11.83, -2.08) controlPoint2: NSMakePoint(-16.68, -5.32)];
            [path curveToPoint: NSMakePoint(-31.69, -1.61) controlPoint1: NSMakePoint(-26.1, -5.32) controlPoint2: NSMakePoint(-29.17, -4.08)];
            [path curveToPoint: NSMakePoint(-35.48, 8.35) controlPoint1: NSMakePoint(-34.22, 0.87) controlPoint2: NSMakePoint(-35.48, 4.19)];
            [path curveToPoint: NSMakePoint(-28.76, 23.64) controlPoint1: NSMakePoint(-35.48, 13.8) controlPoint2: NSMakePoint(-33.24, 18.9)];
            [path curveToPoint: NSMakePoint(-14.5, 30.75) controlPoint1: NSMakePoint(-24.27, 28.38) controlPoint2: NSMakePoint(-19.52, 30.75)];
            [path closePath];
            
            break;
            
        case 2:
            
            [path moveToPoint: NSMakePoint(10.33, 3.97)];
            [path curveToPoint: NSMakePoint(-4.34, 5.85) controlPoint1: NSMakePoint(0.83, 3.97) controlPoint2: NSMakePoint(-0.48, 3.97)];
            [path curveToPoint: NSMakePoint(-9.04, 16.28) controlPoint1: NSMakePoint(-8.38, 7.92) controlPoint2: NSMakePoint(-9.04, 12.43)];
            [path curveToPoint: NSMakePoint(2.9, 30.85) controlPoint1: NSMakePoint(-9.04, 24.46) controlPoint2: NSMakePoint(-6.41, 30.85)];
            [path curveToPoint: NSMakePoint(24.9, 11.58) controlPoint1: NSMakePoint(14.28, 30.85) controlPoint2: NSMakePoint(22.36, 19.01)];
            [path lineToPoint: NSMakePoint(27.25, 11.58)];
            [path lineToPoint: NSMakePoint(27.25, 33.67)];
            [path lineToPoint: NSMakePoint(24.71, 33.67)];
            [path curveToPoint: NSMakePoint(20.57, 29.35) controlPoint1: NSMakePoint(23.39, 30.66) controlPoint2: NSMakePoint(22.55, 29.35)];
            [path curveToPoint: NSMakePoint(11.08, 32.54) controlPoint1: NSMakePoint(18.79, 29.35) controlPoint2: NSMakePoint(13.15, 31.98)];
            [path curveToPoint: NSMakePoint(1.59, 33.95) controlPoint1: NSMakePoint(7.32, 33.58) controlPoint2: NSMakePoint(5.34, 33.95)];
            [path curveToPoint: NSMakePoint(-24.55, 17.03) controlPoint1: NSMakePoint(-15.99, 33.95) controlPoint2: NSMakePoint(-24.55, 26.34)];
            [path curveToPoint: NSMakePoint(-20.13, 7.63) controlPoint1: NSMakePoint(-24.55, 13.18) controlPoint2: NSMakePoint(-22.67, 9.98)];
            [path curveToPoint: NSMakePoint(-8.94, 3.12) controlPoint1: NSMakePoint(-16.93, 4.72) controlPoint2: NSMakePoint(-13.17, 3.59)];
            [path lineToPoint: NSMakePoint(-8.94, 3.03)];
            [path curveToPoint: NSMakePoint(-27.74, -12.86) controlPoint1: NSMakePoint(-17.69, 2.56) controlPoint2: NSMakePoint(-27.74, -2.24)];
            [path curveToPoint: NSMakePoint(-17.22, -28.93) controlPoint1: NSMakePoint(-27.74, -20) controlPoint2: NSMakePoint(-23.7, -25.55)];
            [path curveToPoint: NSMakePoint(1.02, -32.79) controlPoint1: NSMakePoint(-12.14, -31.66) controlPoint2: NSMakePoint(-6.03, -32.79)];
            [path curveToPoint: NSMakePoint(14.75, -30.53) controlPoint1: NSMakePoint(4.31, -32.79) controlPoint2: NSMakePoint(9.39, -32.5)];
            [path curveToPoint: NSMakePoint(28.38, -18.97) controlPoint1: NSMakePoint(21.51, -27.99) controlPoint2: NSMakePoint(28.38, -23.95)];
            [path curveToPoint: NSMakePoint(24.33, -14.74) controlPoint1: NSMakePoint(28.38, -16.24) controlPoint2: NSMakePoint(26.78, -14.74)];
            [path curveToPoint: NSMakePoint(16.34, -22.63) controlPoint1: NSMakePoint(20.1, -14.74) controlPoint2: NSMakePoint(19.73, -17.84)];
            [path curveToPoint: NSMakePoint(3.84, -28.27) controlPoint1: NSMakePoint(14.18, -25.55) controlPoint2: NSMakePoint(10.23, -28.27)];
            [path curveToPoint: NSMakePoint(-11.58, -13.7) controlPoint1: NSMakePoint(-8.19, -28.27) controlPoint2: NSMakePoint(-11.58, -22.26)];
            [path curveToPoint: NSMakePoint(-5.84, -2.24) controlPoint1: NSMakePoint(-11.58, -8.91) controlPoint2: NSMakePoint(-9.51, -4.49)];
            [path curveToPoint: NSMakePoint(10.33, 0.68) controlPoint1: NSMakePoint(-1.33, 0.49) controlPoint2: NSMakePoint(0.55, 0.68)];
            [path lineToPoint: NSMakePoint(10.33, 3.97)];
            [path closePath];
            
            break;
            
        case 3:
            
            [path moveToPoint: NSMakePoint(22.54, -0.17)];
            [path curveToPoint: NSMakePoint(20.59, 6.12) controlPoint1: NSMakePoint(22.54, 2.43) controlPoint2: NSMakePoint(21.89, 4.52)];
            [path curveToPoint: NSMakePoint(15.15, 8.5) controlPoint1: NSMakePoint(19.28, 7.71) controlPoint2: NSMakePoint(17.47, 8.5)];
            [path curveToPoint: NSMakePoint(9.89, 6.67) controlPoint1: NSMakePoint(12.85, 8.5) controlPoint2: NSMakePoint(11.1, 7.89)];
            [path curveToPoint: NSMakePoint(5.51, -0.49) controlPoint1: NSMakePoint(8.68, 5.44) controlPoint2: NSMakePoint(7.22, 3.06)];
            [path curveToPoint: NSMakePoint(9.71, -7.1) controlPoint1: NSMakePoint(6.95, -3.37) controlPoint2: NSMakePoint(8.35, -5.57)];
            [path curveToPoint: NSMakePoint(15.15, -9.4) controlPoint1: NSMakePoint(11.07, -8.63) controlPoint2: NSMakePoint(12.88, -9.4)];
            [path curveToPoint: NSMakePoint(20.61, -6.9) controlPoint1: NSMakePoint(17.5, -9.4) controlPoint2: NSMakePoint(19.32, -8.56)];
            [path curveToPoint: NSMakePoint(22.54, -0.17) controlPoint1: NSMakePoint(21.89, -5.23) controlPoint2: NSMakePoint(22.54, -2.99)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-16.43, -9.4)];
            [path curveToPoint: NSMakePoint(-10.14, -7.1) controlPoint1: NSMakePoint(-13.65, -9.4) controlPoint2: NSMakePoint(-11.55, -8.63)];
            [path curveToPoint: NSMakePoint(-5.88, -0.17) controlPoint1: NSMakePoint(-8.74, -5.57) controlPoint2: NSMakePoint(-7.31, -3.26)];
            [path curveToPoint: NSMakePoint(-10.67, 6.76) controlPoint1: NSMakePoint(-7.59, 3.16) controlPoint2: NSMakePoint(-9.19, 5.47)];
            [path curveToPoint: NSMakePoint(-16.43, 8.69) controlPoint1: NSMakePoint(-12.16, 8.04) controlPoint2: NSMakePoint(-14.08, 8.69)];
            [path curveToPoint: NSMakePoint(-21.21, 6.21) controlPoint1: NSMakePoint(-18.3, 8.69) controlPoint2: NSMakePoint(-19.89, 7.86)];
            [path curveToPoint: NSMakePoint(-23.18, -0.17) controlPoint1: NSMakePoint(-22.52, 4.55) controlPoint2: NSMakePoint(-23.18, 2.43)];
            [path curveToPoint: NSMakePoint(-21.32, -6.9) controlPoint1: NSMakePoint(-23.18, -2.99) controlPoint2: NSMakePoint(-22.56, -5.23)];
            [path curveToPoint: NSMakePoint(-16.43, -9.4) controlPoint1: NSMakePoint(-20.08, -8.56) controlPoint2: NSMakePoint(-18.45, -9.4)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-0.78, 8.09)];
            [path curveToPoint: NSMakePoint(6.66, 15.98) controlPoint1: NSMakePoint(1.79, 11.76) controlPoint2: NSMakePoint(4.27, 14.39)];
            [path curveToPoint: NSMakePoint(15.15, 18.37) controlPoint1: NSMakePoint(9.04, 17.57) controlPoint2: NSMakePoint(11.87, 18.37)];
            [path curveToPoint: NSMakePoint(27.31, 13.09) controlPoint1: NSMakePoint(20.44, 18.37) controlPoint2: NSMakePoint(24.49, 16.61)];
            [path curveToPoint: NSMakePoint(31.53, -0.17) controlPoint1: NSMakePoint(30.12, 9.57) controlPoint2: NSMakePoint(31.53, 5.15)];
            [path curveToPoint: NSMakePoint(27.42, -13.67) controlPoint1: NSMakePoint(31.53, -5.68) controlPoint2: NSMakePoint(30.16, -10.18)];
            [path curveToPoint: NSMakePoint(15.15, -18.9) controlPoint1: NSMakePoint(24.69, -17.16) controlPoint2: NSMakePoint(20.59, -18.9)];
            [path curveToPoint: NSMakePoint(5.88, -15.46) controlPoint1: NSMakePoint(11.78, -18.9) controlPoint2: NSMakePoint(8.69, -17.75)];
            [path curveToPoint: NSMakePoint(0.09, -8.57) controlPoint1: NSMakePoint(3.86, -13.77) controlPoint2: NSMakePoint(1.93, -11.48)];
            [path curveToPoint: NSMakePoint(-7.3, -16.33) controlPoint1: NSMakePoint(-2.02, -11.97) controlPoint2: NSMakePoint(-4.48, -14.55)];
            [path curveToPoint: NSMakePoint(-16.43, -18.99) controlPoint1: NSMakePoint(-10.11, -18.1) controlPoint2: NSMakePoint(-13.16, -18.99)];
            [path curveToPoint: NSMakePoint(-28.48, -13.71) controlPoint1: NSMakePoint(-21.88, -18.99) controlPoint2: NSMakePoint(-25.89, -17.23)];
            [path curveToPoint: NSMakePoint(-32.36, -0.17) controlPoint1: NSMakePoint(-31.07, -10.19) controlPoint2: NSMakePoint(-32.36, -5.68)];
            [path curveToPoint: NSMakePoint(-28, 13.07) controlPoint1: NSMakePoint(-32.36, 5.15) controlPoint2: NSMakePoint(-30.9, 9.57)];
            [path curveToPoint: NSMakePoint(-16.43, 18.32) controlPoint1: NSMakePoint(-25.09, 16.57) controlPoint2: NSMakePoint(-21.24, 18.32)];
            [path curveToPoint: NSMakePoint(-8.31, 16.08) controlPoint1: NSMakePoint(-13.56, 18.32) controlPoint2: NSMakePoint(-10.85, 17.57)];
            [path curveToPoint: NSMakePoint(-0.78, 8.09) controlPoint1: NSMakePoint(-5.77, 14.58) controlPoint2: NSMakePoint(-3.26, 11.91)];
            [path closePath];
            
            break;
            
        case 4:
            
            [path moveToPoint: NSMakePoint(-43.3, -5.23)];
            [path curveToPoint: NSMakePoint(-36.36, -6.97) controlPoint1: NSMakePoint(-40.99, -5.93) controlPoint2: NSMakePoint(-38.67, -6.51)];
            [path lineToPoint: NSMakePoint(-36.45, 46)];
            [path lineToPoint: NSMakePoint(6.55, 13.7)];
            [path curveToPoint: NSMakePoint(10.19, 21.77) controlPoint1: NSMakePoint(8.05, 16.19) controlPoint2: NSMakePoint(9.27, 18.88)];
            [path curveToPoint: NSMakePoint(14.87, 20.3) controlPoint1: NSMakePoint(11.98, 21.25) controlPoint2: NSMakePoint(13.54, 20.76)];
            [path curveToPoint: NSMakePoint(17.86, 19.25) controlPoint1: NSMakePoint(16.03, 19.89) controlPoint2: NSMakePoint(17.02, 19.54)];
            [path curveToPoint: NSMakePoint(18.6, 18.82) controlPoint1: NSMakePoint(18.7, 18.97) controlPoint2: NSMakePoint(18.95, 18.82)];
            [path curveToPoint: NSMakePoint(13.83, 8.23) controlPoint1: NSMakePoint(17.44, 15.06) controlPoint2: NSMakePoint(15.85, 11.53)];
            [path lineToPoint: NSMakePoint(34.38, -7.06)];
            [path lineToPoint: NSMakePoint(35.59, 4.15)];
            [path lineToPoint: NSMakePoint(44, 12.66)];
            [path lineToPoint: NSMakePoint(40.27, -20.52)];
            [path lineToPoint: NSMakePoint(7.33, -24.08)];
            [path lineToPoint: NSMakePoint(15.13, -16.09)];
            [path lineToPoint: NSMakePoint(25.62, -14.96)];
            [path lineToPoint: NSMakePoint(6.72, -0.8)];
            [path curveToPoint: NSMakePoint(-6.97, -10.88) controlPoint1: NSMakePoint(2.91, -4.8) controlPoint2: NSMakePoint(-1.66, -8.16)];
            [path curveToPoint: NSMakePoint(-25.09, -16.09) controlPoint1: NSMakePoint(-12.81, -13.66) controlPoint2: NSMakePoint(-18.85, -15.39)];
            [path lineToPoint: NSMakePoint(-24.83, -41.27)];
            [path lineToPoint: NSMakePoint(-36.36, -47)];
            [path lineToPoint: NSMakePoint(-36.45, -15.74)];
            [path curveToPoint: NSMakePoint(-45.99, -13.48) controlPoint1: NSMakePoint(-39.74, -15.28) controlPoint2: NSMakePoint(-42.92, -14.52)];
            [path curveToPoint: NSMakePoint(-45.64, -12.01) controlPoint1: NSMakePoint(-46.04, -13.37) controlPoint2: NSMakePoint(-45.93, -12.87)];
            [path curveToPoint: NSMakePoint(-44.69, -9.23) controlPoint1: NSMakePoint(-45.35, -11.14) controlPoint2: NSMakePoint(-45.03, -10.21)];
            [path lineToPoint: NSMakePoint(-43.3, -5.23)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-25.01, 22.9)];
            [path lineToPoint: NSMakePoint(-25.01, -6.97)];
            [path curveToPoint: NSMakePoint(-11.22, -2.8) controlPoint1: NSMakePoint(-20.32, -6.45) controlPoint2: NSMakePoint(-15.73, -5.06)];
            [path curveToPoint: NSMakePoint(-0.47, 4.67) controlPoint1: NSMakePoint(-7.06, -0.72) controlPoint2: NSMakePoint(-3.48, 1.77)];
            [path lineToPoint: NSMakePoint(-25.01, 22.9)];
            [path closePath];
            
            break;
            
        case 5:
            
            [path moveToPoint: NSMakePoint(28.97, 44)];
            [path lineToPoint: NSMakePoint(30.15, 23.32)];
            [path lineToPoint: NSMakePoint(27.12, 23.32)];
            [path curveToPoint: NSMakePoint(25.52, 29.32) controlPoint1: NSMakePoint(27.12, 24.55) controlPoint2: NSMakePoint(26.59, 26.55)];
            [path curveToPoint: NSMakePoint(21.56, 35.53) controlPoint1: NSMakePoint(24.46, 32.09) controlPoint2: NSMakePoint(23.14, 34.16)];
            [path curveToPoint: NSMakePoint(15.55, 38.87) controlPoint1: NSMakePoint(19.89, 37) controlPoint2: NSMakePoint(17.88, 38.11)];
            [path curveToPoint: NSMakePoint(7.02, 40) controlPoint1: NSMakePoint(13.22, 39.62) controlPoint2: NSMakePoint(10.38, 40)];
            [path lineToPoint: NSMakePoint(-14.21, 40)];
            [path lineToPoint: NSMakePoint(7.84, 4.84)];
            [path lineToPoint: NSMakePoint(-17.86, -30.42)];
            [path lineToPoint: NSMakePoint(12.98, -30.42)];
            [path curveToPoint: NSMakePoint(24.39, -28.68) controlPoint1: NSMakePoint(18.19, -30.42) controlPoint2: NSMakePoint(21.99, -29.84)];
            [path curveToPoint: NSMakePoint(29.07, -21.13) controlPoint1: NSMakePoint(26.79, -27.51) controlPoint2: NSMakePoint(28.35, -25)];
            [path lineToPoint: NSMakePoint(32, -21.13)];
            [path lineToPoint: NSMakePoint(29.33, -45)];
            [path lineToPoint: NSMakePoint(-32, -45)];
            [path lineToPoint: NSMakePoint(-32, -41.61)];
            [path lineToPoint: NSMakePoint(-4.04, -3.22)];
            [path lineToPoint: NSMakePoint(-31.85, 40.56)];
            [path lineToPoint: NSMakePoint(-31.85, 44)];
            [path lineToPoint: NSMakePoint(28.97, 44)];
            [path closePath];
            
            break;
            
        case 6:
            
            [path moveToPoint: NSMakePoint(-41, -9.42)];
            [path lineToPoint: NSMakePoint(-41, 10.58)];
            [path lineToPoint: NSMakePoint(-9.58, 10.58)];
            [path lineToPoint: NSMakePoint(-9.58, 42)];
            [path lineToPoint: NSMakePoint(10.58, 42)];
            [path lineToPoint: NSMakePoint(10.58, 10.58)];
            [path lineToPoint: NSMakePoint(42, 10.58)];
            [path lineToPoint: NSMakePoint(42, -9.42)];
            [path lineToPoint: NSMakePoint(10.58, -9.42)];
            [path lineToPoint: NSMakePoint(10.58, -41)];
            [path lineToPoint: NSMakePoint(-9.58, -41)];
            [path lineToPoint: NSMakePoint(-9.58, -9.42)];
            [path lineToPoint: NSMakePoint(-41, -9.42)];
            [path closePath];
            
            break;
            
        case 7:
            
            [path moveToPoint: NSMakePoint(-38, 7.3)];
            [path lineToPoint: NSMakePoint(39, 7.3)];
            [path lineToPoint: NSMakePoint(39, -8)];
            [path lineToPoint: NSMakePoint(-38, -8)];
            [path lineToPoint: NSMakePoint(-38, 7.3)];
            [path closePath];
            
            break;
            
        case 8:
            
            [path moveToPoint: NSMakePoint(-35, -35)];
            [path lineToPoint: NSMakePoint(-35, -19.35)];
            [path lineToPoint: NSMakePoint(34, -19.35)];
            [path lineToPoint: NSMakePoint(34, -35)];
            [path lineToPoint: NSMakePoint(-35, -35)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-35, 1.14)];
            [path lineToPoint: NSMakePoint(-35, 17.3)];
            [path lineToPoint: NSMakePoint(34, 36)];
            [path lineToPoint: NSMakePoint(34, 19.08)];
            [path lineToPoint: NSMakePoint(-7.99, 9.28)];
            [path lineToPoint: NSMakePoint(34, -0.65)];
            [path lineToPoint: NSMakePoint(34, -17.57)];
            [path lineToPoint: NSMakePoint(-35, 1.14)];
            [path closePath];
            
            break;
            
        case 9:
            
            [path moveToPoint: NSMakePoint(29.26, 38.81)];
            [path curveToPoint: NSMakePoint(27.73, 35.25) controlPoint1: NSMakePoint(29.26, 37.49) controlPoint2: NSMakePoint(28.75, 36.31)];
            [path curveToPoint: NSMakePoint(24.31, 33.67) controlPoint1: NSMakePoint(26.7, 34.2) controlPoint2: NSMakePoint(25.56, 33.67)];
            [path curveToPoint: NSMakePoint(19.44, 37.23) controlPoint1: NSMakePoint(22.07, 33.67) controlPoint2: NSMakePoint(20.45, 34.85)];
            [path curveToPoint: NSMakePoint(16.73, 40.78) controlPoint1: NSMakePoint(18.43, 39.6) controlPoint2: NSMakePoint(17.53, 40.78)];
            [path curveToPoint: NSMakePoint(13.47, 38.21) controlPoint1: NSMakePoint(15.33, 40.78) controlPoint2: NSMakePoint(14.24, 39.93)];
            [path curveToPoint: NSMakePoint(12.14, 31.1) controlPoint1: NSMakePoint(12.71, 36.47) controlPoint2: NSMakePoint(12.27, 34.1)];
            [path lineToPoint: NSMakePoint(10.81, -5.9)];
            [path curveToPoint: NSMakePoint(6.41, -34.12) controlPoint1: NSMakePoint(10.38, -18.41) controlPoint2: NSMakePoint(8.91, -27.82)];
            [path curveToPoint: NSMakePoint(-8.65, -43.62) controlPoint1: NSMakePoint(3.87, -40.46) controlPoint2: NSMakePoint(-1.15, -43.62)];
            [path curveToPoint: NSMakePoint(-15.95, -41.93) controlPoint1: NSMakePoint(-11.56, -43.62) controlPoint2: NSMakePoint(-13.99, -43.06)];
            [path curveToPoint: NSMakePoint(-18.88, -37.11) controlPoint1: NSMakePoint(-17.91, -40.79) controlPoint2: NSMakePoint(-18.88, -39.19)];
            [path curveToPoint: NSMakePoint(-17.53, -33.46) controlPoint1: NSMakePoint(-18.88, -35.79) controlPoint2: NSMakePoint(-18.43, -34.58)];
            [path curveToPoint: NSMakePoint(-13.7, -31.78) controlPoint1: NSMakePoint(-16.63, -32.34) controlPoint2: NSMakePoint(-15.35, -31.78)];
            [path curveToPoint: NSMakePoint(-9.04, -35.43) controlPoint1: NSMakePoint(-11.56, -31.78) controlPoint2: NSMakePoint(-10, -33)];
            [path curveToPoint: NSMakePoint(-6.03, -39.08) controlPoint1: NSMakePoint(-8.08, -37.86) controlPoint2: NSMakePoint(-7.07, -39.08)];
            [path curveToPoint: NSMakePoint(-2.41, -35.04) controlPoint1: NSMakePoint(-4.29, -39.08) controlPoint2: NSMakePoint(-3.08, -37.73)];
            [path curveToPoint: NSMakePoint(-1.12, -23.52) controlPoint1: NSMakePoint(-1.73, -32.35) controlPoint2: NSMakePoint(-1.31, -28.51)];
            [path lineToPoint: NSMakePoint(0.26, 13.89)];
            [path curveToPoint: NSMakePoint(5.44, 38.12) controlPoint1: NSMakePoint(0.68, 25.33) controlPoint2: NSMakePoint(2.41, 33.41)];
            [path curveToPoint: NSMakePoint(19.76, 45.19) controlPoint1: NSMakePoint(8.47, 42.83) controlPoint2: NSMakePoint(13.24, 45.19)];
            [path curveToPoint: NSMakePoint(26.67, 43.35) controlPoint1: NSMakePoint(22.64, 45.19) controlPoint2: NSMakePoint(24.94, 44.58)];
            [path curveToPoint: NSMakePoint(29.26, 38.81) controlPoint1: NSMakePoint(28.4, 42.13) controlPoint2: NSMakePoint(29.26, 40.61)];
            [path closePath];
            
            break;
            
        case 10:
            
            [path moveToPoint: NSMakePoint(-26.73, -32.29)];
            [path curveToPoint: NSMakePoint(-26.44, -32.84) controlPoint1: NSMakePoint(-26.73, -32.52) controlPoint2: NSMakePoint(-26.63, -32.71)];
            [path curveToPoint: NSMakePoint(-25.56, -33.05) controlPoint1: NSMakePoint(-26.24, -32.98) controlPoint2: NSMakePoint(-25.95, -33.05)];
            [path lineToPoint: NSMakePoint(10.53, -33.05)];
            [path curveToPoint: NSMakePoint(11.2, -32.81) controlPoint1: NSMakePoint(10.72, -33.05) controlPoint2: NSMakePoint(10.95, -32.97)];
            [path curveToPoint: NSMakePoint(11.58, -32.29) controlPoint1: NSMakePoint(11.45, -32.66) controlPoint2: NSMakePoint(11.58, -32.49)];
            [path lineToPoint: NSMakePoint(11.35, -31.54)];
            [path lineToPoint: NSMakePoint(-6.5, 15.69)];
            [path lineToPoint: NSMakePoint(-26.15, -30.67)];
            [path curveToPoint: NSMakePoint(-26.73, -32.29) controlPoint1: NSMakePoint(-26.53, -31.56) controlPoint2: NSMakePoint(-26.73, -32.1)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-36, -40)];
            [path lineToPoint: NSMakePoint(-0.72, 42)];
            [path lineToPoint: NSMakePoint(3.3, 42)];
            [path lineToPoint: NSMakePoint(37, -40)];
            [path lineToPoint: NSMakePoint(-36, -40)];
            [path closePath];
            
            break;
            
        case 11:
            
            [path moveToPoint: NSMakePoint(30, -43)];
            [path lineToPoint: NSMakePoint(30, -39.93)];
            [path curveToPoint: NSMakePoint(26.19, -37.37) controlPoint1: NSMakePoint(27.97, -39.29) controlPoint2: NSMakePoint(27.08, -38.78)];
            [path lineToPoint: NSMakePoint(7.37, -8.19)];
            [path lineToPoint: NSMakePoint(20.21, 7.94)];
            [path curveToPoint: NSMakePoint(29.11, 12.93) controlPoint1: NSMakePoint(22.63, 10.88) controlPoint2: NSMakePoint(25.17, 12.29)];
            [path lineToPoint: NSMakePoint(29.11, 16)];
            [path lineToPoint: NSMakePoint(7.75, 16)];
            [path lineToPoint: NSMakePoint(7.75, 12.93)];
            [path lineToPoint: NSMakePoint(10.3, 12.67)];
            [path curveToPoint: NSMakePoint(14.24, 9.86) controlPoint1: NSMakePoint(13.22, 12.42) controlPoint2: NSMakePoint(14.24, 11.78)];
            [path curveToPoint: NSMakePoint(9.41, 1.67) controlPoint1: NSMakePoint(14.24, 7.94) controlPoint2: NSMakePoint(12.84, 6.15)];
            [path lineToPoint: NSMakePoint(4.83, -4.22)];
            [path curveToPoint: NSMakePoint(3.18, -2.05) controlPoint1: NSMakePoint(4.32, -3.45) controlPoint2: NSMakePoint(3.69, -2.69)];
            [path curveToPoint: NSMakePoint(-4.19, 10.5) controlPoint1: NSMakePoint(-1.02, 3.46) controlPoint2: NSMakePoint(-4.19, 8.83)];
            [path curveToPoint: NSMakePoint(1.78, 12.93) controlPoint1: NSMakePoint(-4.19, 12.03) controlPoint2: NSMakePoint(-2.42, 12.8)];
            [path lineToPoint: NSMakePoint(1.78, 16)];
            [path lineToPoint: NSMakePoint(-30, 16)];
            [path lineToPoint: NSMakePoint(-30, 12.93)];
            [path curveToPoint: NSMakePoint(-23.39, 7.94) controlPoint1: NSMakePoint(-26.69, 12.42) controlPoint2: NSMakePoint(-25.93, 11.78)];
            [path lineToPoint: NSMakePoint(-7.12, -17.28)];
            [path curveToPoint: NSMakePoint(-9.92, -20.86) controlPoint1: NSMakePoint(-9.03, -19.58) controlPoint2: NSMakePoint(-8.01, -18.43)];
            [path lineToPoint: NSMakePoint(-15.38, -28.03)];
            [path curveToPoint: NSMakePoint(-29.75, -39.93) controlPoint1: NSMakePoint(-22.5, -37.62) controlPoint2: NSMakePoint(-25.04, -39.67)];
            [path lineToPoint: NSMakePoint(-29.75, -43)];
            [path lineToPoint: NSMakePoint(-8.26, -43)];
            [path lineToPoint: NSMakePoint(-8.26, -39.93)];
            [path curveToPoint: NSMakePoint(-14.62, -36.86) controlPoint1: NSMakePoint(-12.84, -39.67) controlPoint2: NSMakePoint(-14.62, -38.78)];
            [path curveToPoint: NSMakePoint(-6.48, -23.67) controlPoint1: NSMakePoint(-14.62, -34.81) controlPoint2: NSMakePoint(-11.44, -29.69)];
            [path curveToPoint: NSMakePoint(-4.45, -21.11) controlPoint1: NSMakePoint(-5.72, -22.78) controlPoint2: NSMakePoint(-5.08, -21.88)];
            [path curveToPoint: NSMakePoint(0.89, -29.18) controlPoint1: NSMakePoint(-2.8, -23.8) controlPoint2: NSMakePoint(-1.02, -26.49)];
            [path curveToPoint: NSMakePoint(5.08, -37.37) controlPoint1: NSMakePoint(3.94, -33.66) controlPoint2: NSMakePoint(5.08, -35.83)];
            [path curveToPoint: NSMakePoint(-0.64, -39.93) controlPoint1: NSMakePoint(5.08, -38.9) controlPoint2: NSMakePoint(3.43, -39.67)];
            [path lineToPoint: NSMakePoint(-0.64, -43)];
            [path lineToPoint: NSMakePoint(30, -43)];
            [path closePath];
            [path moveToPoint: NSMakePoint(19.61, 45.21)];
            [path curveToPoint: NSMakePoint(28.18, 37.17) controlPoint1: NSMakePoint(22.92, 41.68) controlPoint2: NSMakePoint(25.77, 39)];
            [path curveToPoint: NSMakePoint(35, 33.07) controlPoint1: NSMakePoint(30.59, 35.34) controlPoint2: NSMakePoint(32.86, 33.97)];
            [path lineToPoint: NSMakePoint(35, 31.43)];
            [path curveToPoint: NSMakePoint(27.85, 26.96) controlPoint1: NSMakePoint(32.54, 30.26) controlPoint2: NSMakePoint(30.16, 28.77)];
            [path curveToPoint: NSMakePoint(19.58, 19) controlPoint1: NSMakePoint(25.54, 25.15) controlPoint2: NSMakePoint(22.78, 22.5)];
            [path lineToPoint: NSMakePoint(16.71, 19)];
            [path curveToPoint: NSMakePoint(24.05, 30.26) controlPoint1: NSMakePoint(19.04, 23.88) controlPoint2: NSMakePoint(21.49, 27.64)];
            [path lineToPoint: NSMakePoint(-35.37, 30.26)];
            [path lineToPoint: NSMakePoint(-35.37, 33.94)];
            [path lineToPoint: NSMakePoint(24.05, 33.94)];
            [path curveToPoint: NSMakePoint(20.1, 39.19) controlPoint1: NSMakePoint(22.16, 36.3) controlPoint2: NSMakePoint(20.84, 38.05)];
            [path curveToPoint: NSMakePoint(16.78, 45.21) controlPoint1: NSMakePoint(19.35, 40.33) controlPoint2: NSMakePoint(18.25, 42.34)];
            [path lineToPoint: NSMakePoint(19.61, 45.21)];
            [path closePath];
            
            break;
            
        case 12:
            
            [path moveToPoint: NSMakePoint(-3.72, -42.74)];
            [path lineToPoint: NSMakePoint(-16.16, -0.98)];
            [path lineToPoint: NSMakePoint(-24.19, -5.89)];
            [path lineToPoint: NSMakePoint(-27.77, 0.45)];
            [path lineToPoint: NSMakePoint(-9.91, 10.64)];
            [path lineToPoint: NSMakePoint(1.47, -31.54)];
            [path lineToPoint: NSMakePoint(26.07, 46.44)];
            [path lineToPoint: NSMakePoint(33.78, 46.44)];
            [path lineToPoint: NSMakePoint(6.06, -42.74)];
            [path lineToPoint: NSMakePoint(-3.72, -42.74)];
            [path closePath];
            
            break;
            
        case 13:
            
            [path moveToPoint: NSMakePoint(38, 26)];
            [path lineToPoint: NSMakePoint(38, 7.31)];
            [path lineToPoint: NSMakePoint(-39, 7.31)];
            [path lineToPoint: NSMakePoint(-39, 26)];
            [path lineToPoint: NSMakePoint(38, 26)];
            [path closePath];
            [path moveToPoint: NSMakePoint(38, -7.19)];
            [path lineToPoint: NSMakePoint(38, -25.88)];
            [path lineToPoint: NSMakePoint(-39, -25.88)];
            [path lineToPoint: NSMakePoint(-39, -7.19)];
            [path lineToPoint: NSMakePoint(38, -7.19)];
            [path closePath];
            
            break;
            
        case 14:
            
            [path moveToPoint: NSMakePoint(11, 24.5)];
            [path curveToPoint: NSMakePoint(0.5, 14) controlPoint1: NSMakePoint(11, 18.7) controlPoint2: NSMakePoint(6.3, 14)];
            [path curveToPoint: NSMakePoint(-10, 24.5) controlPoint1: NSMakePoint(-5.3, 14) controlPoint2: NSMakePoint(-10, 18.7)];
            [path curveToPoint: NSMakePoint(0.5, 35) controlPoint1: NSMakePoint(-10, 30.3) controlPoint2: NSMakePoint(-5.3, 35)];
            [path curveToPoint: NSMakePoint(11, 24.5) controlPoint1: NSMakePoint(6.3, 35) controlPoint2: NSMakePoint(11, 30.3)];
            [path closePath];
            [path moveToPoint: NSMakePoint(-13, -22.5)];
            [path curveToPoint: NSMakePoint(-23.5, -33) controlPoint1: NSMakePoint(-13, -28.3) controlPoint2: NSMakePoint(-17.7, -33)];
            [path curveToPoint: NSMakePoint(-34, -22.5) controlPoint1: NSMakePoint(-29.3, -33) controlPoint2: NSMakePoint(-34, -28.3)];
            [path curveToPoint: NSMakePoint(-23.5, -12) controlPoint1: NSMakePoint(-34, -16.7) controlPoint2: NSMakePoint(-29.3, -12)];
            [path curveToPoint: NSMakePoint(-13, -22.5) controlPoint1: NSMakePoint(-17.7, -12) controlPoint2: NSMakePoint(-13, -16.7)];
            [path closePath];
            [path moveToPoint: NSMakePoint(36, -22.5)];
            [path curveToPoint: NSMakePoint(25.5, -33) controlPoint1: NSMakePoint(36, -28.3) controlPoint2: NSMakePoint(31.3, -33)];
            [path curveToPoint: NSMakePoint(15, -22.5) controlPoint1: NSMakePoint(19.7, -33) controlPoint2: NSMakePoint(15, -28.3)];
            [path curveToPoint: NSMakePoint(25.5, -12) controlPoint1: NSMakePoint(15, -16.7) controlPoint2: NSMakePoint(19.7, -12)];
            [path curveToPoint: NSMakePoint(36, -22.5) controlPoint1: NSMakePoint(31.3, -12) controlPoint2: NSMakePoint(36, -16.7)];
            [path closePath];
            
            break;
            
        case 15:
            
            [path moveToPoint: NSMakePoint(-42, 25.7)];
            [path lineToPoint: NSMakePoint(4.77, 25.7)];
            [path lineToPoint: NSMakePoint(14.32, 43)];
            [path lineToPoint: NSMakePoint(33.72, 43)];
            [path lineToPoint: NSMakePoint(23.86, 25.7)];
            [path lineToPoint: NSMakePoint(42, 25.7)];
            [path lineToPoint: NSMakePoint(42, 8.96)];
            [path lineToPoint: NSMakePoint(14.87, 8.96)];
            [path lineToPoint: NSMakePoint(4.61, -9.12)];
            [path lineToPoint: NSMakePoint(42, -9.12)];
            [path lineToPoint: NSMakePoint(42, -25.7)];
            [path lineToPoint: NSMakePoint(-4.61, -25.7)];
            [path lineToPoint: NSMakePoint(-14.32, -43)];
            [path lineToPoint: NSMakePoint(-33.56, -43)];
            [path lineToPoint: NSMakePoint(-23.86, -25.7)];
            [path lineToPoint: NSMakePoint(-42, -25.7)];
            [path lineToPoint: NSMakePoint(-42, -9.12)];
            [path lineToPoint: NSMakePoint(-14.71, -9.12)];
            [path lineToPoint: NSMakePoint(-4.61, 8.96)];
            [path lineToPoint: NSMakePoint(-42, 8.96)];
            [path lineToPoint: NSMakePoint(-42, 25.7)];
            [path closePath];
            
            break;
            
        case 16:
            
            [path moveToPoint: NSMakePoint(-38.08, 10.4)];
            [path curveToPoint: NSMakePoint(-32.55, 30.12) controlPoint1: NSMakePoint(-37.8, 20.38) controlPoint2: NSMakePoint(-35.95, 26.95)];
            [path curveToPoint: NSMakePoint(-13.52, 34.52) controlPoint1: NSMakePoint(-29.19, 33.15) controlPoint2: NSMakePoint(-22.85, 34.62)];
            [path curveToPoint: NSMakePoint(7.7, 33.81) controlPoint1: NSMakePoint(-8.88, 34.52) controlPoint2: NSMakePoint(-1.81, 34.29)];
            [path curveToPoint: NSMakePoint(28.78, 33.03) controlPoint1: NSMakePoint(17.31, 33.29) controlPoint2: NSMakePoint(24.34, 33.03)];
            [path curveToPoint: NSMakePoint(35.74, 38) controlPoint1: NSMakePoint(33.42, 33.03) controlPoint2: NSMakePoint(35.74, 34.69)];
            [path lineToPoint: NSMakePoint(40, 38)];
            [path curveToPoint: NSMakePoint(36.31, 20.83) controlPoint1: NSMakePoint(39.67, 29.2) controlPoint2: NSMakePoint(38.44, 23.48)];
            [path curveToPoint: NSMakePoint(23.25, 16.78) controlPoint1: NSMakePoint(34.18, 18.13) controlPoint2: NSMakePoint(29.83, 16.78)];
            [path curveToPoint: NSMakePoint(22.82, -22.88) controlPoint1: NSMakePoint(23.15, 4.3) controlPoint2: NSMakePoint(23.01, -8.93)];
            [path curveToPoint: NSMakePoint(23.82, -26.92) controlPoint1: NSMakePoint(22.82, -24.35) controlPoint2: NSMakePoint(23.15, -25.69)];
            [path curveToPoint: NSMakePoint(27.29, -29.27) controlPoint1: NSMakePoint(24.62, -28.49) controlPoint2: NSMakePoint(25.78, -29.27)];
            [path curveToPoint: NSMakePoint(32.83, -23.73) controlPoint1: NSMakePoint(29.94, -29.17) controlPoint2: NSMakePoint(31.79, -27.33)];
            [path curveToPoint: NSMakePoint(34.46, -12.24) controlPoint1: NSMakePoint(33.82, -20.37) controlPoint2: NSMakePoint(34.37, -16.54)];
            [path lineToPoint: NSMakePoint(39.5, -12.24)];
            [path curveToPoint: NSMakePoint(35.03, -30.61) controlPoint1: NSMakePoint(39.22, -20.18) controlPoint2: NSMakePoint(37.73, -26.31)];
            [path curveToPoint: NSMakePoint(19.91, -37) controlPoint1: NSMakePoint(32.33, -34.87) controlPoint2: NSMakePoint(27.29, -37)];
            [path curveToPoint: NSMakePoint(7.13, -30.76) controlPoint1: NSMakePoint(13.9, -36.91) controlPoint2: NSMakePoint(9.64, -34.82)];
            [path curveToPoint: NSMakePoint(3.16, -16.64) controlPoint1: NSMakePoint(4.39, -26.88) controlPoint2: NSMakePoint(3.06, -22.17)];
            [path curveToPoint: NSMakePoint(3.94, 16.78) controlPoint1: NSMakePoint(3.4, -4.05) controlPoint2: NSMakePoint(3.66, 7.09)];
            [path lineToPoint: NSMakePoint(-12.95, 16.78)];
            [path curveToPoint: NSMakePoint(-16.57, -24.16) controlPoint1: NSMakePoint(-12.95, -1.9) controlPoint2: NSMakePoint(-14.16, -15.55)];
            [path curveToPoint: NSMakePoint(-28.78, -37) controlPoint1: NSMakePoint(-19.08, -32.72) controlPoint2: NSMakePoint(-23.15, -37)];
            [path curveToPoint: NSMakePoint(-37.23, -32.46) controlPoint1: NSMakePoint(-32.66, -36.91) controlPoint2: NSMakePoint(-35.48, -35.39)];
            [path curveToPoint: NSMakePoint(-40, -22.88) controlPoint1: NSMakePoint(-39.08, -29.67) controlPoint2: NSMakePoint(-40, -26.47)];
            [path curveToPoint: NSMakePoint(-39.72, -15.93) controlPoint1: NSMakePoint(-40, -20.37) controlPoint2: NSMakePoint(-39.91, -18.05)];
            [path lineToPoint: NSMakePoint(-34.89, -15.93)];
            [path curveToPoint: NSMakePoint(-34.04, -21.11) controlPoint1: NSMakePoint(-34.98, -17.44) controlPoint2: NSMakePoint(-34.7, -19.17)];
            [path curveToPoint: NSMakePoint(-30.42, -24.51) controlPoint1: NSMakePoint(-33.47, -23.23) controlPoint2: NSMakePoint(-32.26, -24.37)];
            [path curveToPoint: NSMakePoint(-25.73, -22.45) controlPoint1: NSMakePoint(-28.76, -24.51) controlPoint2: NSMakePoint(-27.2, -23.83)];
            [path curveToPoint: NSMakePoint(-21.83, -16.07) controlPoint1: NSMakePoint(-24.27, -21.18) controlPoint2: NSMakePoint(-22.96, -19.05)];
            [path curveToPoint: NSMakePoint(-18.07, 16.78) controlPoint1: NSMakePoint(-19.41, -10.25) controlPoint2: NSMakePoint(-18.16, 0.7)];
            [path lineToPoint: NSMakePoint(-25.73, 16.78)];
            [path curveToPoint: NSMakePoint(-31.84, 15.22) controlPoint1: NSMakePoint(-28.76, 16.78) controlPoint2: NSMakePoint(-30.8, 16.26)];
            [path curveToPoint: NSMakePoint(-33.9, 10.4) controlPoint1: NSMakePoint(-32.93, 14.04) controlPoint2: NSMakePoint(-33.61, 12.43)];
            [path lineToPoint: NSMakePoint(-38.08, 10.4)];
            [path closePath];
            
            break;
            
        default:
            
            break;
    }
    
    NSAffineTransform * transform = [NSAffineTransform transform];
    
    [transform translateXBy: self.x yBy: self.y];
    [transform scaleXBy: self.scaling yBy: self.scaling];
    [transform rotateByDegrees: self.rotation];
    
    [path transformUsingAffineTransform: transform];
    
    if ( self.type == TypeSolid )
    {
        [[[globals.colours objectForKey: self.colour] colorWithAlphaComponent:self.opacity] setFill];
        
        [path fill];
    }
    else
    {
        if ( self.subStateOpacity > 0.0 )
        {
            [[[globals.colours objectForKey: self.subStateColourFill] colorWithAlphaComponent:self.subStateOpacity] setFill];
            
            [path fill];
        }
        
        [[[globals.colours objectForKey: self.colour] colorWithAlphaComponent:self.opacity] setStroke];
        
        [path stroke];
    }
    
    if ( self.subStateOpacity > 0.0 )
    {
        [[[globals.colours objectForKey: self.subStateColourStroke] colorWithAlphaComponent:self.subStateOpacity] setStroke];
        
        [path setLineWidth:self.subStateOpacity * 3 * self.scaling];
        
        [path stroke];
    }
}

@end
