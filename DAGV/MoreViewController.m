//
//  MoreViewController.m
//  DAGV
//
//  Created by Claudioj Sassaki on 12/3/12.
//  Copyright (c) 2012 Claudio Jundi Sassaki. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreCell.h"
#import "MoreItens.h"
#import "ClubViewController.h"
#import "ProjectsViewController.h"
#import "FinancialViewController.h"
#import "ExtrasViewController.h"

@interface MoreViewController ()



@end

@implementation MoreViewController

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setItensTableView:nil];
    [super viewDidUnload];
}


#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[MoreItens getItensList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [MoreItens getItensList];
    
    MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreCell"];
    NSString *string = [array objectAtIndex:indexPath.row];
    
    [cell.titleLabel setText:[string uppercaseString]];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [cell.titleLabel setFrame:CGRectMake(0, 0, 346, 21)];
    }
    
    
    switch (indexPath.row) {
        case 0:
            [cell.typeImageView setImage:[UIImage imageNamed:@"img_club_benefits"]];
            break;
        case 1:
            [cell.typeImageView setImage:[UIImage imageNamed:@"img_projects"]];
            break;
        case 2:
            [cell.typeImageView setImage:[UIImage imageNamed:@"img_financial"]];
            break;
        case 3:
            [cell.typeImageView setImage:[UIImage imageNamed:@"img_documents"]];
            break;
        case 4:
            [cell.typeImageView setImage:[UIImage imageNamed:@"img_links"]];
            break;
            
        default:
            break;
    }
    
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *mainStoryboard;
    NSArray *array = [MoreItens getItensList];
    
    UIViewController *viewController;
    ClubViewController *clubViewController;
    ProjectsViewController *projectsViewController;
    FinancialViewController *financialViewController;
    ExtrasViewController *extrasViewController;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
 mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle: nil];
    } else {
         mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
    }
   
    
    
    if (indexPath.row == 0){
        clubViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ClubViewController"];
        [clubViewController setItem:[array objectAtIndex:indexPath.row]];
        viewController = clubViewController;
        
    }else if (indexPath.row == 1){
        projectsViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ProjectsViewController"];
        [projectsViewController setItem:[array objectAtIndex:indexPath.row]];
        viewController = projectsViewController;
    }else if (indexPath.row == 2){
        financialViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"FinancialViewController"];
        viewController = financialViewController;
    }else if (indexPath.row == 3 ){
        extrasViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ExtrasViewController"];
       [extrasViewController setType:[array objectAtIndex:indexPath.row]];
       viewController = extrasViewController; 
    }
    
    else if (indexPath.row == 4){
        extrasViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ExtrasViewController"];
        [extrasViewController setType:[array objectAtIndex:indexPath.row]];
        viewController = extrasViewController;
    }
    
    
    
    [self.navigationController pushViewController:viewController animated:YES];

    
}




@end
