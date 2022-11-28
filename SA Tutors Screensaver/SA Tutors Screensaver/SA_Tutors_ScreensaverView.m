#import "SA_Tutors_ScreensaverView.h"

@implementation SA_Tutors_ScreensaverView

static NSString * const BundleIdentifier = @"com.charlierobin.SATutorsScreensaver";

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    
    ScreenSaverDefaults * defaults;
    
    if (self)
    {
        defaults = [ScreenSaverDefaults defaultsForModuleWithName:BundleIdentifier];
        
        [defaults registerDefaults:[NSDictionary dictionaryWithObjectsAndKeys:
                                    @"20", @"NumberOfItems",
                                    @"YES", @"FilledOnly",
                                    @"YES", @"OutlinedOnly",
                                    @"YES", @"DrawLogo",
                                    @"YES", @"DrawEmailAddress",
                                    @"NO", @"DrawWebAddress",
                                    @"NO", @"DrawTelephoneNumber",
                                    nil]];
        
        [self setAnimationTimeInterval:1/30.0];
    }
    
    // scale comes from my monitor width in pixels, where I got everything in the rough proportion I liked, and then used this as a magic number everywhere else
    
    globals.defaults = defaults;
    globals.frame = self.frame;
    globals.scale = self.frame.size.width / 2560;
    globals.random = [[GKARC4RandomSource alloc] init];
    globals.colours = [NSMutableDictionary new];
    
    [ globals.colours setValue: [NSColor colorWithRed: 0.543 green: 0.787 blue: 0.326 alpha: 1] forKey: MID_GREEN_SA ];
    [ globals.colours setValue: [NSColor colorWithRed: 0.778 green: 0.881 blue: 0.671 alpha: 1] forKey: LIGHT_GREEN_TUTORS ];
    [ globals.colours setValue: [NSColor colorWithRed: 0.38 green: 0.58 blue: 0.18 alpha: 1] forKey: DARK_GREEN ];
    
    items = [NSMutableArray new];
    
    [NSTimer scheduledTimerWithTimeInterval: 5 target: self selector: @selector( timerFireMethod: ) userInfo: nil repeats: YES];
    
    counter = 0;
    
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)updateDebugDisplay:(NSString*)theString
{
    NSColor* fillColor = [NSColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    NSRect debugTextRect = NSMakeRect( 10 * globals.scale, 12 * globals.scale, self.frame.size.width, 16 * globals.scale );
    
    NSMutableParagraphStyle* debugTextStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [debugTextStyle setAlignment: NSLeftTextAlignment];
    
    NSDictionary* debugTextFontAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                             [NSFont fontWithName: @"Helvetica" size: 12 * globals.scale ],
                                             NSFontAttributeName,
                                             fillColor,
                                             NSForegroundColorAttributeName,
                                             debugTextStyle,
                                             NSParagraphStyleAttributeName,
                                             nil];
    
    [theString drawInRect: debugTextRect withAttributes: debugTextFontAttributes];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
//    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: self.frame];
//    [[NSColor colorWithRed: 1 green: 1 blue: 1 alpha: 1] setFill];
//    [rectanglePath fill];
    
    for (Item * item in items)
    {
        [ item draw:globals ];
    }
    
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: [NSColor colorWithRed: 0 green: 0 blue: 0 alpha: 1]];
    [shadow setShadowBlurRadius: 5 * globals.scale];
    
    [shadow set];
    
    if ( logoCaption ) [logoCaption draw: globals];
    if ( emailCaption ) [emailCaption draw: globals];
    if ( wwwCaption ) [wwwCaption draw: globals];
    if ( telephoneNumberCaption ) [telephoneNumberCaption draw: globals];
    
    counter++;
    
//    [self updateDebugDisplay:[NSString stringWithFormat: @"There are %d items, running at %d fps", (int)[items count], fps] ];
}

