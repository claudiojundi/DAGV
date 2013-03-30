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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_descriptionLabel setText:[[_infoDict valueForKey:@"texto"] objectAtIndex:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_infoDict count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIView *header = [[[NSBundle mainBundle] loadNibNamed:@"EventHeader" owner:self options:nil] lastObject];
        UILabel *lbl_title = (UILabel *)[header viewWithTag:1];
        [lbl_title setText:_infoDict[section][@"tipo"]];
        return header;
    } else {
        EventHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventHeaderCell"];
        [cell.titleLabel setText:[[_infoDict objectAtIndex:section] valueForKey:@"tipo"]];
        
        cell.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
        [cell.titleLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
        
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)t heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [[_infoDict objectAtIndex:indexPath.section] valueForKey:@"descricao"];
    CGFloat textHeight = [self adjustedTextHeight:text font:[UIFont systemFontOfSize:20.0f] constraintSize:CGSizeMake(self.eventDetailTableView.frame.size.width - 10.0f * 2, 1000.0f)];
    
    return textHeight + 10.0f * 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventCell * cell = [tableView dequeueReusableCellWithIdentifier: @"EventCell"];
    [cell.descriptionTextView setText:[[_infoDict objectAtIndex:indexPath.section] valueForKey:@"descricao"]];
     return cell;
}

- (CGFloat)adjustedTextHeight:(NSString *)text font:(UIFont *)font constraintSize:(CGSize)size
{
    return [text sizeWithFont:font constrainedToSize:size].height;
}

@end
