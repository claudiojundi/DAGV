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
#import "UIImage+AverageColor.h"

@interface ProjectsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *projectsTableView;

@end

@implementation ProjectsViewController

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Project getProjectList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [Project getProjectSelected:indexPath.row];
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"];
    [cell.titleLabel setText:[array valueForKey:@"titulo"]];
    [cell.dateLabel setText:[array valueForKey:@"noticia"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectDetailViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProjectDetailViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSArray *dict = [Project getProjectSelected:indexPath.row];
    
    [viewController.titleLabel setText:[dict valueForKey:@"titulo"]];
    [viewController.dateLabel setText:[dict valueForKey:@"data"]];
    [viewController.descriptionLabel setText:[dict valueForKey:@"noticia"]];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
    dispatch_async(queue, ^{
        NSURL * imageURL = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage * image = [UIImage imageWithData:imageData];
            [viewController.thumbImageView setImage:image];
            [viewController.thumbImageView setBackgroundColor:[image averageColor]];
        });
    });
}

@end
