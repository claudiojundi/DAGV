//
//  ProjectsViewController.m
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "ProjectsViewController.h"
#import "ProjectDetailViewController.h"
#import "Project.h"
#import "FeedCell.h"


@interface ProjectsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *projectsTableView;

@end

@implementation ProjectsViewController

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
    [self setTitleNavigationController:@"projetos"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setProjectsTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[Project getProjectList] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [Project getProjectSelected:indexPath.row];
    
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"];
    
    [cell.titleLabel setText:[array valueForKey:@"titulo"]];
    [cell.dateLabel setText:[array valueForKey:@"noticia"]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
    
    ProjectDetailViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ProjectDetailViewController"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSArray *dict = [Project getProjectSelected:indexPath.row];
    
    [viewController.titleLabel setText:[dict valueForKey:@"titulo"]];
    [viewController.dateLabel setText:[dict valueForKey:@"data"]];
    [viewController.descriptionLabel setText:[dict valueForKey:@"noticia"]];
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
    dispatch_async(queue, ^{
        
        
        NSURL * imageURL = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
        
        
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        
        // NSURL *imageURL2 = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage * image = [UIImage imageWithData:imageData];
            
            [viewController.thumbImageView setImage:image];
        });
    });
    
    
}

@end
