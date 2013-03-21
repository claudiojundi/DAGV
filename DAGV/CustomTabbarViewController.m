//
//  CustomTabbarViewController.m
//  DAGV
//
//  Created by Claudioj Sassaki on 12/26/12.
//  Copyright (c) 2012 Claudio Jundi Sassaki. All rights reserved.
//

#import "CustomTabbarViewController.h"

@interface CustomTabbarViewController ()

@end

@implementation CustomTabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        selectedImage0 = [UIImage imageNamed:@"icn_initial_on_ipad.png"];
         unselectedImage0 = [UIImage imageNamed:@"icn_initial_off_ipad.png"];
        
         selectedImage1 = [UIImage imageNamed:@"icn_news_on_ipad.png"];
       unselectedImage1 = [UIImage imageNamed:@"icn_news_off_ipad.png"];
        
        selectedImage2 = [UIImage imageNamed:@"icn_events_on_ipad.png"];
        unselectedImage2 = [UIImage imageNamed:@"icn_events_off_ipad.png"];
        
        selectedImage3 = [UIImage imageNamed:@"icn_more_on_ipad.png"];
        unselectedImage3 = [UIImage imageNamed:@"icn_more_off_ipad.png"];
        
        
        NSLog(@"passou dentro do if do ipad");
        
        
//        //top left bottom right

        //[[[[self.tabBar.items objectAtIndex:0] subviews] objectAtIndex:0] setFrame: CGRectMake(0, 0, 192, 168)];
        //[[self.tabBar.items objectAtIndex:0] setFrame:CGRectMake(0 , 0, 192, 100)];
        
        [[[self tabBar].items objectAtIndex:0] setImageInsets:UIEdgeInsetsMake(30, 60, 20, 60)];
        [[[self tabBar].items objectAtIndex:1] setImageInsets:UIEdgeInsetsMake(30, 60, 20, 60)];
        [[[self tabBar].items objectAtIndex:2] setImageInsets:UIEdgeInsetsMake(30, 60, 20, 60)];
        [[[self tabBar].items objectAtIndex:3] setImageInsets:UIEdgeInsetsMake(30, 60, 20, 60)];
        

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

        
    }

    
          
     
     NSArray *selectedImages = [[NSArray alloc]initWithObjects:selectedImage0,selectedImage1,selectedImage2,selectedImage3, nil];
     NSArray *unselectedImages = [[NSArray alloc]initWithObjects:unselectedImage0,unselectedImage1,unselectedImage2,unselectedImage3, nil];
     
     [self addSelectedImageItens:selectedImages unselectedImages:unselectedImages tabBarItemLength:4];
    
    
    
    UIImage *navigationBackground = [[UIImage imageNamed:@"img_nav_bar.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [[UINavigationBar appearance] setBackgroundImage:navigationBackground forBarMetrics:UIBarMetricsDefault];
    
    
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"btn_nav_back"]  resizableImageWithCapInsets:UIEdgeInsetsMake(0,15,0,15)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    
}

-(void)addSelectedImageItens:(NSArray *)selectedImages  unselectedImages:(NSArray *)unselectedImagesArray tabBarItemLength:(int)length
{
    
    UITabBar *tabBar = self.tabBar;
    
    for (int i = 0; i < length; i++) {
        
        UITabBarItem *tabBarItem = [tabBar.items objectAtIndex:i];
        [tabBarItem setFinishedSelectedImage:[selectedImages objectAtIndex:i] withFinishedUnselectedImage:[unselectedImagesArray objectAtIndex:i]];
        
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
