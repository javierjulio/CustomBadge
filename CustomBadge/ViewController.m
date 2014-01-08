//
//  ViewController.m
//  CustomBadge
//
//  Created by Javier Julio on 1/8/14.
//  Copyright (c) 2014 Javier Julio. All rights reserved.
//

#import "ViewController.h"
#import "CustomBadge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
	CustomBadge *customBadge1 = [CustomBadge customBadgeWithString:@"2"
                                                 withStringColor:[UIColor whiteColor]
                                                  withInsetColor:[UIColor redColor]
                                                  withBadgeFrame:YES
                                             withBadgeFrameColor:[UIColor whiteColor]
                                                       withScale:1.0
                                                     withShining:YES];
  
	CustomBadge *customBadge2 = [CustomBadge customBadgeWithString:@"CustomBadge"
                                                 withStringColor:[UIColor blackColor]
                                                  withInsetColor:[UIColor greenColor]
                                                  withBadgeFrame:YES
                                             withBadgeFrameColor:[UIColor yellowColor]
                                                       withScale:1.5
                                                     withShining:YES];
	
	CustomBadge *customBadge3 = [CustomBadge customBadgeWithString:@"Now Retina Ready!"
                                                 withStringColor:[UIColor whiteColor]
                                                  withInsetColor:[UIColor blueColor]
                                                  withBadgeFrame:YES
                                             withBadgeFrameColor:[UIColor whiteColor]
                                                       withScale:1.5
                                                     withShining:YES];
  
	CustomBadge *customBadge4 = [CustomBadge customBadgeWithString:@"1"
                                                 withStringColor:[UIColor whiteColor]
                                                  withInsetColor:[UIColor colorWithRed:0xf2/255. green:0x6f/255. blue:0x1e/255. alpha:1.0]
                                                  withBadgeFrame:YES
                                             withBadgeFrameColor:[UIColor whiteColor]
                                                       withScale:1.0
                                                     withShining:NO];
  
	CustomBadge *customBadge5 = [CustomBadge customBadgeWithString:@"5"
                                                 withStringColor:[UIColor whiteColor]
                                                  withInsetColor:[UIColor colorWithRed:0xf2/255. green:0x6f/255. blue:0x1e/255. alpha:1.0]
                                                  withBadgeFrame:YES
                                             withBadgeFrameColor:[UIColor whiteColor]
                                                       withScale:1.0
                                                     withShining:NO];
  
	CustomBadge *customBadge6 = [CustomBadge customBadgeWithString:@"12"
                                                 withStringColor:[UIColor whiteColor]
                                                  withInsetColor:[UIColor colorWithRed:0xf2/255. green:0x6f/255. blue:0x1e/255. alpha:1.0]
                                                  withBadgeFrame:YES
                                             withBadgeFrameColor:[UIColor whiteColor]
                                                       withScale:1.0
                                                     withShining:NO];
  
	CustomBadge *customBadge7 = [CustomBadge customBadgeWithString:@"234"
                                                 withStringColor:[UIColor whiteColor]
                                                  withInsetColor:[UIColor colorWithRed:0xf2/255. green:0x6f/255. blue:0x1e/255. alpha:1.0]
                                                  withBadgeFrame:YES
                                             withBadgeFrameColor:[UIColor whiteColor]
                                                       withScale:1.0
                                                     withShining:NO];
	
  // Set positions
	[customBadge1 setFrame:CGRectMake(self.view.frame.size.width/2-customBadge1.frame.size.width/2+customBadge2.frame.size.width/2, 110, customBadge1.frame.size.width, customBadge1.frame.size.height)];
	[customBadge2 setFrame:CGRectMake(self.view.frame.size.width/2-customBadge2.frame.size.width/2, 110, customBadge2.frame.size.width, customBadge2.frame.size.height)];
	[customBadge3 setFrame:CGRectMake(self.view.frame.size.width/2-customBadge3.frame.size.width/2, 150, customBadge3.frame.size.width, customBadge3.frame.size.height)];
	[customBadge4 setFrame:CGRectMake(self.view.frame.size.width/2-customBadge4.frame.size.width/2, 220, customBadge4.frame.size.width, customBadge4.frame.size.height)];
	[customBadge5 setFrame:CGRectMake(self.view.frame.size.width/2-customBadge5.frame.size.width/2, 250, customBadge5.frame.size.width, customBadge5.frame.size.height)];
	[customBadge6 setFrame:CGRectMake(self.view.frame.size.width/2-customBadge6.frame.size.width/2, 280, customBadge6.frame.size.width, customBadge6.frame.size.height)];
	[customBadge7 setFrame:CGRectMake(self.view.frame.size.width/2-customBadge7.frame.size.width/2, 310, customBadge7.frame.size.width, customBadge7.frame.size.height)];
  
	// Add Badges to View
	[self.view addSubview:customBadge2];
	[self.view addSubview:customBadge1];
	[self.view addSubview:customBadge3];
	[self.view addSubview:customBadge4];
	[self.view addSubview:customBadge5];
	[self.view addSubview:customBadge6];
	[self.view addSubview:customBadge7];
  
	// Change text afterwards
	//[customBadge1 autoBadgeSizeWithString:@"New!"];
	
	// Convert Badge (based on UIView) to an UIImageView
	/*
  UIGraphicsBeginImageContextWithOptions((customBadge1.frame.size), FALSE, [[UIScreen mainScreen] scale]);
  [customBadge1.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *badgeAsImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  UIImageView *imageView = [[UIImageView alloc] initWithImage:badgeAsImage];
  imageView.frame = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
  [self.view addSubview:imageView];
  [imageView release];
  */
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
