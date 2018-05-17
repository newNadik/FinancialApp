//
//  FAMenuButton.h
//  Financial App
//
//  Created by Nadiia Ivanova on 5/17/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface FAMenuButton : UIButton

@property (nonatomic, strong) IBInspectable  NSString *icon;
@property (nonatomic, strong) IBInspectable  NSString *title;

@end
