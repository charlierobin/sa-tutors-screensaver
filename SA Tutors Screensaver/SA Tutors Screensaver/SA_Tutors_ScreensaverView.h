#import <ScreenSaver/ScreenSaver.h>

#import <GameKit/GameKit.h>

#import "Item.h"
#import "CaptionLogo.h"
#import "CaptionWWW.h"
#import "CaptionEmail.h"
#import "CaptionTelephoneNumber.h"

@interface SA_Tutors_ScreensaverView : ScreenSaverView
{
    NSMutableArray * items;

    struct Globals globals;
    
    CaptionLogo * logoCaption;
    CaptionWWW * wwwCaption;
    CaptionEmail * emailCaption;
    CaptionTelephoneNumber * telephoneNumberCaption;

    int counter;
    int fps;
    
    IBOutlet id configSheet;
    
    __weak IBOutlet NSSlider * NumberOfItems;
    
    __weak IBOutlet NSButton * MixtureOfOutlinedAndFilled;
    __weak IBOutlet NSButton * OutlinedOnly;
    __weak IBOutlet NSButton * FilledOnly;
    
    __weak IBOutlet NSButtonCell * DrawLogo;
    __weak IBOutlet NSButtonCell * DrawEmailAddress;
    __weak IBOutlet NSButtonCell * DrawWebAddress;
    __weak IBOutlet NSButtonCell * DrawTelephoneNumber;
}

- (IBAction)RadioTester:(id)sender;

@end

