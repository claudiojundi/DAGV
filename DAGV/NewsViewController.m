//
//  NewsViewController.m
//  DAGV
//
//  Created by Claudioj Sassaki on 12/3/12.
//  Copyright (c) 2012 Claudio Jundi Sassaki. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"
#import "FeedCell.h"
#import "News.h"

@interface NewsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *newsTableView;

@end

@implementation NewsViewController

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
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[News getNewsList] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = [News getNewSelected:indexPath.row];
    
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"];
    
    [cell.titleLabel setText:[dict valueForKey:@"titulo"]];
    [cell.dateLabel setText:[dict valueForKey:@"data"]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *mainStoryboard;
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle: nil];
        
    } else {
        mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
        
    }
    
    
     NewsDetailViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSDictionary *dict = [News getNewSelected:indexPath.row];
    
    [viewController.titleLabel setText:[dict valueForKey:@"titulo"]];
    [viewController.dateLabel setText:[dict valueForKey:@"data"]];
    [viewController.descriptionLabel setText:[dict valueForKey:@"noticia"]];
    
    
}

- (void)viewDidUnload {
    [self setNewsTableView:nil];
    [super viewDidUnload];
}
@end
