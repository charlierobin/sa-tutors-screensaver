#import "CaptionTelephoneNumber.h"

@implementation CaptionTelephoneNumber

- (void)draw:(struct Globals) globals
{
    NSAffineTransform *transform = [NSAffineTransform transform];
    
    [transform translateXBy: self.x yBy: self.y];
    [transform scaleXBy: self.scaling yBy: self.scaling];
    
    NSBezierPath* path = [NSBezierPath bezierPath];
    [path moveToPoint: NSMakePoint(-622.03, 50.25)];
    [path curveToPoint: NSMakePoint(-680.01, 107.15) controlPoint1: NSMakePoint(-622.03, 100.33) controlPoint2: NSMakePoint(-638.16, 107.15)];
    [path curveToPoint: NSMakePoint(-738, 50.25) controlPoint1: NSMakePoint(-721.86, 107.15) controlPoint2: NSMakePoint(-738, 100.33)];
    [path lineToPoint: NSMakePoint(-738, -23.1)];
    [path curveToPoint: NSMakePoint(-680.01, -80) controlPoint1: NSMakePoint(-738, -73.17) controlPoint2: NSMakePoint(-721.86, -80)];
    [path curveToPoint: NSMakePoint(-622.03, -23.1) controlPoint1: NSMakePoint(-638.16, -80) controlPoint2: NSMakePoint(-622.03, -73.17)];
    [path lineToPoint: NSMakePoint(-622.03, 50.25)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-639.68, -28.41)];
    [path curveToPoint: NSMakePoint(-680.01, -62.3) controlPoint1: NSMakePoint(-639.68, -61.79) controlPoint2: NSMakePoint(-648, -62.3)];
    [path curveToPoint: NSMakePoint(-720.35, -28.41) controlPoint1: NSMakePoint(-712.03, -62.3) controlPoint2: NSMakePoint(-720.35, -61.79)];
    [path lineToPoint: NSMakePoint(-720.35, 55.56)];
    [path curveToPoint: NSMakePoint(-680.01, 89.45) controlPoint1: NSMakePoint(-720.35, 88.94) controlPoint2: NSMakePoint(-712.03, 89.45)];
    [path curveToPoint: NSMakePoint(-639.68, 55.56) controlPoint1: NSMakePoint(-648, 89.45) controlPoint2: NSMakePoint(-639.68, 88.94)];
    [path lineToPoint: NSMakePoint(-639.68, -28.41)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-587.73, -77.98)];
    [path lineToPoint: NSMakePoint(-569.07, -77.98)];
    [path lineToPoint: NSMakePoint(-492.68, 78.32)];
    [path lineToPoint: NSMakePoint(-492.68, 105.13)];
    [path lineToPoint: NSMakePoint(-604.62, 105.13)];
    [path lineToPoint: NSMakePoint(-604.62, 87.43)];
    [path lineToPoint: NSMakePoint(-507.3, 87.43)];
    [path lineToPoint: NSMakePoint(-587.73, -77.98)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-466.7, 13.58)];
    [path lineToPoint: NSMakePoint(-451.57, 13.58)];
    [path curveToPoint: NSMakePoint(-414.51, 29.76) controlPoint1: NSMakePoint(-446.28, 28.25) controlPoint2: NSMakePoint(-437.96, 29.76)];
    [path curveToPoint: NSMakePoint(-373.92, -16.27) controlPoint1: NSMakePoint(-374.42, 29.76) controlPoint2: NSMakePoint(-373.92, 17.88)];
    [path curveToPoint: NSMakePoint(-413.5, -62.3) controlPoint1: NSMakePoint(-373.92, -55.47) controlPoint2: NSMakePoint(-375.43, -62.3)];
    [path curveToPoint: NSMakePoint(-454.09, -25.62) controlPoint1: NSMakePoint(-451.32, -62.3) controlPoint2: NSMakePoint(-454.09, -56.48)];
    [path lineToPoint: NSMakePoint(-470.23, -25.62)];
    [path lineToPoint: NSMakePoint(-470.23, -39.28)];
    [path curveToPoint: NSMakePoint(-415.02, -80) controlPoint1: NSMakePoint(-470.23, -74.44) controlPoint2: NSMakePoint(-445.77, -80)];
    [path curveToPoint: NSMakePoint(-356.27, -16.27) controlPoint1: NSMakePoint(-367.37, -80) controlPoint2: NSMakePoint(-356.27, -71.65)];
    [path curveToPoint: NSMakePoint(-409.47, 47.47) controlPoint1: NSMakePoint(-356.27, 29.51) controlPoint2: NSMakePoint(-363.08, 47.47)];
    [path curveToPoint: NSMakePoint(-448.55, 33.3) controlPoint1: NSMakePoint(-430.14, 47.47) controlPoint2: NSMakePoint(-439.72, 45.7)];
    [path lineToPoint: NSMakePoint(-449.05, 33.3)];
    [path lineToPoint: NSMakePoint(-449.05, 88.94)];
    [path lineToPoint: NSMakePoint(-362.32, 88.94)];
    [path lineToPoint: NSMakePoint(-362.32, 105.13)];
    [path lineToPoint: NSMakePoint(-466.7, 105.13)];
    [path lineToPoint: NSMakePoint(-466.7, 13.58)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-287.86, -77.98)];
    [path lineToPoint: NSMakePoint(-270.21, -77.98)];
    [path lineToPoint: NSMakePoint(-270.21, 105.13)];
    [path lineToPoint: NSMakePoint(-293.65, 105.13)];
    [path lineToPoint: NSMakePoint(-337.52, 50.5)];
    [path lineToPoint: NSMakePoint(-325.67, 39.63)];
    [path lineToPoint: NSMakePoint(-288.36, 87.43)];
    [path lineToPoint: NSMakePoint(-287.86, 87.43)];
    [path lineToPoint: NSMakePoint(-287.86, -77.98)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-223.25, -77.98)];
    [path lineToPoint: NSMakePoint(-204.59, -77.98)];
    [path lineToPoint: NSMakePoint(-128.2, 78.32)];
    [path lineToPoint: NSMakePoint(-128.2, 105.13)];
    [path lineToPoint: NSMakePoint(-240.14, 105.13)];
    [path lineToPoint: NSMakePoint(-240.14, 87.43)];
    [path lineToPoint: NSMakePoint(-142.82, 87.43)];
    [path lineToPoint: NSMakePoint(-223.25, -77.98)];
    [path closePath];
    [path moveToPoint: NSMakePoint(25.22, -77.98)];
    [path lineToPoint: NSMakePoint(42.87, -77.98)];
    [path lineToPoint: NSMakePoint(42.87, 105.13)];
    [path lineToPoint: NSMakePoint(19.42, 105.13)];
    [path lineToPoint: NSMakePoint(-24.45, 50.5)];
    [path lineToPoint: NSMakePoint(-12.6, 39.63)];
    [path lineToPoint: NSMakePoint(24.71, 87.43)];
    [path lineToPoint: NSMakePoint(25.22, 87.43)];
    [path lineToPoint: NSMakePoint(25.22, -77.98)];
    [path closePath];
    [path moveToPoint: NSMakePoint(79.17, 13.58)];
    [path lineToPoint: NSMakePoint(94.3, 13.58)];
    [path curveToPoint: NSMakePoint(131.36, 29.76) controlPoint1: NSMakePoint(99.59, 28.25) controlPoint2: NSMakePoint(107.91, 29.76)];
    [path curveToPoint: NSMakePoint(171.95, -16.27) controlPoint1: NSMakePoint(171.44, 29.76) controlPoint2: NSMakePoint(171.95, 17.88)];
    [path curveToPoint: NSMakePoint(132.37, -62.3) controlPoint1: NSMakePoint(171.95, -55.47) controlPoint2: NSMakePoint(170.44, -62.3)];
    [path curveToPoint: NSMakePoint(91.78, -25.62) controlPoint1: NSMakePoint(94.55, -62.3) controlPoint2: NSMakePoint(91.78, -56.48)];
    [path lineToPoint: NSMakePoint(75.64, -25.62)];
    [path lineToPoint: NSMakePoint(75.64, -39.28)];
    [path curveToPoint: NSMakePoint(130.85, -80) controlPoint1: NSMakePoint(75.64, -74.44) controlPoint2: NSMakePoint(100.1, -80)];
    [path curveToPoint: NSMakePoint(189.6, -16.27) controlPoint1: NSMakePoint(178.5, -80) controlPoint2: NSMakePoint(189.6, -71.65)];
    [path curveToPoint: NSMakePoint(136.4, 47.47) controlPoint1: NSMakePoint(189.6, 29.51) controlPoint2: NSMakePoint(182.79, 47.47)];
    [path curveToPoint: NSMakePoint(97.32, 33.3) controlPoint1: NSMakePoint(115.73, 47.47) controlPoint2: NSMakePoint(106.15, 45.7)];
    [path lineToPoint: NSMakePoint(96.82, 33.3)];
    [path lineToPoint: NSMakePoint(96.82, 88.94)];
    [path lineToPoint: NSMakePoint(183.55, 88.94)];
    [path lineToPoint: NSMakePoint(183.55, 105.13)];
    [path lineToPoint: NSMakePoint(79.17, 105.13)];
    [path lineToPoint: NSMakePoint(79.17, 13.58)];
    [path closePath];
    [path moveToPoint: NSMakePoint(228.3, -77.98)];
    [path lineToPoint: NSMakePoint(246.96, -77.98)];
    [path lineToPoint: NSMakePoint(323.35, 78.32)];
    [path lineToPoint: NSMakePoint(323.35, 105.13)];
    [path lineToPoint: NSMakePoint(211.41, 105.13)];
    [path lineToPoint: NSMakePoint(211.41, 87.43)];
    [path lineToPoint: NSMakePoint(308.73, 87.43)];
    [path lineToPoint: NSMakePoint(228.3, -77.98)];
    [path closePath];
    [path moveToPoint: NSMakePoint(352.73, 13.58)];
    [path lineToPoint: NSMakePoint(367.85, 13.58)];
    [path curveToPoint: NSMakePoint(404.92, 29.76) controlPoint1: NSMakePoint(373.15, 28.25) controlPoint2: NSMakePoint(381.47, 29.76)];
    [path curveToPoint: NSMakePoint(445.51, -16.27) controlPoint1: NSMakePoint(445, 29.76) controlPoint2: NSMakePoint(445.51, 17.88)];
    [path curveToPoint: NSMakePoint(405.92, -62.3) controlPoint1: NSMakePoint(445.51, -55.47) controlPoint2: NSMakePoint(443.99, -62.3)];
    [path curveToPoint: NSMakePoint(365.33, -25.62) controlPoint1: NSMakePoint(368.11, -62.3) controlPoint2: NSMakePoint(365.33, -56.48)];
    [path lineToPoint: NSMakePoint(349.2, -25.62)];
    [path lineToPoint: NSMakePoint(349.2, -39.28)];
    [path curveToPoint: NSMakePoint(404.41, -80) controlPoint1: NSMakePoint(349.2, -74.44) controlPoint2: NSMakePoint(373.65, -80)];
    [path curveToPoint: NSMakePoint(463.15, -16.27) controlPoint1: NSMakePoint(452.06, -80) controlPoint2: NSMakePoint(463.15, -71.65)];
    [path curveToPoint: NSMakePoint(409.96, 47.47) controlPoint1: NSMakePoint(463.15, 29.51) controlPoint2: NSMakePoint(456.35, 47.47)];
    [path curveToPoint: NSMakePoint(370.88, 33.3) controlPoint1: NSMakePoint(389.28, 47.47) controlPoint2: NSMakePoint(379.7, 45.7)];
    [path lineToPoint: NSMakePoint(370.38, 33.3)];
    [path lineToPoint: NSMakePoint(370.38, 88.94)];
    [path lineToPoint: NSMakePoint(457.1, 88.94)];
    [path lineToPoint: NSMakePoint(457.1, 105.13)];
    [path lineToPoint: NSMakePoint(352.73, 105.13)];
    [path lineToPoint: NSMakePoint(352.73, 13.58)];
    [path closePath];
    [path moveToPoint: NSMakePoint(506.01, -26.89)];
    [path curveToPoint: NSMakePoint(546.35, 8.52) controlPoint1: NSMakePoint(506.01, 4.73) controlPoint2: NSMakePoint(511.56, 8.52)];
    [path curveToPoint: NSMakePoint(586.69, -26.89) controlPoint1: NSMakePoint(581.4, 8.52) controlPoint2: NSMakePoint(586.69, 4.73)];
    [path curveToPoint: NSMakePoint(546.35, -62.3) controlPoint1: NSMakePoint(586.69, -58.5) controlPoint2: NSMakePoint(581.4, -62.3)];
    [path curveToPoint: NSMakePoint(506.01, -26.89) controlPoint1: NSMakePoint(511.56, -62.3) controlPoint2: NSMakePoint(506.01, -58.5)];
    [path closePath];
    [path moveToPoint: NSMakePoint(507.02, 57.84)];
    [path curveToPoint: NSMakePoint(546.35, 90.97) controlPoint1: NSMakePoint(507.02, 83.13) controlPoint2: NSMakePoint(507.02, 90.97)];
    [path curveToPoint: NSMakePoint(585.68, 57.84) controlPoint1: NSMakePoint(585.68, 90.97) controlPoint2: NSMakePoint(585.68, 83.13)];
    [path curveToPoint: NSMakePoint(546.35, 24.71) controlPoint1: NSMakePoint(585.68, 32.55) controlPoint2: NSMakePoint(585.68, 24.71)];
    [path curveToPoint: NSMakePoint(507.02, 57.84) controlPoint1: NSMakePoint(507.02, 24.71) controlPoint2: NSMakePoint(507.02, 32.55)];
    [path closePath];
    [path moveToPoint: NSMakePoint(488.36, -28.91)];
    [path curveToPoint: NSMakePoint(546.35, -80) controlPoint1: NSMakePoint(488.36, -75.45) controlPoint2: NSMakePoint(504.25, -80)];
    [path curveToPoint: NSMakePoint(604.34, -28.91) controlPoint1: NSMakePoint(588.45, -80) controlPoint2: NSMakePoint(604.34, -75.45)];
    [path curveToPoint: NSMakePoint(581.9, 16.86) controlPoint1: NSMakePoint(604.34, -2.61) controlPoint2: NSMakePoint(602.07, 10.04)];
    [path lineToPoint: NSMakePoint(581.9, 17.37)];
    [path curveToPoint: NSMakePoint(601.82, 58.09) controlPoint1: NSMakePoint(599.04, 23.19) controlPoint2: NSMakePoint(601.82, 36.34)];
    [path lineToPoint: NSMakePoint(601.82, 65.68)];
    [path curveToPoint: NSMakePoint(546.35, 107.15) controlPoint1: NSMakePoint(601.82, 101.59) controlPoint2: NSMakePoint(588.71, 107.15)];
    [path curveToPoint: NSMakePoint(490.89, 65.68) controlPoint1: NSMakePoint(504, 107.15) controlPoint2: NSMakePoint(490.89, 101.59)];
    [path lineToPoint: NSMakePoint(490.89, 58.09)];
    [path curveToPoint: NSMakePoint(510.8, 17.37) controlPoint1: NSMakePoint(490.89, 36.34) controlPoint2: NSMakePoint(493.66, 23.19)];
    [path lineToPoint: NSMakePoint(510.8, 16.86)];
    [path curveToPoint: NSMakePoint(488.36, -28.91) controlPoint1: NSMakePoint(490.63, 10.04) controlPoint2: NSMakePoint(488.36, -2.61)];
    [path closePath];
    [path moveToPoint: NSMakePoint(630.05, -77.98)];
    [path lineToPoint: NSMakePoint(741.74, -77.98)];
    [path lineToPoint: NSMakePoint(741.74, -60.27)];
    [path lineToPoint: NSMakePoint(647.7, -60.27)];
    [path lineToPoint: NSMakePoint(647.7, -41.81)];
    [path curveToPoint: NSMakePoint(690.81, -8.93) controlPoint1: NSMakePoint(647.7, -20.31) controlPoint2: NSMakePoint(651.48, -11.46)];
    [path curveToPoint: NSMakePoint(743, 53.54) controlPoint1: NSMakePoint(739.47, -5.9) controlPoint2: NSMakePoint(743, 13.58)];
    [path curveToPoint: NSMakePoint(687.28, 107.15) controlPoint1: NSMakePoint(743, 98.3) controlPoint2: NSMakePoint(729.39, 107.15)];
    [path curveToPoint: NSMakePoint(631.06, 57.33) controlPoint1: NSMakePoint(633.83, 107.15) controlPoint2: NSMakePoint(631.06, 87.93)];
    [path lineToPoint: NSMakePoint(631.06, 46.46)];
    [path lineToPoint: NSMakePoint(647.2, 46.46)];
    [path lineToPoint: NSMakePoint(647.2, 55.31)];
    [path curveToPoint: NSMakePoint(686.53, 89.45) controlPoint1: NSMakePoint(647.2, 84.39) controlPoint2: NSMakePoint(650.98, 89.45)];
    [path curveToPoint: NSMakePoint(725.35, 53.28) controlPoint1: NSMakePoint(721.07, 89.45) controlPoint2: NSMakePoint(725.35, 82.62)];
    [path curveToPoint: NSMakePoint(687.28, 8.77) controlPoint1: NSMakePoint(725.35, 15.85) controlPoint2: NSMakePoint(721.07, 12.06)];
    [path curveToPoint: NSMakePoint(630.05, -45.6) controlPoint1: NSMakePoint(642.15, 4.47) controlPoint2: NSMakePoint(630.05, -3.62)];
    [path lineToPoint: NSMakePoint(630.05, -77.98)];
    [path closePath];
    
    [path transformUsingAffineTransform: transform];
    
    [[[globals.colours objectForKey:LIGHT_GREEN_TUTORS] colorWithAlphaComponent:self.opacity] setFill];
    
    [path fill];
}

@end
