//
//  FAMainViewController.m
//  Financial App
//
//  Created by Nadiia Ivanova on 5/12/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import "FAMainViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@import Firebase;

@interface FAMainViewController ()

@property IBOutlet UIView *blurView;
@property IBOutlet UIView *drawerView;
@property IBOutlet NSLayoutConstraint *drawerPosition;

@property IBOutlet UIImageView *userAvatarImageView;
@property IBOutlet UILabel *usernameLabel;
@property IBOutlet UILabel *emailLabel;

@property IBOutlet UILabel *logoutIconLabel;

@end

@implementation FAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController.navigationBar setValue:@(YES) forKeyPath:@"hidesShadow"];
    [self.emailLabel setText:[FIRAuth auth].currentUser.email];
    [self.usernameLabel setText:[FIRAuth auth].currentUser.displayName];
    [self.userAvatarImageView sd_setImageWithURL:[FIRAuth auth].currentUser.photoURL];
    [self.logoutIconLabel setText:@"\ue26c"];
}

- (IBAction)menuPressed:(id)sender{
    if(self.drawerPosition.constant == 0){
        self.drawerPosition.constant = self.drawerView.frame.size.width;
        [self.blurView setHidden:NO];
        [UIView animateWithDuration:0.3
                              delay:0.0f options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             [self.view layoutIfNeeded];
                             [self.blurView setAlpha:1.0f];
                         } completion:^(BOOL finished) {  }];
    } else {
        self.drawerPosition.constant = 0.0f;
        [UIView animateWithDuration:0.3
                              delay:0.0f options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             [self.view layoutIfNeeded];
                             [self.blurView setAlpha:0.0f];
                         } completion:^(BOOL finished) {
                             if(finished) [self.blurView setHidden:YES];
                         }];
    }
}

- (IBAction)signOutPressed:(id)sender {
    [((AppDelegate*)[UIApplication sharedApplication].delegate) signOut];
}

@end
