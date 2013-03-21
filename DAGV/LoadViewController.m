//
//  LoadViewController.m
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "LoadViewController.h"
#import "LAFileManager.h"
#import "ConnectionTest.h"

@interface LoadViewController ()

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIButton *logButton;
@property (strong, nonatomic) IBOutlet UILabel *logLabel;

@property (nonatomic, strong) LAFileManager *fileManager;

-(IBAction)downloadContent;

@end

@implementation LoadViewController

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
    
    
    [self downloadContent];
    
//    [self dismissModalViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setActivityIndicator:nil];
    [self setLogButton:nil];
    [self setLogLabel:nil];
    [super viewDidUnload];
}


#pragma mark - Internal Methods

-(IBAction)downloadContent{
    
    _fileManager = [[LAFileManager alloc] init];
    [_fileManager setDelegate:self];
    [_logLabel setText:@"Atualizando conteúdo."];
    [_logButton setEnabled:NO];
    [_activityIndicator setHidden:NO];
    
    if ([ConnectionTest testInternetAndWifiConnection]) {
        
        [_fileManager downloadContent];
        
    }else{
        
        [_activityIndicator setHidden:YES];
        [_logLabel setText: @"Erro de conexão. \nToque aqui para tentar novamente."];
        [_logButton setEnabled:YES];
        
        if([_fileManager verifyFileExists]) {
    
            [self dismissModalViewControllerAnimated:NO];
    
        }
    }
    
}

-(void)closeView{
    
    [self dismissModalViewControllerAnimated:NO];

}

#pragma mark - FileManager Delegate

-(void)fileManagerDownloadCompleted:(BOOL)error{

    if(error == NO){
    
        [self closeView];
        
    }else{
        if([_fileManager verifyFileExists]) {
            
            [_activityIndicator setHidden:YES];
            [_logLabel setText: @"Erro de conexão. \nNão foi possível atualizar o conteúdo."];
            [_logButton setEnabled:YES];
            
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(closeView) userInfo:nil repeats:NO];
            
        }else{
            [_activityIndicator setHidden:YES];
            [_logLabel setText: @"Erro de conexão. \nToque aqui para tentar novamente."];
            [_logButton setEnabled:YES];

        }
    }
    
}

@end
