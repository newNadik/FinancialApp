//
//  FACreateBudgetViewController.m
//  Financial App
//
//  Created by Nadiia Ivanova on 5/18/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import "FACreateBudgetViewController.h"

@interface FACreateBudgetViewController ()

@end

@implementation FACreateBudgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setValue:@(YES) forKeyPath:@"hidesShadow"];
}



@end
