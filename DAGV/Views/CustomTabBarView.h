//
//  CustomTabBarView.h
//  DAGV
//
//  Created by Gilson Gil on 3/29/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

@protocol CustomTabBarDelegate <NSObject>
- (void)selectButtonAtIndex:(NSInteger)index;
@end

@interface CustomTabBarView : UIView
@property (nonatomic, strong) id <CustomTabBarDelegate> tabBarDelegate;
@end
