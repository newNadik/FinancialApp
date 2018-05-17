//
//  FAMenuButton.m
//  Financial App
//
//  Created by Nadiia Ivanova on 5/17/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import "FAMenuButton.h"
#import "FAConstants.h"

@implementation FAMenuButton {
    UILabel *iconLabel;
    UILabel *titleLabel;
}

@synthesize icon = _icon;
@synthesize title = _title;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self initInternals];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self initInternals];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self setTitle:@"" forState:UIControlStateNormal];
    if(!titleLabel){
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 + self.frame.size.height, 0,
                                                               self.frame.size.width - 20 - self.frame.size.height, self.frame.size.height)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = self.titleLabel.font;
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.text = self.title;
        [self addSubview:titleLabel];
        
        iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.height, self.frame.size.height)];
        iconLabel.textAlignment = NSTextAlignmentCenter;
        iconLabel.backgroundColor = [UIColor clearColor];
        iconLabel.font = [UIFont fontWithName:@"streamline" size:self.titleLabel.font.pointSize];
        iconLabel.textColor = [UIColor darkGrayColor];
        iconLabel.text = self.icon;
        [self addSubview:iconLabel];
    }
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.backgroundColor = [UIColor colorWithRed:0.83 green:0.83 blue:0.83 alpha:0.6];
    titleLabel.textColor = GREEN;
    iconLabel.textColor = GREEN;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    self.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor darkGrayColor];
    iconLabel.textColor = [UIColor darkGrayColor];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    self.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor darkGrayColor];
    iconLabel.textColor = [UIColor darkGrayColor];
}

- (void)initInternals{
    self.backgroundColor = [UIColor clearColor];
}

@end
