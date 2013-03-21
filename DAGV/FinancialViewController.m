//
//  FinancialViewController.m
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "FinancialViewController.h"
#import "Financial.h"
#import "MoreCell.h"

@interface FinancialViewController ()

@property (strong, nonatomic) IBOutlet UITableView *financialTableView;

@end

@implementation FinancialViewController

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
    
      [self setTitleNavigationController:@"FINANCEIRO"];
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setFinancialTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[Financial getFinancialList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [Financial getFinancialList];
    
    MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreCell"];
    NSString *string = [array objectAtIndex:indexPath.row];
    
    [cell.titleLabel setText:[string uppercaseString]];
    
       
    
    [cell.typeImageView setImage:[UIImage imageNamed:@"img_financial"]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *file = [Financial getFinancialSelected:indexPath.row];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: file]];

    
}

@end
