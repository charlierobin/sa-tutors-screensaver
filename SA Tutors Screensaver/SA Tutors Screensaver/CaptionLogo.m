#import "CaptionLogo.h"

@implementation CaptionLogo

- (void)draw:(struct Globals) globals
{
    NSAffineTransform *transform = [NSAffineTransform transform];
    
    [transform translateXBy: self.x yBy: self.y];
    [transform scaleXBy: self.scaling yBy: self.scaling];
    
    NSBezierPath* saPath = [NSBezierPath bezierPath];
    [saPath moveToPoint: NSMakePoint(-736.23, -52.97)];
    [saPath curveToPoint: NSMakePoint(-658.5, -115) controlPoint1: NSMakePoint(-736.23, -103.56) controlPoint2: NSMakePoint(-715.85, -115)];
    [saPath curveToPoint: NSMakePoint(-581.47, -44.31) controlPoint1: NSMakePoint(-602.2, -115) controlPoint2: NSMakePoint(-581.47, -103.56)];
    [saPath curveToPoint: NSMakePoint(-656.78, 27.76) controlPoint1: NSMakePoint(-581.47, 16.68) controlPoint2: NSMakePoint(-594.94, 23.61)];
    [saPath curveToPoint: NSMakePoint(-709.28, 72.81) controlPoint1: NSMakePoint(-703.06, 30.88) controlPoint2: NSMakePoint(-709.28, 37.12)];
    [saPath curveToPoint: NSMakePoint(-658.16, 117.17) controlPoint1: NSMakePoint(-709.28, 109.89) controlPoint2: NSMakePoint(-705.48, 117.17)];
    [saPath curveToPoint: NSMakePoint(-605.31, 76.28) controlPoint1: NSMakePoint(-616.71, 117.17) controlPoint2: NSMakePoint(-605.31, 109.2)];
    [saPath lineToPoint: NSMakePoint(-605.31, 70.73)];
    [saPath lineToPoint: NSMakePoint(-583.2, 70.73)];
    [saPath curveToPoint: NSMakePoint(-658.16, 141.42) controlPoint1: NSMakePoint(-584.58, 128.95) controlPoint2: NSMakePoint(-597.36, 141.42)];
    [saPath curveToPoint: NSMakePoint(-733.46, 72.81) controlPoint1: NSMakePoint(-714.81, 141.42) controlPoint2: NSMakePoint(-733.46, 133.8)];
    [saPath curveToPoint: NSMakePoint(-680.96, 6.63) controlPoint1: NSMakePoint(-733.46, 24.99) controlPoint2: NSMakePoint(-723.45, 10.09)];
    [saPath lineToPoint: NSMakePoint(-655.4, 4.55)];
    [saPath curveToPoint: NSMakePoint(-605.65, -40.85) controlPoint1: NSMakePoint(-605.65, 0.39) controlPoint2: NSMakePoint(-605.65, -8.97)];
    [saPath curveToPoint: NSMakePoint(-658.85, -90.74) controlPoint1: NSMakePoint(-605.65, -88.32) controlPoint2: NSMakePoint(-611.87, -90.74)];
    [saPath curveToPoint: NSMakePoint(-714.12, -48.12) controlPoint1: NSMakePoint(-705.83, -90.74) controlPoint2: NSMakePoint(-714.12, -85.55)];
    [saPath lineToPoint: NSMakePoint(-714.12, -33.57)];
    [saPath lineToPoint: NSMakePoint(-736.23, -33.57)];
    [saPath lineToPoint: NSMakePoint(-736.23, -52.97)];
    [saPath closePath];
    [saPath moveToPoint: NSMakePoint(-465.41, 114.39)];
    [saPath lineToPoint: NSMakePoint(-468.86, 114.39)];
    [saPath lineToPoint: NSMakePoint(-513.42, -34.95)];
    [saPath lineToPoint: NSMakePoint(-420.85, -34.95)];
    [saPath curveToPoint: NSMakePoint(-464.67, 111.92) controlPoint1: NSMakePoint(-420.85, -34.95) controlPoint2: NSMakePoint(-458.88, 92.5)];
    [saPath curveToPoint: NSMakePoint(-465.41, 114.39) controlPoint1: NSMakePoint(-465.15, 113.53) controlPoint2: NSMakePoint(-465.41, 114.39)];
    [saPath closePath];
    [saPath moveToPoint: NSMakePoint(-450.21, 138.65)];
    [saPath curveToPoint: NSMakePoint(-371.8, -112.23) controlPoint1: NSMakePoint(-450.21, 138.65) controlPoint2: NSMakePoint(-371.8, -112.23)];
    [saPath lineToPoint: NSMakePoint(-397.01, -112.23)];
    [saPath lineToPoint: NSMakePoint(-413.25, -59.21)];
    [saPath lineToPoint: NSMakePoint(-521.02, -59.21)];
    [saPath lineToPoint: NSMakePoint(-537.26, -112.23)];
    [saPath lineToPoint: NSMakePoint(-562.47, -112.23)];
    [saPath lineToPoint: NSMakePoint(-484.06, 138.65)];
    [saPath lineToPoint: NSMakePoint(-450.21, 138.65)];
    [saPath lineToPoint: NSMakePoint(-450.21, 138.65)];
    [saPath closePath];
    
    [saPath transformUsingAffineTransform: transform];
    
    [[[globals.colours objectForKey:MID_GREEN_SA] colorWithAlphaComponent:self.opacity] setFill];
    
    [saPath fill];

    NSBezierPath* tutorsPath = [NSBezierPath bezierPath];
    [tutorsPath moveToPoint: NSMakePoint(-316.18, -112.23)];
    [tutorsPath lineToPoint: NSMakePoint(-292, -112.23)];
    [tutorsPath lineToPoint: NSMakePoint(-292, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(-223.61, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(-223.61, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-384.58, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-384.58, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(-316.18, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(-316.18, -112.23)];
    [tutorsPath closePath];
    [tutorsPath moveToPoint: NSMakePoint(-200.12, -48.12)];
    [tutorsPath curveToPoint: NSMakePoint(-118.94, -115) controlPoint1: NSMakePoint(-200.12, -101.83) controlPoint2: NSMakePoint(-177.32, -115)];
    [tutorsPath curveToPoint: NSMakePoint(-37.07, -48.12) controlPoint1: NSMakePoint(-59.53, -115) controlPoint2: NSMakePoint(-37.07, -101.83)];
    [tutorsPath lineToPoint: NSMakePoint(-37.07, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-61.25, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-61.25, -55.4)];
    [tutorsPath curveToPoint: NSMakePoint(-118.94, -90.74) controlPoint1: NSMakePoint(-61.25, -82.43) controlPoint2: NSMakePoint(-74.04, -90.74)];
    [tutorsPath curveToPoint: NSMakePoint(-175.94, -55.4) controlPoint1: NSMakePoint(-163.16, -90.74) controlPoint2: NSMakePoint(-175.94, -82.43)];
    [tutorsPath lineToPoint: NSMakePoint(-175.94, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-200.12, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-200.12, -48.12)];
    [tutorsPath closePath];
    [tutorsPath moveToPoint: NSMakePoint(54.81, -112.23)];
    [tutorsPath lineToPoint: NSMakePoint(78.99, -112.23)];
    [tutorsPath lineToPoint: NSMakePoint(78.99, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(147.39, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(147.39, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-13.58, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(-13.58, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(54.81, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(54.81, -112.23)];
    [tutorsPath closePath];
    [tutorsPath moveToPoint: NSMakePoint(581.25, -52.97)];
    [tutorsPath curveToPoint: NSMakePoint(658.97, -115) controlPoint1: NSMakePoint(581.25, -103.56) controlPoint2: NSMakePoint(601.63, -115)];
    [tutorsPath curveToPoint: NSMakePoint(736, -44.31) controlPoint1: NSMakePoint(715.27, -115) controlPoint2: NSMakePoint(736, -103.56)];
    [tutorsPath curveToPoint: NSMakePoint(660.7, 27.76) controlPoint1: NSMakePoint(736, 16.68) controlPoint2: NSMakePoint(722.53, 23.61)];
    [tutorsPath curveToPoint: NSMakePoint(608.19, 72.81) controlPoint1: NSMakePoint(614.41, 30.88) controlPoint2: NSMakePoint(608.19, 37.12)];
    [tutorsPath curveToPoint: NSMakePoint(659.31, 117.17) controlPoint1: NSMakePoint(608.19, 109.89) controlPoint2: NSMakePoint(611.99, 117.17)];
    [tutorsPath curveToPoint: NSMakePoint(712.17, 76.28) controlPoint1: NSMakePoint(700.77, 117.17) controlPoint2: NSMakePoint(712.17, 109.2)];
    [tutorsPath lineToPoint: NSMakePoint(712.17, 70.73)];
    [tutorsPath lineToPoint: NSMakePoint(734.27, 70.73)];
    [tutorsPath curveToPoint: NSMakePoint(659.31, 141.42) controlPoint1: NSMakePoint(732.89, 128.95) controlPoint2: NSMakePoint(720.11, 141.42)];
    [tutorsPath curveToPoint: NSMakePoint(584.01, 72.81) controlPoint1: NSMakePoint(602.66, 141.42) controlPoint2: NSMakePoint(584.01, 133.8)];
    [tutorsPath curveToPoint: NSMakePoint(636.52, 6.63) controlPoint1: NSMakePoint(584.01, 24.99) controlPoint2: NSMakePoint(594.03, 10.09)];
    [tutorsPath lineToPoint: NSMakePoint(662.08, 4.55)];
    [tutorsPath curveToPoint: NSMakePoint(711.82, -40.85) controlPoint1: NSMakePoint(711.82, 0.39) controlPoint2: NSMakePoint(711.82, -8.97)];
    [tutorsPath curveToPoint: NSMakePoint(658.62, -90.74) controlPoint1: NSMakePoint(711.82, -88.32) controlPoint2: NSMakePoint(705.6, -90.74)];
    [tutorsPath curveToPoint: NSMakePoint(603.35, -48.12) controlPoint1: NSMakePoint(611.64, -90.74) controlPoint2: NSMakePoint(603.35, -85.55)];
    [tutorsPath lineToPoint: NSMakePoint(603.35, -33.57)];
    [tutorsPath lineToPoint: NSMakePoint(581.25, -33.57)];
    [tutorsPath lineToPoint: NSMakePoint(581.25, -52.97)];
    [tutorsPath closePath];
    [tutorsPath moveToPoint: NSMakePoint(255.51, 117.17)];
    [tutorsPath curveToPoint: NSMakePoint(191.6, 54.1) controlPoint1: NSMakePoint(198.86, 117.17) controlPoint2: NSMakePoint(191.6, 109.54)];
    [tutorsPath lineToPoint: NSMakePoint(191.6, -27.68)];
    [tutorsPath curveToPoint: NSMakePoint(255.51, -90.74) controlPoint1: NSMakePoint(191.6, -83.12) controlPoint2: NSMakePoint(198.86, -90.74)];
    [tutorsPath curveToPoint: NSMakePoint(303.83, -83.75) controlPoint1: NSMakePoint(279.27, -90.74) controlPoint2: NSMakePoint(294.34, -89.4)];
    [tutorsPath curveToPoint: NSMakePoint(319.41, -27.68) controlPoint1: NSMakePoint(316.97, -75.93) controlPoint2: NSMakePoint(319.41, -59.86)];
    [tutorsPath lineToPoint: NSMakePoint(319.41, 54.1)];
    [tutorsPath curveToPoint: NSMakePoint(255.51, 117.17) controlPoint1: NSMakePoint(319.41, 109.54) controlPoint2: NSMakePoint(312.16, 117.17)];
    [tutorsPath closePath];
    [tutorsPath moveToPoint: NSMakePoint(343.59, 55.49)];
    [tutorsPath lineToPoint: NSMakePoint(343.59, -29.06)];
    [tutorsPath curveToPoint: NSMakePoint(255.51, -115) controlPoint1: NSMakePoint(343.59, -102.53) controlPoint2: NSMakePoint(321.14, -115)];
    [tutorsPath curveToPoint: NSMakePoint(185.72, -98.53) controlPoint1: NSMakePoint(221.78, -115) controlPoint2: NSMakePoint(199.45, -111.71)];
    [tutorsPath curveToPoint: NSMakePoint(167.42, -29.06) controlPoint1: NSMakePoint(172.73, -86.07) controlPoint2: NSMakePoint(167.42, -64.77)];
    [tutorsPath lineToPoint: NSMakePoint(167.42, 55.49)];
    [tutorsPath curveToPoint: NSMakePoint(255.51, 141.42) controlPoint1: NSMakePoint(167.42, 128.95) controlPoint2: NSMakePoint(189.87, 141.42)];
    [tutorsPath curveToPoint: NSMakePoint(343.59, 55.49) controlPoint1: NSMakePoint(321.14, 141.42) controlPoint2: NSMakePoint(343.59, 128.95)];
    [tutorsPath closePath];
    [tutorsPath moveToPoint: NSMakePoint(477.27, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(406.46, 114.39)];
    [tutorsPath lineToPoint: NSMakePoint(406.46, 12.86)];
    [tutorsPath lineToPoint: NSMakePoint(484.87, 12.86)];
    [tutorsPath curveToPoint: NSMakePoint(520.8, 63.46) controlPoint1: NSMakePoint(510.09, 12.86) controlPoint2: NSMakePoint(520.8, 28.8)];
    [tutorsPath curveToPoint: NSMakePoint(477.27, 114.39) controlPoint1: NSMakePoint(520.8, 110.58) controlPoint2: NSMakePoint(514.58, 114.39)];
    [tutorsPath closePath];
    [tutorsPath moveToPoint: NSMakePoint(544.98, 67.61)];
    [tutorsPath curveToPoint: NSMakePoint(513.2, 1.08) controlPoint1: NSMakePoint(544.98, 24.3) controlPoint2: NSMakePoint(536, 6.97)];
    [tutorsPath lineToPoint: NSMakePoint(513.2, 0.39)];
    [tutorsPath curveToPoint: NSMakePoint(540.83, -43.62) controlPoint1: NSMakePoint(532.89, -5.15) controlPoint2: NSMakePoint(540.83, -20.05)];
    [tutorsPath lineToPoint: NSMakePoint(540.83, -112.23)];
    [tutorsPath lineToPoint: NSMakePoint(516.65, -112.23)];
    [tutorsPath lineToPoint: NSMakePoint(516.65, -55.05)];
    [tutorsPath curveToPoint: NSMakePoint(469.33, -11.39) controlPoint1: NSMakePoint(516.65, -21.79) controlPoint2: NSMakePoint(507.32, -11.39)];
    [tutorsPath lineToPoint: NSMakePoint(406.46, -11.39)];
    [tutorsPath lineToPoint: NSMakePoint(406.46, -112.23)];
    [tutorsPath lineToPoint: NSMakePoint(382.28, -112.23)];
    [tutorsPath curveToPoint: NSMakePoint(382.28, -54.21) controlPoint1: NSMakePoint(382.28, -112.23) controlPoint2: NSMakePoint(382.28, -87.81)];
    [tutorsPath curveToPoint: NSMakePoint(382.28, 138.65) controlPoint1: NSMakePoint(382.28, 19.89) controlPoint2: NSMakePoint(382.28, 138.65)];
    [tutorsPath lineToPoint: NSMakePoint(484.53, 138.65)];
    [tutorsPath curveToPoint: NSMakePoint(544.98, 67.61) controlPoint1: NSMakePoint(528.4, 138.65) controlPoint2: NSMakePoint(544.98, 123.4)];
    [tutorsPath closePath];
    
    [tutorsPath transformUsingAffineTransform: transform];
    
    [[[globals.colours objectForKey:LIGHT_GREEN_TUTORS] colorWithAlphaComponent:self.opacity] setFill];
    
    [tutorsPath fill];
}

@end
