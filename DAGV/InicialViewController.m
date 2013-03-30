//
//  InicialViewController.m
//  DAGV
//
//  Created by Claudioj Sassaki on 12/3/12.
//  Copyright (c) 2012 Claudio Jundi Sassaki. All rights reserved.
//

#import "InicialViewController.h"
#import "LAParserXML.h"
#import "FeedWithImageCell.h"
#import "HeaderCell.h"
#import "LoadViewController.h"
#import "MoreItens.h"
#import "News.h"
#import "Events.h"
#import "ItemDetail.h"
#import "NewsDetailViewController.h"
#import "EventDetailViewController.h"
#import "ClubViewController.h"
#import "UIImage+AverageColor.h"

@interface InicialViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *itensArray;

@property (nonatomic,strong)UIImage *uiimage0;
@property (nonatomic,strong)UIImage *uiimage2;
@end

@implementation InicialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        LoadViewController *loadViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadViewController"];
        [self presentViewController:loadViewController animated:NO completion:^{
            //
        }];
        
    } else {
       
        LoadViewController *loadViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadViewController"];
        [self presentViewController:loadViewController animated:NO completion:^{
            //
        }];
    }
    
    _itensArray = [[NSMutableArray alloc] initWithObjects:@"Eventos", @"Noticias", nil];
    [_itensArray addObjectsFromArray:[MoreItens getItensList]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [_tableView reloadData];        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedWithImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedWithImageCell"];
    
    switch (indexPath.row) {
        case 0:
            [cell configureCellForNextEventsWithOptions:[Events getNextEventSelected:0]];
            break;
        case 1:
            [cell configureCellForNewsWithOptions:[News getNewSelected:0]];
            break;
        case 2:
            [cell configureCellForEventsWithOptions:[Events getEventSelected:0]];
            break;
        case 3:
            [cell configureCellForClubWithOptions:[ItemDetail getItemDetailSelected:@"Clube de benefícios"][0]];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            EventDetailViewController *eventDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"EventDetailViewController"];
            
            [self.navigationController pushViewController:eventDetailViewController animated:YES];
            
            NSDictionary *dict = [Events getNextEventSelected:0];
            
            [eventDetailViewController.titleLabel setText:[dict valueForKey:@"titulo"]];
            [eventDetailViewController.dateLabel setText:[dict valueForKey:@"data"]];
            [eventDetailViewController.descriptionLabel setText:[dict valueForKey:@"sobre"]];
            [eventDetailViewController setInfoDict:[dict valueForKey:@"descricao"]];
            
            NSString *imageString = dict[@"imagem"];
            [eventDetailViewController.topImageView setImage:[self imageWithURLString:imageString]];
            [eventDetailViewController.topImageView setBackgroundColor:[eventDetailViewController.topImageView.image averageColor]];
            break;
        }
        case 1: {
            NewsDetailViewController *newsDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
            [self.navigationController pushViewController:newsDetailViewController animated:YES];
            
            NSDictionary *dict = [News getNewSelected:0];
            
            [newsDetailViewController.titleLabel setText:[dict valueForKey:@"titulo"]];
            [newsDetailViewController.dateLabel setText:[dict valueForKey:@"data"]];
            [newsDetailViewController.descriptionLabel setText:[dict valueForKey:@"noticia"]];
            break;
        }
        case 2: {
            EventDetailViewController *eventDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"EventDetailViewController"];
            
            [self.navigationController pushViewController:eventDetailViewController animated:YES];
            
            NSDictionary *dict = [Events getEventSelected:0];
            
            [eventDetailViewController.titleLabel setText:[dict valueForKey:@"titulo"]];
            [eventDetailViewController.dateLabel setText:[dict valueForKey:@"data"]];
            [eventDetailViewController.descriptionLabel setText:[dict valueForKey:@"sobre"]];
            [eventDetailViewController setInfoDict:[dict valueForKey:@"descricao"]];
            
            NSString *imageString = dict[@"imagem"];
            [eventDetailViewController.topImageView setImage:[self imageWithURLString:imageString]];
            [eventDetailViewController.topImageView setBackgroundColor:[eventDetailViewController.topImageView.image averageColor]];
            
            break;
        }
        case 3: {
            ClubViewController *clubViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ClubViewController"];
            NSArray *array = [MoreItens getItensList];
            
            [clubViewController setItem:[array objectAtIndex:0]];
            [self.navigationController pushViewController:clubViewController animated:YES];
            break;
        }
        default:
            break;
    }
}

- (UIImage *)imageWithURLString:(NSString *)imageURLString
{
    NSURL * imageURL = [NSURL URLWithString:imageURLString];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    return [UIImage imageWithData:imageData];
}

@end
