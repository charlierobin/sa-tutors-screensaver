#import "CaptionEmail.h"

@implementation CaptionEmail

- (void)draw:(struct Globals) globals
{
    NSAffineTransform *transform = [NSAffineTransform transform];
    
    [transform translateXBy: self.x yBy: self.y];
    [transform scaleXBy: self.scaling yBy: self.scaling];
    
    NSBezierPath* path = [NSBezierPath bezierPath];
    [path moveToPoint: NSMakePoint(-747, -52.39)];
    [path lineToPoint: NSMakePoint(-734.27, -52.39)];
    [path lineToPoint: NSMakePoint(-734.27, 49.01)];
    [path lineToPoint: NSMakePoint(-747, 49.01)];
    [path lineToPoint: NSMakePoint(-747, -52.39)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-747, 74.66)];
    [path lineToPoint: NSMakePoint(-734.27, 74.66)];
    [path lineToPoint: NSMakePoint(-734.27, 91.56)];
    [path lineToPoint: NSMakePoint(-747, 91.56)];
    [path lineToPoint: NSMakePoint(-747, 74.66)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-709.8, -52.39)];
    [path lineToPoint: NSMakePoint(-697.07, -52.39)];
    [path lineToPoint: NSMakePoint(-697.07, 11.63)];
    [path curveToPoint: NSMakePoint(-670.82, 39.07) controlPoint1: NSMakePoint(-697.07, 33.11) controlPoint2: NSMakePoint(-686.33, 39.07)];
    [path curveToPoint: NSMakePoint(-651.52, 16.2) controlPoint1: NSMakePoint(-654.11, 39.07) controlPoint2: NSMakePoint(-651.52, 27.94)];
    [path lineToPoint: NSMakePoint(-651.52, -52.39)];
    [path lineToPoint: NSMakePoint(-638.79, -52.39)];
    [path lineToPoint: NSMakePoint(-638.79, 19.19)];
    [path curveToPoint: NSMakePoint(-668.63, 50.6) controlPoint1: NSMakePoint(-638.79, 38.87) controlPoint2: NSMakePoint(-645.16, 50.6)];
    [path curveToPoint: NSMakePoint(-696.67, 35.89) controlPoint1: NSMakePoint(-683.35, 50.6) controlPoint2: NSMakePoint(-690.31, 46.83)];
    [path lineToPoint: NSMakePoint(-697.07, 35.89)];
    [path lineToPoint: NSMakePoint(-697.07, 49.01)];
    [path lineToPoint: NSMakePoint(-709.8, 49.01)];
    [path lineToPoint: NSMakePoint(-709.8, -52.39)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-610.74, -52.39)];
    [path lineToPoint: NSMakePoint(-598.01, -52.39)];
    [path lineToPoint: NSMakePoint(-598.01, 37.48)];
    [path lineToPoint: NSMakePoint(-575.73, 37.48)];
    [path lineToPoint: NSMakePoint(-575.73, 49.01)];
    [path lineToPoint: NSMakePoint(-598.01, 49.01)];
    [path lineToPoint: NSMakePoint(-598.01, 67.31)];
    [path curveToPoint: NSMakePoint(-583.69, 81.62) controlPoint1: NSMakePoint(-598.01, 78.84) controlPoint2: NSMakePoint(-592.05, 81.62)];
    [path curveToPoint: NSMakePoint(-575.34, 81.42) controlPoint1: NSMakePoint(-580.91, 81.62) controlPoint2: NSMakePoint(-578.12, 81.62)];
    [path lineToPoint: NSMakePoint(-575.34, 92.76)];
    [path curveToPoint: NSMakePoint(-584.29, 93.15) controlPoint1: NSMakePoint(-578.32, 92.96) controlPoint2: NSMakePoint(-581.3, 93.15)];
    [path curveToPoint: NSMakePoint(-610.74, 67.31) controlPoint1: NSMakePoint(-601.99, 93.15) controlPoint2: NSMakePoint(-610.74, 86)];
    [path lineToPoint: NSMakePoint(-610.74, 49.01)];
    [path lineToPoint: NSMakePoint(-623.28, 49.01)];
    [path lineToPoint: NSMakePoint(-623.28, 37.48)];
    [path lineToPoint: NSMakePoint(-610.74, 37.48)];
    [path lineToPoint: NSMakePoint(-610.74, -52.39)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-318.59, -22.79)];
    [path curveToPoint: NSMakePoint(-284.58, -55.8) controlPoint1: NSMakePoint(-318.59, -53.02) controlPoint2: NSMakePoint(-307.85, -55.8)];
    [path curveToPoint: NSMakePoint(-247.18, -23.39) controlPoint1: NSMakePoint(-251.76, -55.8) controlPoint2: NSMakePoint(-247.18, -47.25)];
    [path curveToPoint: NSMakePoint(-281.79, 3.05) controlPoint1: NSMakePoint(-247.18, -1.12) controlPoint2: NSMakePoint(-251.76, 1.27)];
    [path curveToPoint: NSMakePoint(-305.06, 19.76) controlPoint1: NSMakePoint(-303.27, 4.25) controlPoint2: NSMakePoint(-305.06, 5.44)];
    [path curveToPoint: NSMakePoint(-284.18, 37.25) controlPoint1: NSMakePoint(-305.06, 35.47) controlPoint2: NSMakePoint(-301.88, 37.25)];
    [path curveToPoint: NSMakePoint(-260.91, 20.75) controlPoint1: NSMakePoint(-265.08, 37.25) controlPoint2: NSMakePoint(-260.91, 36.26)];
    [path lineToPoint: NSMakePoint(-248.17, 20.75)];
    [path curveToPoint: NSMakePoint(-283.58, 48.79) controlPoint1: NSMakePoint(-248.17, 42.03) controlPoint2: NSMakePoint(-253.94, 48.79)];
    [path curveToPoint: NSMakePoint(-317.8, 19.16) controlPoint1: NSMakePoint(-313.82, 48.79) controlPoint2: NSMakePoint(-317.8, 40.44)];
    [path curveToPoint: NSMakePoint(-285.37, -8.48) controlPoint1: NSMakePoint(-317.8, -3.31) controlPoint2: NSMakePoint(-310.83, -7.09)];
    [path curveToPoint: NSMakePoint(-259.91, -24.19) controlPoint1: NSMakePoint(-261.3, -9.87) controlPoint2: NSMakePoint(-259.91, -10.86)];
    [path curveToPoint: NSMakePoint(-284.18, -44.27) controlPoint1: NSMakePoint(-259.91, -41.29) controlPoint2: NSMakePoint(-263.69, -44.27)];
    [path curveToPoint: NSMakePoint(-305.86, -22.79) controlPoint1: NSMakePoint(-303.08, -44.27) controlPoint2: NSMakePoint(-306.26, -40.29)];
    [path lineToPoint: NSMakePoint(-318.59, -22.79)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-130.82, -34.92)];
    [path curveToPoint: NSMakePoint(-106.95, -55.8) controlPoint1: NSMakePoint(-130.82, -50.03) controlPoint2: NSMakePoint(-125.64, -55.8)];
    [path curveToPoint: NSMakePoint(-81.88, -20.01) controlPoint1: NSMakePoint(-92.23, -55.8) controlPoint2: NSMakePoint(-81.88, -52.42)];
    [path lineToPoint: NSMakePoint(-93.42, -20.01)];
    [path curveToPoint: NSMakePoint(-107.14, -44.27) controlPoint1: NSMakePoint(-93.42, -42.48) controlPoint2: NSMakePoint(-97.6, -44.27)];
    [path curveToPoint: NSMakePoint(-118.08, -32.14) controlPoint1: NSMakePoint(-115.5, -44.27) controlPoint2: NSMakePoint(-118.08, -40.49)];
    [path lineToPoint: NSMakePoint(-118.08, 35.66)];
    [path lineToPoint: NSMakePoint(-85.26, 35.66)];
    [path lineToPoint: NSMakePoint(-85.26, 47.2)];
    [path lineToPoint: NSMakePoint(-118.08, 47.2)];
    [path lineToPoint: NSMakePoint(-118.08, 70.66)];
    [path lineToPoint: NSMakePoint(-130.82, 70.66)];
    [path lineToPoint: NSMakePoint(-130.82, 47.2)];
    [path lineToPoint: NSMakePoint(-141.36, 47.2)];
    [path lineToPoint: NSMakePoint(-141.36, 35.66)];
    [path lineToPoint: NSMakePoint(-130.82, 35.66)];
    [path lineToPoint: NSMakePoint(-130.82, -34.92)];
    [path closePath];
    [path moveToPoint: NSMakePoint(3.05, 47.2)];
    [path lineToPoint: NSMakePoint(-9.68, 47.2)];
    [path lineToPoint: NSMakePoint(-9.68, -16.83)];
    [path curveToPoint: NSMakePoint(-35.93, -44.27) controlPoint1: NSMakePoint(-9.68, -38.3) controlPoint2: NSMakePoint(-20.42, -44.27)];
    [path curveToPoint: NSMakePoint(-55.23, -21.4) controlPoint1: NSMakePoint(-52.64, -44.27) controlPoint2: NSMakePoint(-55.23, -33.13)];
    [path lineToPoint: NSMakePoint(-55.23, 47.2)];
    [path lineToPoint: NSMakePoint(-67.96, 47.2)];
    [path lineToPoint: NSMakePoint(-67.96, -24.38)];
    [path curveToPoint: NSMakePoint(-38.12, -55.8) controlPoint1: NSMakePoint(-67.96, -44.07) controlPoint2: NSMakePoint(-61.59, -55.8)];
    [path curveToPoint: NSMakePoint(-10.07, -41.09) controlPoint1: NSMakePoint(-23.4, -55.8) controlPoint2: NSMakePoint(-16.44, -52.02)];
    [path lineToPoint: NSMakePoint(-9.68, -41.09)];
    [path lineToPoint: NSMakePoint(-9.68, -54.21)];
    [path lineToPoint: NSMakePoint(3.05, -54.21)];
    [path lineToPoint: NSMakePoint(3.05, 47.2)];
    [path closePath];
    [path moveToPoint: NSMakePoint(27.52, -34.92)];
    [path curveToPoint: NSMakePoint(51.39, -55.8) controlPoint1: NSMakePoint(27.52, -50.03) controlPoint2: NSMakePoint(32.69, -55.8)];
    [path curveToPoint: NSMakePoint(76.45, -20.01) controlPoint1: NSMakePoint(66.11, -55.8) controlPoint2: NSMakePoint(76.45, -52.42)];
    [path lineToPoint: NSMakePoint(64.92, -20.01)];
    [path curveToPoint: NSMakePoint(51.19, -44.27) controlPoint1: NSMakePoint(64.92, -42.48) controlPoint2: NSMakePoint(60.74, -44.27)];
    [path curveToPoint: NSMakePoint(40.25, -32.14) controlPoint1: NSMakePoint(42.84, -44.27) controlPoint2: NSMakePoint(40.25, -40.49)];
    [path lineToPoint: NSMakePoint(40.25, 35.66)];
    [path lineToPoint: NSMakePoint(73.07, 35.66)];
    [path lineToPoint: NSMakePoint(73.07, 47.2)];
    [path lineToPoint: NSMakePoint(40.25, 47.2)];
    [path lineToPoint: NSMakePoint(40.25, 70.66)];
    [path lineToPoint: NSMakePoint(27.52, 70.66)];
    [path lineToPoint: NSMakePoint(27.52, 47.2)];
    [path lineToPoint: NSMakePoint(16.98, 47.2)];
    [path lineToPoint: NSMakePoint(16.98, 35.66)];
    [path lineToPoint: NSMakePoint(27.52, 35.66)];
    [path lineToPoint: NSMakePoint(27.52, -34.92)];
    [path closePath];
    [path moveToPoint: NSMakePoint(182.67, -54.21)];
    [path lineToPoint: NSMakePoint(195.4, -54.21)];
    [path lineToPoint: NSMakePoint(195.4, 16.38)];
    [path curveToPoint: NSMakePoint(214.7, 37.25) controlPoint1: NSMakePoint(195.4, 30.3) controlPoint2: NSMakePoint(201.97, 37.45)];
    [path curveToPoint: NSMakePoint(231.21, 13.39) controlPoint1: NSMakePoint(229.22, 37.25) controlPoint2: NSMakePoint(231.41, 32.09)];
    [path lineToPoint: NSMakePoint(242.75, 13.39)];
    [path lineToPoint: NSMakePoint(242.75, 21.55)];
    [path curveToPoint: NSMakePoint(219.27, 48.79) controlPoint1: NSMakePoint(242.75, 41.83) controlPoint2: NSMakePoint(235.39, 48.79)];
    [path curveToPoint: NSMakePoint(195.8, 34.87) controlPoint1: NSMakePoint(206.54, 48.79) controlPoint2: NSMakePoint(200.58, 44.61)];
    [path lineToPoint: NSMakePoint(195.4, 34.87)];
    [path lineToPoint: NSMakePoint(195.4, 47.2)];
    [path lineToPoint: NSMakePoint(182.67, 47.2)];
    [path lineToPoint: NSMakePoint(182.67, -54.21)];
    [path closePath];
    [path moveToPoint: NSMakePoint(256.07, -22.79)];
    [path curveToPoint: NSMakePoint(290.09, -55.8) controlPoint1: NSMakePoint(256.07, -53.02) controlPoint2: NSMakePoint(266.81, -55.8)];
    [path curveToPoint: NSMakePoint(327.48, -23.39) controlPoint1: NSMakePoint(322.91, -55.8) controlPoint2: NSMakePoint(327.48, -47.25)];
    [path curveToPoint: NSMakePoint(292.87, 3.05) controlPoint1: NSMakePoint(327.48, -1.12) controlPoint2: NSMakePoint(322.91, 1.27)];
    [path curveToPoint: NSMakePoint(269.6, 19.76) controlPoint1: NSMakePoint(271.39, 4.25) controlPoint2: NSMakePoint(269.6, 5.44)];
    [path curveToPoint: NSMakePoint(290.49, 37.25) controlPoint1: NSMakePoint(269.6, 35.47) controlPoint2: NSMakePoint(272.78, 37.25)];
    [path curveToPoint: NSMakePoint(313.76, 20.75) controlPoint1: NSMakePoint(309.58, 37.25) controlPoint2: NSMakePoint(313.76, 36.26)];
    [path lineToPoint: NSMakePoint(326.49, 20.75)];
    [path curveToPoint: NSMakePoint(291.08, 48.79) controlPoint1: NSMakePoint(326.49, 42.03) controlPoint2: NSMakePoint(320.72, 48.79)];
    [path curveToPoint: NSMakePoint(256.87, 19.16) controlPoint1: NSMakePoint(260.85, 48.79) controlPoint2: NSMakePoint(256.87, 40.44)];
    [path curveToPoint: NSMakePoint(289.29, -8.48) controlPoint1: NSMakePoint(256.87, -3.31) controlPoint2: NSMakePoint(263.83, -7.09)];
    [path curveToPoint: NSMakePoint(314.75, -24.19) controlPoint1: NSMakePoint(313.36, -9.87) controlPoint2: NSMakePoint(314.75, -10.86)];
    [path curveToPoint: NSMakePoint(290.49, -44.27) controlPoint1: NSMakePoint(314.75, -41.29) controlPoint2: NSMakePoint(310.97, -44.27)];
    [path curveToPoint: NSMakePoint(268.8, -22.79) controlPoint1: NSMakePoint(271.59, -44.27) controlPoint2: NSMakePoint(268.41, -40.29)];
    [path lineToPoint: NSMakePoint(256.07, -22.79)];
    [path closePath];
    [path moveToPoint: NSMakePoint(343.98, -54.21)];
    [path lineToPoint: NSMakePoint(357.91, -54.21)];
    [path lineToPoint: NSMakePoint(357.91, -35.92)];
    [path lineToPoint: NSMakePoint(343.98, -35.92)];
    [path lineToPoint: NSMakePoint(343.98, -54.21)];
    [path closePath];
    [path moveToPoint: NSMakePoint(445.24, 13.39)];
    [path curveToPoint: NSMakePoint(412.03, 48.79) controlPoint1: NSMakePoint(445.24, 40.24) controlPoint2: NSMakePoint(439.48, 48.79)];
    [path curveToPoint: NSMakePoint(374.63, -3.51) controlPoint1: NSMakePoint(381.39, 48.79) controlPoint2: NSMakePoint(374.63, 38.45)];
    [path curveToPoint: NSMakePoint(412.03, -55.8) controlPoint1: NSMakePoint(374.63, -44.67) controlPoint2: NSMakePoint(378.61, -55.8)];
    [path curveToPoint: NSMakePoint(447.03, -23.99) controlPoint1: NSMakePoint(434.7, -55.8) controlPoint2: NSMakePoint(447.03, -50.23)];
    [path lineToPoint: NSMakePoint(447.03, -17.43)];
    [path lineToPoint: NSMakePoint(434.3, -17.43)];
    [path curveToPoint: NSMakePoint(412.03, -44.27) controlPoint1: NSMakePoint(434.3, -39.3) controlPoint2: NSMakePoint(430.33, -44.27)];
    [path curveToPoint: NSMakePoint(388.55, -3.51) controlPoint1: NSMakePoint(391.74, -44.27) controlPoint2: NSMakePoint(388.55, -41.29)];
    [path curveToPoint: NSMakePoint(412.03, 37.25) controlPoint1: NSMakePoint(388.55, 34.27) controlPoint2: NSMakePoint(391.74, 37.25)];
    [path curveToPoint: NSMakePoint(432.51, 13.39) controlPoint1: NSMakePoint(428.93, 37.25) controlPoint2: NSMakePoint(432.51, 31.89)];
    [path lineToPoint: NSMakePoint(445.24, 13.39)];
    [path closePath];
    [path moveToPoint: NSMakePoint(554.46, -54.21)];
    [path lineToPoint: NSMakePoint(568.39, -54.21)];
    [path lineToPoint: NSMakePoint(568.39, -35.92)];
    [path lineToPoint: NSMakePoint(554.46, -35.92)];
    [path lineToPoint: NSMakePoint(554.46, -54.21)];
    [path closePath];
    [path moveToPoint: NSMakePoint(656.1, 47.2)];
    [path lineToPoint: NSMakePoint(643.37, 47.2)];
    [path lineToPoint: NSMakePoint(643.37, -16.83)];
    [path curveToPoint: NSMakePoint(617.11, -44.27) controlPoint1: NSMakePoint(643.37, -38.3) controlPoint2: NSMakePoint(632.62, -44.27)];
    [path curveToPoint: NSMakePoint(597.81, -21.4) controlPoint1: NSMakePoint(600.4, -44.27) controlPoint2: NSMakePoint(597.81, -33.13)];
    [path lineToPoint: NSMakePoint(597.81, 47.2)];
    [path lineToPoint: NSMakePoint(585.08, 47.2)];
    [path lineToPoint: NSMakePoint(585.08, -24.38)];
    [path curveToPoint: NSMakePoint(614.92, -55.8) controlPoint1: NSMakePoint(585.08, -44.07) controlPoint2: NSMakePoint(591.45, -55.8)];
    [path curveToPoint: NSMakePoint(642.97, -41.09) controlPoint1: NSMakePoint(629.64, -55.8) controlPoint2: NSMakePoint(636.6, -52.02)];
    [path lineToPoint: NSMakePoint(643.37, -41.09)];
    [path lineToPoint: NSMakePoint(643.37, -54.21)];
    [path lineToPoint: NSMakePoint(656.1, -54.21)];
    [path lineToPoint: NSMakePoint(656.1, 47.2)];
    [path closePath];
    [path moveToPoint: NSMakePoint(730.09, -54.21)];
    [path lineToPoint: NSMakePoint(747, -54.21)];
    [path lineToPoint: NSMakePoint(706.02, 0.27)];
    [path lineToPoint: NSMakePoint(741.63, 47.2)];
    [path lineToPoint: NSMakePoint(725.92, 47.2)];
    [path lineToPoint: NSMakePoint(695.88, 6.24)];
    [path lineToPoint: NSMakePoint(689.91, 6.24)];
    [path lineToPoint: NSMakePoint(689.91, 89.75)];
    [path lineToPoint: NSMakePoint(677.18, 89.75)];
    [path lineToPoint: NSMakePoint(677.18, -54.21)];
    [path lineToPoint: NSMakePoint(689.91, -54.21)];
    [path lineToPoint: NSMakePoint(689.91, -6.49)];
    [path lineToPoint: NSMakePoint(695.48, -6.49)];
    [path lineToPoint: NSMakePoint(730.09, -54.21)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-530.58, 39.07)];
    [path curveToPoint: NSMakePoint(-554.05, -1.69) controlPoint1: NSMakePoint(-550.87, 39.07) controlPoint2: NSMakePoint(-554.05, 36.09)];
    [path curveToPoint: NSMakePoint(-530.58, -42.45) controlPoint1: NSMakePoint(-554.05, -39.47) controlPoint2: NSMakePoint(-550.87, -42.45)];
    [path curveToPoint: NSMakePoint(-507.11, -1.69) controlPoint1: NSMakePoint(-510.29, -42.45) controlPoint2: NSMakePoint(-507.11, -39.47)];
    [path curveToPoint: NSMakePoint(-530.58, 39.07) controlPoint1: NSMakePoint(-507.11, 36.09) controlPoint2: NSMakePoint(-510.29, 39.07)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-493.19, -1.69)];
    [path curveToPoint: NSMakePoint(-530.58, -53.98) controlPoint1: NSMakePoint(-493.19, -43.65) controlPoint2: NSMakePoint(-497.56, -53.98)];
    [path curveToPoint: NSMakePoint(-567.98, -1.69) controlPoint1: NSMakePoint(-563.6, -53.98) controlPoint2: NSMakePoint(-567.98, -43.65)];
    [path curveToPoint: NSMakePoint(-530.58, 50.6) controlPoint1: NSMakePoint(-567.98, 38.67) controlPoint2: NSMakePoint(-564, 50.6)];
    [path curveToPoint: NSMakePoint(-493.19, -1.69) controlPoint1: NSMakePoint(-497.16, 50.6) controlPoint2: NSMakePoint(-493.19, 38.67)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-335.3, 5.9)];
    [path curveToPoint: NSMakePoint(-381.09, -48.01) controlPoint1: NSMakePoint(-335.3, -24.74) controlPoint2: NSMakePoint(-361.41, -48.01)];
    [path curveToPoint: NSMakePoint(-394.14, -35.34) controlPoint1: NSMakePoint(-387.9, -48.01) controlPoint2: NSMakePoint(-392.82, -43.28)];
    [path lineToPoint: NSMakePoint(-394.52, -35.34)];
    [path curveToPoint: NSMakePoint(-420.82, -48.01) controlPoint1: NSMakePoint(-400.57, -42.71) controlPoint2: NSMakePoint(-409.85, -48.01)];
    [path curveToPoint: NSMakePoint(-443.29, -34.26) controlPoint1: NSMakePoint(-430.72, -48.01) controlPoint2: NSMakePoint(-438.81, -42.56)];
    [path curveToPoint: NSMakePoint(-447.12, -18.5) controlPoint1: NSMakePoint(-445.75, -29.72) controlPoint2: NSMakePoint(-447.12, -24.32)];
    [path curveToPoint: NSMakePoint(-400.01, 35.02) controlPoint1: NSMakePoint(-447.12, 6.84) controlPoint2: NSMakePoint(-428.01, 35.02)];
    [path curveToPoint: NSMakePoint(-378.06, 19.32) controlPoint1: NSMakePoint(-392.82, 35.02) controlPoint2: NSMakePoint(-382.6, 31.43)];
    [path lineToPoint: NSMakePoint(-373.52, 31.43)];
    [path lineToPoint: NSMakePoint(-361.79, 31.43)];
    [path lineToPoint: NSMakePoint(-380.14, -22.85)];
    [path curveToPoint: NSMakePoint(-382.03, -33.44) controlPoint1: NSMakePoint(-381.46, -26.64) controlPoint2: NSMakePoint(-382.03, -30.61)];
    [path curveToPoint: NSMakePoint(-377.68, -38.17) controlPoint1: NSMakePoint(-382.03, -36.28) controlPoint2: NSMakePoint(-380.71, -38.17)];
    [path curveToPoint: NSMakePoint(-346.27, 5.71) controlPoint1: NSMakePoint(-362.16, -38.17) controlPoint2: NSMakePoint(-346.27, -13.96)];
    [path curveToPoint: NSMakePoint(-402.09, 54.13) controlPoint1: NSMakePoint(-346.27, 35.78) controlPoint2: NSMakePoint(-372.76, 54.13)];
    [path curveToPoint: NSMakePoint(-464.34, -6.78) controlPoint1: NSMakePoint(-437.66, 54.13) controlPoint2: NSMakePoint(-464.34, 26.7)];
    [path curveToPoint: NSMakePoint(-452.7, -42.1) controlPoint1: NSMakePoint(-464.34, -20.07) controlPoint2: NSMakePoint(-460.13, -32.26)];
    [path curveToPoint: NSMakePoint(-401.33, -66.16) controlPoint1: NSMakePoint(-441.63, -56.75) controlPoint2: NSMakePoint(-423.41, -66.16)];
    [path curveToPoint: NSMakePoint(-350.62, -42.14) controlPoint1: NSMakePoint(-381.84, -66.16) controlPoint2: NSMakePoint(-362.16, -57.28)];
    [path lineToPoint: NSMakePoint(-339.27, -42.14)];
    [path curveToPoint: NSMakePoint(-401.33, -76) controlPoint1: NSMakePoint(-351.57, -63.33) controlPoint2: NSMakePoint(-376.36, -76)];
    [path curveToPoint: NSMakePoint(-461.13, -49.12) controlPoint1: NSMakePoint(-427.22, -76) controlPoint2: NSMakePoint(-448.21, -65.83)];
    [path curveToPoint: NSMakePoint(-475.31, -5.45) controlPoint1: NSMakePoint(-470.22, -37.37) controlPoint2: NSMakePoint(-475.31, -22.4)];
    [path curveToPoint: NSMakePoint(-402.47, 63.96) controlPoint1: NSMakePoint(-475.31, 33.13) controlPoint2: NSMakePoint(-442.2, 63.96)];
    [path curveToPoint: NSMakePoint(-335.3, 5.9) controlPoint1: NSMakePoint(-365.57, 63.96) controlPoint2: NSMakePoint(-335.3, 39.56)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-400.76, 25.19)];
    [path curveToPoint: NSMakePoint(-433.88, -18.12) controlPoint1: NSMakePoint(-420.06, 25.19) controlPoint2: NSMakePoint(-433.88, -0.91)];
    [path curveToPoint: NSMakePoint(-415.9, -38.17) controlPoint1: NSMakePoint(-433.88, -29.47) controlPoint2: NSMakePoint(-426.31, -38.17)];
    [path curveToPoint: NSMakePoint(-384.49, 5.9) controlPoint1: NSMakePoint(-398.49, -38.17) controlPoint2: NSMakePoint(-384.49, -13.21)];
    [path curveToPoint: NSMakePoint(-400.76, 25.19) controlPoint1: NSMakePoint(-384.49, 17.06) controlPoint2: NSMakePoint(-390.55, 25.19)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-155.28, 19.96)];
    [path lineToPoint: NSMakePoint(-155.28, -54.21)];
    [path lineToPoint: NSMakePoint(-166.82, -54.21)];
    [path lineToPoint: NSMakePoint(-166.82, -45.46)];
    [path curveToPoint: NSMakePoint(-196.46, -55.8) controlPoint1: NSMakePoint(-174.18, -53.41) controlPoint2: NSMakePoint(-181.54, -55.8)];
    [path curveToPoint: NSMakePoint(-228.08, -23.99) controlPoint1: NSMakePoint(-222.32, -55.8) controlPoint2: NSMakePoint(-228.08, -43.47)];
    [path curveToPoint: NSMakePoint(-228.08, -22.81) controlPoint1: NSMakePoint(-228.08, -23.59) controlPoint2: NSMakePoint(-228.08, -23.2)];
    [path curveToPoint: NSMakePoint(-196.46, 7.83) controlPoint1: NSMakePoint(-227.89, -3.63) controlPoint2: NSMakePoint(-222.97, 7.83)];
    [path curveToPoint: NSMakePoint(-178.46, 6.34) controlPoint1: NSMakePoint(-187.98, 7.83) controlPoint2: NSMakePoint(-182.42, 7.4)];
    [path curveToPoint: NSMakePoint(-168.41, -1.32) controlPoint1: NSMakePoint(-173.41, 4.98) controlPoint2: NSMakePoint(-170.97, 2.58)];
    [path lineToPoint: NSMakePoint(-168.01, -1.32)];
    [path curveToPoint: NSMakePoint(-168.01, 12.48) controlPoint1: NSMakePoint(-168.01, -1.32) controlPoint2: NSMakePoint(-168.01, 7)];
    [path curveToPoint: NSMakePoint(-168.01, 17.17) controlPoint1: NSMakePoint(-168.01, 15.17) controlPoint2: NSMakePoint(-168.01, 17.17)];
    [path curveToPoint: NSMakePoint(-190.49, 37.25) controlPoint1: NSMakePoint(-168.01, 32.09) controlPoint2: NSMakePoint(-169.4, 37.25)];
    [path curveToPoint: NSMakePoint(-211.77, 19.16) controlPoint1: NSMakePoint(-211.38, 37.25) controlPoint2: NSMakePoint(-211.77, 32.09)];
    [path lineToPoint: NSMakePoint(-224.5, 19.16)];
    [path lineToPoint: NSMakePoint(-224.5, 24.53)];
    [path curveToPoint: NSMakePoint(-189.89, 48.79) controlPoint1: NSMakePoint(-224.5, 36.86) controlPoint2: NSMakePoint(-221.52, 48.79)];
    [path curveToPoint: NSMakePoint(-155.28, 19.96) controlPoint1: NSMakePoint(-161.65, 48.79) controlPoint2: NSMakePoint(-155.28, 39.64)];
    [path closePath];
    [path moveToPoint: NSMakePoint(-192.9, -3.71)];
    [path curveToPoint: NSMakePoint(-217.17, -23.39) controlPoint1: NSMakePoint(-209.81, -3.71) controlPoint2: NSMakePoint(-217.17, -7.88)];
    [path curveToPoint: NSMakePoint(-192.9, -43.07) controlPoint1: NSMakePoint(-217.17, -38.9) controlPoint2: NSMakePoint(-209.81, -43.07)];
    [path curveToPoint: NSMakePoint(-168.64, -23.39) controlPoint1: NSMakePoint(-176, -43.07) controlPoint2: NSMakePoint(-168.64, -38.9)];
    [path curveToPoint: NSMakePoint(-192.9, -3.71) controlPoint1: NSMakePoint(-168.64, -7.88) controlPoint2: NSMakePoint(-176, -3.71)];
    [path closePath];
    [path moveToPoint: NSMakePoint(125.98, 37.25)];
    [path curveToPoint: NSMakePoint(102.51, -3.51) controlPoint1: NSMakePoint(105.69, 37.25) controlPoint2: NSMakePoint(102.51, 34.27)];
    [path curveToPoint: NSMakePoint(125.98, -44.27) controlPoint1: NSMakePoint(102.51, -41.29) controlPoint2: NSMakePoint(105.69, -44.27)];
    [path curveToPoint: NSMakePoint(149.46, -3.51) controlPoint1: NSMakePoint(146.27, -44.27) controlPoint2: NSMakePoint(149.46, -41.29)];
    [path curveToPoint: NSMakePoint(125.98, 37.25) controlPoint1: NSMakePoint(149.46, 34.27) controlPoint2: NSMakePoint(146.27, 37.25)];
    [path closePath];
    [path moveToPoint: NSMakePoint(163.38, -3.51)];
    [path curveToPoint: NSMakePoint(125.98, -55.8) controlPoint1: NSMakePoint(163.38, -45.46) controlPoint2: NSMakePoint(159, -55.8)];
    [path curveToPoint: NSMakePoint(88.59, -3.51) controlPoint1: NSMakePoint(92.96, -55.8) controlPoint2: NSMakePoint(88.59, -45.46)];
    [path curveToPoint: NSMakePoint(125.98, 48.79) controlPoint1: NSMakePoint(88.59, 36.86) controlPoint2: NSMakePoint(92.57, 48.79)];
    [path curveToPoint: NSMakePoint(163.38, -3.51) controlPoint1: NSMakePoint(159.4, 48.79) controlPoint2: NSMakePoint(163.38, 36.86)];
    [path closePath];
    [path moveToPoint: NSMakePoint(500.34, 37.25)];
    [path curveToPoint: NSMakePoint(476.87, -3.51) controlPoint1: NSMakePoint(480.05, 37.25) controlPoint2: NSMakePoint(476.87, 34.27)];
    [path curveToPoint: NSMakePoint(500.34, -44.27) controlPoint1: NSMakePoint(476.87, -41.29) controlPoint2: NSMakePoint(480.05, -44.27)];
    [path curveToPoint: NSMakePoint(523.82, -3.51) controlPoint1: NSMakePoint(520.63, -44.27) controlPoint2: NSMakePoint(523.82, -41.29)];
    [path curveToPoint: NSMakePoint(500.34, 37.25) controlPoint1: NSMakePoint(523.82, 34.27) controlPoint2: NSMakePoint(520.63, 37.25)];
    [path closePath];
    [path moveToPoint: NSMakePoint(537.74, -3.51)];
    [path curveToPoint: NSMakePoint(500.34, -55.8) controlPoint1: NSMakePoint(537.74, -45.46) controlPoint2: NSMakePoint(533.36, -55.8)];
    [path curveToPoint: NSMakePoint(462.95, -3.51) controlPoint1: NSMakePoint(467.32, -55.8) controlPoint2: NSMakePoint(462.95, -45.46)];
    [path curveToPoint: NSMakePoint(500.34, 48.79) controlPoint1: NSMakePoint(462.95, 36.86) controlPoint2: NSMakePoint(466.93, 48.79)];
    [path curveToPoint: NSMakePoint(537.74, -3.51) controlPoint1: NSMakePoint(533.76, 48.79) controlPoint2: NSMakePoint(537.74, 36.86)];
    [path closePath];
    
    [path transformUsingAffineTransform: transform];
    
    [[[globals.colours objectForKey:DARK_GREEN] colorWithAlphaComponent:self.opacity] setFill];
    
    [path fill];
}

@end
