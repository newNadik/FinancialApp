//
//  FASignInViewController.m
//  Financial App
//
//  Created by Nadiia Ivanova on 5/12/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import "FASignInViewController.h"

@interface FASignInViewController ()

@property IBOutlet NSLayoutConstraint *arrowDownPosition;
@property IBOutlet NSLayoutConstraint *arrowUpPosition;
@property CGFloat arrowsAnimationDelta;
@property BOOL isFirstAnimation;
@end

@implementation FASignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;
    self.arrowsAnimationDelta = 10.f;
    self.isFirstAnimation = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self arrowsAnimationStart];
}

- (void)animateArrows {
    int rndValue = 3 + arc4random() % (15 - 3);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, rndValue * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self arrowsAnimationStart];
        });
    });
}

- (void)arrowsAnimationStart {
    [self.arrowDownPosition setConstant:self.arrowsAnimationDelta];
    [self.arrowUpPosition setConstant:self.arrowsAnimationDelta];
    
    [UIView animateWithDuration:0.25f delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         if(finished){
                             [self arrowsAnimationEnd];
                         }
                     }];
}

- (void)arrowsAnimationEnd {
    [self.arrowDownPosition setConstant:0];
    [self.arrowUpPosition setConstant:0];
    
    [UIView animateWithDuration:0.15f delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         if(finished){
                             if(self.isFirstAnimation) [self arrowsAnimationStart];
                             else [self animateArrows];
                             self.isFirstAnimation = !self.isFirstAnimation;
                         }
                     }];
}

@end
