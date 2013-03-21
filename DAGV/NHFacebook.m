//
//  NHFacebook.m
//  BettingExpert
//
//  Created by Nathan Hegedus on 9/11/12.
//  Copyright (c) 2012 pactodigital. All rights reserved.
//

#import "NHFacebook.h"
#import <FacebookSDK/FacebookSDK.h>
#import "LAAppDelegate.h"

@interface NHFacebook()

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSMutableDictionary *postParams;

@end

@implementation NHFacebook
@synthesize userName = _userName;

-(void)connectWithFacebook{
    
    LAAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    if (!appDelegate.session.isOpen) {
        [appDelegate openSessionCheckCache:NO];
    }
  

}

-(void)disconnectFacebook{

    LAAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate setIsFacebookConnected:NO];
    [[appDelegate session] close];
    
    NSUserDefaults *userPrefs = [NSUserDefaults standardUserDefaults];
    [userPrefs setObject:nil forKey:@"FacebookUserName"];

    [userPrefs synchronize];
}

-(void)facebookShareText:(NSString *)text{
    
    [self connectWithFacebook];
    
    
    FBRequestConnection *connection = [[FBRequestConnection alloc] init];
    
    FBRequest *request = [FBRequest requestForPostStatusUpdate:text];
    
    [connection addRequest:request completionHandler:^(FBRequestConnection *connection, id result, NSError *error){
        if (error) {
            [self.delegate facebookWasShared:NO];
            NSLog(@"error: %@",error);
        }else{
            [self.delegate facebookWasShared:YES];
            NSLog(@"posted");
        }
    }];
    
    [connection start];
    
}

-(NSMutableDictionary *)postParams{
    if (!_postParams) {
        _postParams = [[NSMutableDictionary alloc] init];
    }
    return _postParams;
}

-(void)facebookUploadPhotoWithImage:(UIImage *)image andText:(NSString *)text{
    
    [self connectWithFacebook];
    
    NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
    [params setObject:text forKey:@"message"];
    [params setObject:UIImagePNGRepresentation(image) forKey:@"picture"];
    
    [FBRequestConnection startWithGraphPath:@"me/photos"
                                 parameters:params
                                 HTTPMethod:@"POST"
                          completionHandler:^(FBRequestConnection *connection,
                                              id result,
                                              NSError *error)
     {
         if (error)
         {
             [self.delegate facebookWasShared:NO];

             NSLog(@"Error");

         }
         else
         {
             [self.delegate facebookWasShared:YES];

             NSLog(@"Uploaded");

         }

     }];

}

-(void)facebookUploadPhotoWithImage:(UIImage *)image{
    [self connectWithFacebook];
    
    
    FBRequestConnection *connection = [[FBRequestConnection alloc] init];
    
    FBRequest *request = [FBRequest requestForUploadPhoto:image];
    
    [connection addRequest:request completionHandler:^(FBRequestConnection *connection, id result, NSError *error){
        if (error) {
            [self.delegate facebookWasShared:NO];
            NSLog(@"error: %@",error);
        }else{
            [self.delegate facebookWasShared:YES];
            NSLog(@"posted");
        }
    }];
    
    [connection start];
}


-(NSString *)getUserName{
    NSUserDefaults *userPrefs = [NSUserDefaults standardUserDefaults];

    [FBRequestConnection
     startForMeWithCompletionHandler:^(FBRequestConnection *connection,
                                       id<FBGraphUser> user,
                                       NSError *error) {
         if (!error) {
             NSString *userName;
             userName = [user name];
             [userPrefs setObject:userName forKey:@"FacebookUserName"];
             [userPrefs synchronize];

         }

     }];

    return [userPrefs stringForKey:@"FacebookUserName"];
    
}

-(BOOL)verifyFacebookWasLogged{
    
    NSUserDefaults *userPrefs = [NSUserDefaults standardUserDefaults];
    
    if ([userPrefs stringForKey:@"FacebookUserName"]) {
        return YES;
    }else{
        return NO;
    }
    
}


@end
