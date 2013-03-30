//
//  CustomTabbarViewController.m
//  DAGV
//
//  Created by Claudioj Sassaki on 12/26/12.
//  Copyright (c) 2012 Claudio Jundi Sassaki. All rights reserved.
//

#import "CustomTabbarViewController.h"
#import "CustomTabBarView.h"

@interface CustomTabbarViewController () <CustomTabBarDelegate>

@end

@implementation CustomTabbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *selectedImage0;
    UIImage *unselectedImage0;
    
    UIImage *selectedImage1;
    UIImage *unselectedImage1;
    
    UIImage *selectedImage2;
    UIImage *unselectedImage2;
    
    UIImage *selectedImage3;
    UIImage *unselectedImage3;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [self.tabBar setAlpha:0.0f];
        
        CustomTabBarView *customTabBar = [[[NSBundle mainBundle] loadNibNamed:@"CustomTabBarView" owner:self options:nil] lastObject];
        [customTabBar setFrame:CGRectMake(0.0f, self.view.frame.size.height - customTabBar.frame.size.height, customTabBar.frame.size.width, customTabBar.frame.size.height)];
        [customTabBar setTabBarDelegate:self];
        [self.view addSubview:customTabBar];
        
    } else {
    
        selectedImage0 = [UIImage imageNamed:@"icn_initial_on.png"];
        unselectedImage0 = [UIImage imageNamed:@"icn_initial_off.png"];
        
        selectedImage1 = [UIImage imageNamed:@"icn_news_on.png"];
        unselectedImage1 = [UIImage imageNamed:@"icn_news_off.png"];
        
        selectedImage2 = [UIImage imageNamed:@"icn_events_on.png"];
        unselectedImage2 = [UIImage imageNamed:@"icn_events_off.png"];
        
        selectedImage3 = [UIImage imageNamed:@"icn_more_on.png"];
        unselectedImage3 = [UIImage imageNamed:@"icn_more_off.png"];

        [[[self tabBar].items objectAtIndex:0] setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
        [[[self tabBar].items objectAtIndex:1] setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
        [[[self tabBar].items objectAtIndex:2] setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
        [[[self tabBar].items objectAtIndex:3] setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];

        NSArray *selectedImages = [[NSArray alloc]initWithObjects:selectedImage0,selectedImage1,selectedImage2,selectedImage3, nil];
        NSArray *unselectedImages = [[NSArray alloc]initWithObjects:unselectedImage0,unselectedImage1,unselectedImage2,unselectedImage3, nil];
        
        [self addSelectedImageItens:selectedImages unselectedImages:unselectedImages tabBarItemLength:4];
    }
}

- (void)addSelectedImageItens:(NSArray *)selectedImages  unselectedImages:(NSArray *)unselectedImagesArray tabBarItemLength:(int)length
{
    UITabBar *tabBar = self.tabBar;
    
    for (int i = 0; i < length; i++) {
        
        UITabBarItem *tabBarItem = [tabBar.items objectAtIndex:i];
        [tabBarItem setFinishedSelectedImage:[selectedImages objectAtIndex:i] withFinishedUnselectedImage:[unselectedImagesArray objectAtIndex:i]];
    }
}

#pragma mark - Custom Tab Bar Delegate

- (void)selectButtonAtIndex:(NSInteger)index
{
    [self setSelectedIndex:index];
}

@end
