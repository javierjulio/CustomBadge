/*
 CustomBadge.m

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

#import "CustomBadge.h"

@interface CustomBadge()
- (void) drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect;
- (void) drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect;
@end

@implementation CustomBadge

- (CGSize) intrinsicContentSize
{
  CGSize s = [super intrinsicContentSize];
  CGSize stringSize = [self.badgeText sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.f]}];
  
  return CGSizeMake(s.width + 18.f + stringSize.width, s.height + 25.f);
}

- (void) setDefaults
{
  self.contentScaleFactor = [[UIScreen mainScreen] scale];
  self.backgroundColor = [UIColor clearColor];
  self.badgeText = @"";
  self.badgeTextColor = [UIColor whiteColor];
  self.badgeInsetColor = [UIColor colorWithRed:0xf2/255. green:0x6f/255. blue:0x1e/255. alpha:1.0];
  self.badgeFrame = YES;
  self.badgeFrameColor = [UIColor whiteColor];
  self.badgeCornerRoundness = 0.4f;
  self.badgeScaleFactor = 1.0;
  self.badgeShining = NO;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
  if (self = [super initWithCoder:aDecoder]) {
    [self setDefaults];
  }
  return self;
}

- (void) awakeFromNib
{
  [self setDefaults];
}

// I recommend to use the allocator customBadgeWithString
- (id) initWithString:(NSString *)badgeString withScale:(CGFloat)scale withShining:(BOOL)shining
{
	self = [super initWithFrame:CGRectMake(0.f, 0.f, 25.f, 25.f)];
	if (self) {
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
		self.badgeText = badgeString;
		self.badgeTextColor = [UIColor whiteColor];
		self.badgeFrame = YES;
		self.badgeFrameColor = [UIColor whiteColor];
		self.badgeInsetColor = [UIColor redColor];
		self.badgeCornerRoundness = 0.4f;
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];
	}
	return self;
}

// I recommend to use the allocator customBadgeWithString
- (id) initWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining 
{
	self = [super initWithFrame:CGRectMake(0.f, 0.f, 25.f, 25.f)];
	if (self) {
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
		self.badgeText = badgeString;
		self.badgeTextColor = stringColor;
		self.badgeFrame = badgeFrameYesNo;
		self.badgeFrameColor = frameColor;
		self.badgeInsetColor = insetColor;
		self.badgeCornerRoundness = 0.4f;
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];
	}
	return self;
}


// Use this method if you want to change the badge text after the first rendering 
- (void) autoBadgeSizeWithString:(NSString *)badgeString
{
	CGSize retValue;
	CGFloat rectWidth, rectHeight;
	CGSize stringSize = [badgeString sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.f]}];
  
	if ([badgeString length] >= 2) {
		rectWidth = 18.f + stringSize.width;
    rectHeight = 25.f;
		retValue = CGSizeMake(rectWidth * _badgeScaleFactor, rectHeight * _badgeScaleFactor);
	} else {
		retValue = CGSizeMake(25.f * _badgeScaleFactor, 25.f * _badgeScaleFactor);
	}
  
  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, retValue.width, retValue.height);
  self.badgeText = badgeString;
  
  [self invalidateIntrinsicContentSize];
  [self setNeedsDisplay];
}


// Creates a Badge with a given Text 
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString
{
	return [[self alloc] initWithString:badgeString withScale:1.0f withShining:YES];
}


// Creates a Badge with a given Text, Text Color, Inset Color, Frame (YES/NO) and Frame Color 
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining
{
	return [[self alloc] initWithString:badgeString withStringColor:stringColor withInsetColor:insetColor withBadgeFrame:badgeFrameYesNo withBadgeFrameColor:frameColor withScale:scale withShining:shining];
}


// Draws the Badge with Quartz
- (void) drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
	
	CGFloat radius = CGRectGetMaxY(rect) * self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect) * 0.10f;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
  
  CGContextBeginPath(context);
	CGContextSetFillColorWithColor(context, [self.badgeInsetColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextSetShadowWithColor(context, CGSizeMake(1.0f, 1.0f), 3, [[UIColor blackColor] CGColor]);
  CGContextFillPath(context);

	CGContextRestoreGState(context);
}


// Draws the Badge Shine with Quartz
- (void) drawShineWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);

	CGFloat radius = CGRectGetMaxY(rect) * self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect) * 0.10f;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
  
	CGContextBeginPath(context);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClip(context);
	
	size_t num_locations = 2;
	CGFloat locations[2] = { 0.0f, 0.4f };
	CGFloat components[8] = {  0.92f, 0.92f, 0.92f, 1.0f, 0.82f, 0.82f, 0.82f, 0.4f };

	CGColorSpaceRef cspace;
	CGGradientRef gradient;
	cspace = CGColorSpaceCreateDeviceRGB();
	gradient = CGGradientCreateWithColorComponents (cspace, components, locations, num_locations);
	
	CGPoint sPoint = CGPointZero, ePoint = CGPointZero;
	ePoint.y = maxY;
	CGContextDrawLinearGradient (context, gradient, sPoint, ePoint, 0);
	
	CGColorSpaceRelease(cspace);
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(context);
}


// Draws the Badge Frame with Quartz
- (void) drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGFloat radius = CGRectGetMaxY(rect) * self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect) * 0.10f;
	
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
	
	CGContextBeginPath(context);
  
	CGFloat lineSize = 2;
	if (self.badgeScaleFactor > 1) {
		lineSize += self.badgeScaleFactor * 0.25f;
	}
	CGContextSetLineWidth(context, lineSize);
	CGContextSetStrokeColorWithColor(context, [self.badgeFrameColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClosePath(context);
	CGContextStrokePath(context);
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	[self drawRoundedRectWithContext:context withRect:rect];
	
	if (self.badgeShining) {
		[self drawShineWithContext:context withRect:rect];
	}
	
	if (self.badgeFrame)  {
		[self drawFrameWithContext:context withRect:rect];
	}
	
	if ([self.badgeText length] > 0) {
		[_badgeTextColor set];
		UIFont *textFont = [UIFont boldSystemFontOfSize:14.f];
		CGSize textSize = [self.badgeText sizeWithAttributes:@{NSFontAttributeName:textFont}];
		[self.badgeText drawAtPoint:CGPointMake((rect.size.width/2-textSize.width/2), (rect.size.height/2-textSize.height/2)) withAttributes:@{NSFontAttributeName:textFont, NSForegroundColorAttributeName: self.badgeTextColor}];
	}
}

@end
