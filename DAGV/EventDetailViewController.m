//
//  EventDetailViewController.m
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "EventDetailViewController.h"
#import "EventCell.h"
#import "EventHeaderCell.h"

@interface EventDetailViewController ()

@property (strong, nonatomic) IBOutlet UITableView *eventDetailTableView;

@end

@implementation EventDetailViewController

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
    
      [self setTitleNavigationController:@"EVENTOS"];
    
	// Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_descriptionLabel setText:[[_infoDict valueForKey:@"texto"] objectAtIndex:0]];
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
    [self setEventDetailTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableView Delegate

#pragma mark - UItableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_infoDict count];
}

//- (NSString *)tableView:(UITableView *)tableView
//titleForHeaderInSection:(NSInteger)section
//{
//    return [[_infoDict allKeys] objectAtIndex:section];
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    EventHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventHeaderCell"];
    [cell.titleLabel setText:[[_infoDict objectAtIndex:section] valueForKey:@"tipo"]];
    
    
    cell.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
    [cell.titleLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];

    
    return cell;
}

- (NSInteger)tableView:(UITableView *)table
 numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)t heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = [[_infoDict objectAtIndex:indexPath.section] valueForKey:@"descricao"];
    CGSize textSize = [text sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(self.eventDetailTableView.frame.size.width - 10.0f * 3, 1000.0f)];
    
    return textSize.height + 10.0f * 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   EventCell * cell = [tableView dequeueReusableCellWithIdentifier: @"EventCell"];
    [cell.descriptionTextView setText:[[_infoDict objectAtIndex:indexPath.section] valueForKey:@"descricao"]];
        
     return cell;
}

@end
