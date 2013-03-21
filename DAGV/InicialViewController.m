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

@interface InicialViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *itensArray;

@property (nonatomic,strong)UIImage *uiimage0;
@property (nonatomic,strong)UIImage *uiimage2;


@end

@implementation InicialViewController

@synthesize uiimage0 = _uiimage0;
@synthesize uiimage2 = _uiimage2;


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
    

    

    [self setTitleNavigationController:@"Inicial"];
    
    
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle: nil];
        LoadViewController *loadViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoadViewController"];
        [self presentViewController:loadViewController animated:NO completion:^{
            //
        }];
        
    } else {
       
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
        LoadViewController *loadViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoadViewController"];
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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    return [_itensArray count];
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;// [_itensArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FeedWithImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedWithImageCell"];

    NSDictionary *dict;
    
    if (indexPath.row == 0) {
        
        
      
        
        
        [cell.typeLabel setText:@"Evento mais próximo"];
         cell.typeLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
        dict = [Events getEventSelected:0];
        
        [cell.titleLabel setText:[dict valueForKey:@"titulo"]];
        [cell.titleLabel setTextColor:[UIColor colorWithRed:0.75 green:0.68 blue:0.48 alpha:1]];
        cell.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
        
        [cell.dateLabel setText:[dict valueForKey:@"data"]];
        [cell.descriptionLabel setText:[dict valueForKey:@"sobre"]];
        [cell.typeLabel setTextColor:[UIColor whiteColor]];
        [cell.topBackgroundView setBackgroundColor:[UIColor colorWithRed:0.75 green:0.68 blue:0.48 alpha:1]];
        
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
        dispatch_async(queue, ^{
            
             NSURL * imageURL = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
            
            
            NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
            
            // NSURL *imageURL2 = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage * image = [UIImage imageWithData:imageData];
                
                _uiimage0 = image;
                
                [cell.thumbImageView setImage:image];
            });
        });

        
        
    }else{
        if (indexPath.row == 1) {
            dict = [News getNewSelected:0];
            [cell.typeLabel setText:@"Notícias"];
            cell.typeLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
              [cell.typeLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
            
            [cell.titleLabel setText:[dict valueForKey:@"titulo"]];
            [cell.titleLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
            cell.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
            
            [cell.dateLabel setText:[dict valueForKey:@"data"]];
            [cell.descriptionLabel setText:[dict valueForKey:@"noticia"]];
            [cell.topBackgroundView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
            
            
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
            dispatch_async(queue, ^{
              
               
               NSURL * imageURL = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
               
               
                NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
               
               // NSURL *imageURL2 = [NSURL URLWithString:[dict valueForKey:@"imagem"]];

               
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage * image = [UIImage imageWithData:imageData];
                    
                    [cell.thumbImageView setImage:image];
                });
            });
            
            
            
        }else{
            if (indexPath.row == 2) {
                
                [cell.typeLabel setText:@"Eventos"];
                cell.typeLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
                [cell.typeLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];

                
                dict = [Events getEventSelected:0];
                
                [cell.titleLabel setText:[dict valueForKey:@"titulo"]];
                
                [cell.dateLabel setText:[dict valueForKey:@"data"]];
                [cell.titleLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
                cell.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
                
                [cell.descriptionLabel setText:[dict valueForKey:@"sobre"]];
               [cell.topBackgroundView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
                
                
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
                dispatch_async(queue, ^{
                    
                    
                    NSURL * imageURL = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
                    
                    
                    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
                    
                    // NSURL *imageURL2 = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
                    
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIImage * image = [UIImage imageWithData:imageData];
                        
                        _uiimage2 = image;
                        
                        [cell.thumbImageView setImage:image];
                    });
                });

                

            }else{
                if (indexPath.row == 3) {
                    
                    NSArray *array = [ItemDetail getItemDetailSelected:@"Clube de benefícios"];

                    [cell.typeLabel setText:@"Clube de Benefícios"];
                    cell.typeLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
                    [cell.typeLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
                    
                    [cell.titleLabel setText:[[array objectAtIndex:0] valueForKey:@"classificacao"]];
                    [cell.titleLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
                   cell.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
                    
                    [cell.dateLabel setText:[[array objectAtIndex:0] valueForKey:@"nome"]];
                    [cell.descriptionLabel setText:[[array objectAtIndex:0] valueForKey:@"endereço"]];
                     [cell.topBackgroundView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
                    
                    
                    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
                    dispatch_async(queue, ^{
                        
                        NSString *imageStringURL = [[array objectAtIndex:0] valueForKey:@"imagem"];
                        
                        NSURL * imageURL = [NSURL URLWithString:imageStringURL];
                        
                        
                        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
                        
                        // NSURL *imageURL2 = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
                        
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            UIImage * image = [UIImage imageWithData:imageData];
                            
                            [cell.thumbImageView setImage:image];
                        });
                    });

                }
            }
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *mainStoryboard;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
       mainStoryboard  = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle: nil];//TODO
    }else {
       mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];//TODO
    }
    
    
    NewsDetailViewController *newsDetailViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
    EventDetailViewController *eventDetailViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"EventDetailViewController"];
    ClubViewController *clubViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ClubViewController"];

    if (indexPath.row == 0 || indexPath.row == 2) {
        
        [self.navigationController pushViewController:eventDetailViewController animated:YES];
        
        NSDictionary *dict = [Events getEventSelected:0];
        
        [eventDetailViewController.titleLabel setText:[dict valueForKey:@"titulo"]];
        [eventDetailViewController.dateLabel setText:[dict valueForKey:@"data"]];
        [eventDetailViewController.descriptionLabel setText:[dict valueForKey:@"sobre"]];
        [eventDetailViewController setInfoDict:[dict valueForKey:@"descricao"]];
        
        if (indexPath.row == 0){
            
            [eventDetailViewController.topImageView setImage:_uiimage0];
            
             
        }else {
             [eventDetailViewController.topImageView setImage:_uiimage2];
        }
        
       
        
        
    }else{
        
        if (indexPath.row == 1) {
            
            [self.navigationController pushViewController:newsDetailViewController animated:YES];
            
            NSDictionary *dict = [News getNewSelected:0];
            
            [newsDetailViewController.titleLabel setText:[dict valueForKey:@"titulo"]];
            [newsDetailViewController.dateLabel setText:[dict valueForKey:@"data"]];
            [newsDetailViewController.descriptionLabel setText:[dict valueForKey:@"noticia"]];
            
        }else{
            NSArray *array = [MoreItens getItensList];

            [clubViewController setItem:[array objectAtIndex:0]];
            [self.navigationController pushViewController:clubViewController animated:YES];

        }
        
    }
    
}


@end
