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

@interface EventsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;
@property (weak,nonatomic) UIImage * uiImage;

@property(strong,nonatomic)NSMutableArray *nsMutableArray;

@end

@implementation EventsViewController
	
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
    
    [self setTitleNavigationController:@"EVENTOS"];
    
    
    
    if (_nsMutableArray != NULL){
        
        [_nsMutableArray removeAllObjects];
        _nsMutableArray = NULL;
    }
    
    _nsMutableArray = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setEventsTableView:nil];
    [super viewDidUnload];
}


#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

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
        
        _uiImage = image;
        
        [cell.thumbImageView setImage:image];
            
            if (image != NULL){
                 [_nsMutableArray insertObject:image atIndex:indexPath.row];
            }
            
           
            
             });
    
   
    });
    
   
    
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
    
    
    EventDetailViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"EventDetailViewController"];

    [self.navigationController pushViewController:viewController animated:YES];
    
    NSDictionary *dict = [Events getEventSelected:indexPath.row];

    [viewController.titleLabel setText:[dict valueForKey:@"titulo"]];
    [viewController.dateLabel setText:[dict valueForKey:@"data"]];
    [viewController.descriptionLabel setText:[dict valueForKey:@"sobre"]];
    [viewController setInfoDict:[dict valueForKey:@"descricao"]];
    
    
    
    @try {
        [viewController.topImageView setImage:[_nsMutableArray objectAtIndex:indexPath.row]];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }

   
    
   
    
}

@end
