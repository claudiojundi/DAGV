//
//  CustomTabBarView.m
//  DAGV
//
//  Created by Gilson Gil on 3/29/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "CustomTabBarView.h"

@interface CustomTabBarView ()
@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, strong) IBOutlet UIButton *btn0;
@property (nonatomic, strong) IBOutlet UIButton *btn1;
@property (nonatomic, strong) IBOutlet UIButton *btn2;
@property (nonatomic, strong) IBOutlet UIButton *btn3;
@end

@implementation CustomTabBarView

- (void)awakeFromNib
{
    [self buttons];
    [self.btn0 setSelected:TRUE];
}

- (IBAction)tabBarPressed:(UIButton *)button
{
    [self selectButton:button];
    [self.tabBarDelegate selectButtonAtIndex:button.tag - 1];
}

- (void)selectButton:(UIButton *)selectedButton
{
    [self.buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        [button setSelected:button == selectedButton];
    }];
}

- (NSArray *)buttons
{
    if (!_buttons)
        _buttons = @[self.btn0, self.btn1, self.btn2, self.btn3];
    return _buttons;
}

@end
