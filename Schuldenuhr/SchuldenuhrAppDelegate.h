//
//  SchuldenuhrAppDelegate.h
//  Schuldenuhr
//
//  Created by Philip Brechler on 08.09.11.
//  Copyright 2011 Hoccer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface SchuldenuhrAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
