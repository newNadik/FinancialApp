//
//  FAMainViewController.m
//  Financial App
//
//  Created by Nadiia Ivanova on 5/12/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import "FAMainViewController.h"

@interface FAMainViewController ()

@end

@implementation FAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)signOutPressed:(id)sender {
    [((AppDelegate*)[UIApplication sharedApplication].delegate) signOut];
}

@end
