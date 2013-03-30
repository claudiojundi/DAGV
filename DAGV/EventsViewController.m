//
//  EventsViewController.m
//  DAGV
//
//  Created by Claudioj Sassaki on 12/3/12.
//  Copyright (c) 2012 Claudio Jundi Sassaki. All rights reserved.
//

#import "EventsViewController.h"
#import "Events.h"
#import "FeedWithImageCell.h"
#import "EventDetailViewController.h"
#import "UIImage+AverageColor.h"

@interface EventsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

@end

@implementation EventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Events getEventList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = [Events getEventSelected:indexPath.row];
    
    FeedWithImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedWithImageCell"];
    [cell.typeLabel setText:@"Eventos Próximos"];
    
    [cell.titleLabel setText:[dict valueForKey:@"titulo"]];
    [cell.dateLabel setText:[dict valueForKey:@"data"]];
    [cell.descriptionLabel setText:[dict valueForKey:@"sobre"]];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
    dispatch_async(queue, ^{
        NSURL * imageURL =[NSURL URLWithString:[dict valueForKey:@"imagem"]];
        
       // NSURL *imageURL2 = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
        
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
        UIImage * image = [UIImage imageWithData:imageData];
        
        [cell.thumbImageView setImage:image];
        [cell.thumbImageView setBackgroundColor:[image averageColor]];
        });
    });
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventDetailViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"EventDetailViewController"];

    [self.navigationController pushViewController:viewController animated:YES];
    
    NSDictionary *dict = [Events getEventSelected:indexPath.row];

    [viewController.titleLabel setText:[dict valueForKey:@"titulo"]];
    [viewController.dateLabel setText:[dict valueForKey:@"data"]];
    [viewController.descriptionLabel setText:[dict valueForKey:@"sobre"]];
    [viewController setInfoDict:[dict valueForKey:@"descricao"]];
    
    NSURL * imageURL =[NSURL URLWithString:[dict valueForKey:@"imagem"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    [viewController.topImageView setImage:image];
    [viewController.topImageView setBackgroundColor:[image averageColor]];
}

@end
