//
//  AppDelegate.h
//  Financial App
//
//  Created by Nadiia Ivanova on 5/12/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import GoogleSignIn;
@import Firebase;

@interface AppDelegate : UIResponder<UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)signOut;

@end

