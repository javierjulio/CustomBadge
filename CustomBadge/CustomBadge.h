/*
 CustomBadge.h
 
 Further changes by Javier Julio (https://github.com/javierjulio/CustomBadge)
 
*** Description: ***
 With this class you can draw a typical iOS badge indicator with a custom text on any view.
 Please use the allocator customBadgeWithString to create a new badge.
 In this version you can modfiy the color inside the badge (insetColor),
 the color of the frame (frameColor), the color of the text and you can
 tell the class if you want a frame around the badge.
 
 *** License & Copyright ***
 Created by Sascha Paulus www.spaulus.com on 04/2011. Version 2.0
 This tiny class can be used for free in private and commercial applications.
 Please feel free to modify, extend or distribution this class. 
 If you modify it: Please send me your modified version of the class.
 Please do not sell the source code solely and keep this text in
 your copyright section. Thanks.
 
 If you have any questions please feel free to contact me (open@spaulus.com).
 */

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CustomBadge : UIView

@property(strong, nonatomic) NSString *badgeText;
@property(strong, nonatomic) UIColor *badgeTextColor;
@property(strong, nonatomic) UIColor *badgeInsetColor;
@property(strong, nonatomic) UIColor *badgeFrameColor;

@property(nonatomic) BOOL badgeFrame;
@property(nonatomic) BOOL badgeShining;

@property(nonatomic) CGFloat badgeCornerRoundness;
@property(nonatomic) CGFloat badgeScaleFactor;

+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString;
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining;
- (void) autoBadgeSizeWithString:(NSString *)badgeString;

@end