- (void)animateOneFrame
{
    ScreenSaverDefaults * defaults = [ ScreenSaverDefaults defaultsForModuleWithName: BundleIdentifier ];
    
    if ( items.count < [defaults integerForKey:@"NumberOfItems"] )
    {
        if ( [ globals.random nextIntWithUpperBound: 100 ] > 95 )
        {
            [items addObject: [[Item alloc] init: globals]];
        }
    }
    
    {
        if ( [defaults boolForKey:@"DrawLogo"] && logoCaption == NULL )
        {
            if ( [ globals.random nextIntWithUpperBound: 100 ] > 98 )
            {
                logoCaption = [[CaptionLogo alloc] init: globals];
            }
        }
        else
        {
            [logoCaption update: globals];
            
            if ( logoCaption.remove ) logoCaption = NULL;
        }
        
        if ( [defaults boolForKey:@"DrawEmailAddress"] && emailCaption == NULL )
        {
            if ( [ globals.random nextIntWithUpperBound: 100 ] > 98 )
            {
                emailCaption = [[CaptionEmail alloc] init: globals];
            }
        }
        else
        {
            [emailCaption update: globals];
            
            if ( emailCaption.remove ) emailCaption = NULL;
        }
        
        if ( [defaults boolForKey:@"DrawWebAddress"] && wwwCaption == NULL )
        {
            if ( [ globals.random nextIntWithUpperBound: 100 ] > 98 )
            {
                wwwCaption = [[CaptionWWW alloc] init: globals];
            }
        }
        else
        {
            [wwwCaption update: globals];
            
            if ( wwwCaption.remove ) wwwCaption = NULL;
        }
        
        if ( [defaults boolForKey:@"DrawTelephoneNumber"] && telephoneNumberCaption == NULL )
        {
            if ( [ globals.random nextIntWithUpperBound: 100 ] > 98 )
            {
                telephoneNumberCaption = [[CaptionTelephoneNumber alloc] init: globals];
            }
        }
        else
        {
            [telephoneNumberCaption update: globals];
            
            if ( telephoneNumberCaption.remove ) telephoneNumberCaption = NULL;
        }
    }
    
    NSMutableArray *toRemove = [NSMutableArray new];
    
    for (Item * item in items)
    {
        [item update: globals];
        
        if (item.remove)
        {
            [toRemove addObject:item];
        }
    }
    
    for (Item * item in toRemove)
    {
        [items removeObject: item];
    }
    
    [self setNeedsDisplay:YES];
}

- (void)timerFireMethod:(NSTimer *)timer
{
    fps = counter / 5;
    
    counter = 0;
}

- (BOOL)hasConfigureSheet
{
    return YES;
}

- (NSWindow*)configureSheet
{
    ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:BundleIdentifier];
    
    if (!configSheet)
    {
        if (![[NSBundle bundleForClass:[self class]] loadNibNamed:@"ConfigureSheet" owner:self topLevelObjects:nil])
        {
            NSBeep();
        }
    }
    
    [NumberOfItems setIntValue: (int)[defaults integerForKey:@"NumberOfItems"]];
    
    if ( [defaults boolForKey:@"OutlinedOnly"] && [defaults boolForKey:@"FilledOnly"] )
    {
        [MixtureOfOutlinedAndFilled setState:YES];
    }
    else
    {
        [OutlinedOnly setState:[defaults boolForKey:@"OutlinedOnly"]];
        [FilledOnly setState:[defaults boolForKey:@"FilledOnly"]];
    }
    
    [DrawLogo setState:[defaults boolForKey:@"DrawLogo"]];
    [DrawEmailAddress setState:[defaults boolForKey:@"DrawEmailAddress"]];
    [DrawWebAddress setState:[defaults boolForKey:@"DrawWebAddress"]];
    [DrawTelephoneNumber setState:[defaults boolForKey:@"DrawTelephoneNumber"]];
    
    return configSheet;
}

- (IBAction)cancelClick:(id)sender
{
  [[NSApplication sharedApplication] endSheet:configSheet];
}

- (IBAction) okClick: (id)sender
{
    ScreenSaverDefaults * defaults = [ScreenSaverDefaults defaultsForModuleWithName:BundleIdentifier];
    
    [defaults setInteger:[NumberOfItems intValue] forKey:@"NumberOfItems"];
    
    if ( [MixtureOfOutlinedAndFilled state] )
    {
        [defaults setBool:YES forKey:@"OutlinedOnly"];
        [defaults setBool:YES forKey:@"FilledOnly"];
    }
    else
    {
        [defaults setBool:[OutlinedOnly state] forKey:@"OutlinedOnly"];
        [defaults setBool:[FilledOnly state] forKey:@"FilledOnly"];
    }
    
    [defaults setBool:[DrawLogo state] forKey:@"DrawLogo"];
    [defaults setBool:[DrawEmailAddress state] forKey:@"DrawEmailAddress"];
    [defaults setBool:[DrawWebAddress state] forKey:@"DrawWebAddress"];
    [defaults setBool:[DrawTelephoneNumber state] forKey:@"DrawTelephoneNumber"];
    
    [defaults synchronize];
    
    [[NSApplication sharedApplication] endSheet:configSheet];
}

- (IBAction)RadioTester:(id)sender {
}
@end
