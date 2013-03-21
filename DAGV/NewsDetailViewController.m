//
//  NewsDetailViewController.m
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

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
	

    [self setTitleNavigationController:@"NOTÍCIAS"];
    
    
//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//    {
//        _descriptionLabel.contentSize = CGSizeMake(730, 820);
//        _descriptionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:28];
//        
//        
//    } else {
//        
//              
//        _descriptionLabel.contentSize = CGSizeMake(294, 235);
//        _descriptionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
//      
//        
//        
//        
//       
//        
//        
//    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLabel:nil];
    [self setDateLabel:nil];
    [self setDescriptionLabel:nil];
    [super viewDidUnload];
}

@end
