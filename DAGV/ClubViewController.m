//
//  ClubViewController.m
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "ClubViewController.h"
#import "ItemDetail.h"
#import "ClubCell.h"

@interface ClubViewController ()

@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

@property (strong, nonatomic) IBOutlet UITableView *clubTableView;

@property (nonatomic, strong) NSString *siteSelected;

@property (nonatomic, strong) NSMutableArray *searchArray;

@property (nonatomic) BOOL isSearching;

@end

@implementation ClubViewController

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
    _searchArray = [[NSMutableArray alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleNavigationController:_item];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSearchTextField:nil];
    [self setClubTableView:nil];
    [super viewDidUnload];
}


#pragma mark - Textfield Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //INICIA A BUSCA
    [_searchArray removeAllObjects];
    
    _searchArray = [self search:_searchTextField.text];
    
    [_searchTextField resignFirstResponder];
    

    if ([_searchArray count] > 0) {
        [_clubTableView reloadData];
        _isSearching = YES;
    }else{
        _isSearching = NO;
    }
    
    return YES;
}


#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (_isSearching) {
        
        return [_searchArray count];
        
    }else{
        
        NSArray *array = [ItemDetail getItemDetailSelected:_item];
        return [array count];
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [ItemDetail getItemDetailSelected:_item];
    ClubCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClubCell"];
    
    int index;
    
    if (_isSearching) {
        index = [[_searchArray objectAtIndex:indexPath.row] intValue];
    }else{
        index = indexPath.row;
    }
   //
//    [cell.thumbImageView setImage:[UIImage imageNamed:[[array objectAtIndex:indexPath.row] valueForKey:@"imagem"]]];
    [cell.typeLabel setText:[[array objectAtIndex:index] valueForKey:@"classificacao"]];
    [cell.placeLabel setText:[[array objectAtIndex:index] valueForKey:@"nome"]];
    [cell.addressLabel setText:[[array objectAtIndex:index] valueForKey:@"endereço"]];
    [cell.daysLabel setText:[[array objectAtIndex:index] valueForKey:@"dias de promocao"]];
    [cell.guestsLabel setText:[[array objectAtIndex:index] valueForKey:@"numero de acompanhantes"]];
    [cell.productsLabel setText:[[array objectAtIndex:index] valueForKey:@"produtos da promocao"]];
    [cell.discountLabel setText:[[array objectAtIndex:index] valueForKey:@"desconto"]];
    [cell.siteLabel setTitle:[[array objectAtIndex:index] valueForKey:@"site"] forState:UIControlStateNormal];
    [cell.siteLabel addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
    dispatch_async(queue, ^{
        
        NSString *imageStringURL = [[array objectAtIndex:index] valueForKey:@"imagem"];
        
        
        NSURL * imageURL = [NSURL URLWithString:imageStringURL];
        
         NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        
        // NSURL *imageURL2 = [NSURL URLWithString:[dict valueForKey:@"imagem"]];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage * image = [UIImage imageWithData:imageData];
            
            [cell.thumbImageView setImage:image];
        });
    });
    
    
    
    
    
    
    
    
    if (indexPath.row == [_searchArray count]) {
        [_searchArray removeAllObjects];
    }
    
    return cell;
    
}

#pragma mark - Internal Methods

-(void)openLink:(id)sender{
    UIButton *button = sender;
    _siteSelected = [NSString stringWithFormat:@"http://%@", button.titleLabel.text];
    NSString *message = [NSString stringWithFormat:@"Você esta saindo do aplicativo para entrar no site \n%@\n Deseja continuar?", _siteSelected];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atenção"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Não"
                                          otherButtonTitles:@"Sim", nil];
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_siteSelected]];

            break;
            
        default:
            break;
    }
}

-(NSMutableArray *)search:(NSString *)text{
    
    NSMutableArray *indexFounded = [[NSMutableArray alloc] init];
    
    NSArray *array = [ItemDetail getItemDetailSelected:_item];

    for (int i = 0; i < [array count]; i++) {
        
        NSString *classificacao = [[[array objectAtIndex:i] valueForKey:@"classificacao"] lowercaseString];
        NSString *nome = [[[array objectAtIndex:i] valueForKey:@"nome"] lowercaseString];
        NSString *endereco = [[[array objectAtIndex:i] valueForKey:@"endereço"] lowercaseString];
        NSString *promocao = [[[array objectAtIndex:i] valueForKey:@"dias de promocao"] lowercaseString];
        NSString *acompanhante = [[[array objectAtIndex:i] valueForKey:@"numero de acompanhantes"] lowercaseString];
        NSString *produtos = [[[array objectAtIndex:i] valueForKey:@"produtos da promocao"] lowercaseString];
        NSString *desconto = [[[array objectAtIndex:i] valueForKey:@"desconto"] lowercaseString];
        NSString *site = [[[array objectAtIndex:i] valueForKey:@"site"] lowercaseString];
        
        
        NSRange classificacaoRange = [classificacao rangeOfString:text options:NSCaseInsensitiveSearch];
        NSRange nomeRange = [nome rangeOfString:text options:NSCaseInsensitiveSearch];
        NSRange enderecoRange = [endereco rangeOfString:text options:NSCaseInsensitiveSearch];
        NSRange promocaoRange = [promocao rangeOfString:text options:NSCaseInsensitiveSearch];
        NSRange acompanhanteRange = [acompanhante rangeOfString:text options:NSCaseInsensitiveSearch];
        NSRange produtosRange = [produtos rangeOfString:text options:NSCaseInsensitiveSearch];
        NSRange descontoRange = [desconto rangeOfString:text options:NSCaseInsensitiveSearch];
        NSRange siteRange = [site rangeOfString:text options:NSCaseInsensitiveSearch];

        if(classificacaoRange.location == 0 || nomeRange.location == 0 || enderecoRange.location == 0 || promocaoRange.location == 0 ||
           acompanhanteRange.location == 0 || produtosRange.location == 0 || descontoRange.location == 0 || siteRange.location == 0) {
            
            [indexFounded addObject:[NSString stringWithFormat:@"%d",i]];
        }
//        } else {
//            NSRange isSpacedRange = [someString rangeOfString:@" is " options:NSCaseInsensitiveSearch];
//            if(isSpacedRange.location != NSNotFound) {
//                //found it...
//            }
//        }
        
        
//        NSLog(@"%d",[text rangeOfString:classificacao].location);
//        
//        if (/*[text rangeOfString:classificacao].location != NSNotFound   || */[text rangeOfString:nome].location != NSNotFound /*||
//            [text rangeOfString:endereco].location != NSNotFound        || [text rangeOfString:promocao].location != NSNotFound ||
//            [text rangeOfString:acompanhante].location != NSNotFound    || [text rangeOfString:produtos].location != NSNotFound ||
//            [text rangeOfString:desconto].location != NSNotFound        || [text rangeOfString:site].location != NSNotFound */) {
//            
//            [indexFounded addObject:[NSString stringWithFormat:@"%d",i]];
//        }
    }
    
    return indexFounded;
    
}

@end
