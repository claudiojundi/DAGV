//
//  ExtrasViewController.m
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "ExtrasViewController.h"
#import "HeaderCell.h"
#import "MoreCell.h"
#import "Extras.h"
#import "LinksCell.h"

@interface ExtrasViewController ()

@property (nonatomic, strong) IBOutlet UILabel *lbl_navTitle;
@property (strong, nonatomic) IBOutlet UITableView *extrasTableView;
@property (nonatomic) int actualSection;
@property (nonatomic, strong) NSString *siteSelected;
@property (nonatomic,strong) NSArray *array;

@end

@implementation ExtrasViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.lbl_navTitle setText:[_type uppercaseString]];
}

#pragma mark - UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int extrasCount = [[Extras getExtrasListWithType:_type] count];
    return extrasCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[Extras getExtrasListWithType:_type] objectAtIndex:section] count] - 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIView *header = [[[NSBundle mainBundle] loadNibNamed:@"ExtraHeader" owner:self options:nil] lastObject];
        UILabel *lbl_title = (UILabel *)[header viewWithTag:1];
        [lbl_title setText:[Extras getExtrasListWithType:_type][section][0]];
        return header;
    } else {
        HeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
        _actualSection = section;
        
        [cell.titleLabel setText:[[[Extras getExtrasListWithType:_type] objectAtIndex:section] objectAtIndex:0]];
        
        [cell.contentView setFrame:CGRectMake(0, 22, 320, 25)];
        [cell.contentView setBackgroundColor:tableView.backgroundColor];
        [cell.titleLabel setFrame:CGRectMake(15, 3, 285, 21)];
        return cell;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   _array = [[Extras getExtrasListWithType:_type] objectAtIndex:_actualSection];
    
    LinksCell *linkCell = [tableView dequeueReusableCellWithIdentifier:@"LinkCell"];
    
     _siteSelected = [[[Extras getExtrasListWithType:_type] objectAtIndex:indexPath.section] objectAtIndex:1];
    
    [linkCell.titleLabel setText:_siteSelected];
    
    if ([_type isEqualToString:@"3"]){
        [linkCell.typeImageView setImage:[UIImage imageNamed:@"img_documents"]];
    }else {
        [linkCell.typeImageView setImage:[UIImage imageNamed:@"img_links"]];
    }
     return linkCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath indexPath = %@",indexPath);
    
      _siteSelected = [[[Extras getExtrasListWithType:_type] objectAtIndex:indexPath.section] objectAtIndex:1];
    
    NSString *message = [NSString stringWithFormat:@"Você esta saindo do aplicativo para entrar no site \n%@\n Deseja continuar?", _siteSelected];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atenção"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Não"
                                          otherButtonTitles:@"Sim", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        NSLog(@"_siteSelected = %@",_siteSelected);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_siteSelected]];
    }
}

@end
