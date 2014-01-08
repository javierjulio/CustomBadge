//
//  CustomBadgeAppDelegate.h
//  CustomBadge
//

#import <UIKit/UIKit.h>

@class CustomBadgeViewController;

@interface CustomBadgeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *__weak window;
    CustomBadgeViewController *__weak viewController;
}

@property (weak, nonatomic) IBOutlet UIWindow *window;
@property (weak, nonatomic) IBOutlet CustomBadgeViewController *viewController;

@end

