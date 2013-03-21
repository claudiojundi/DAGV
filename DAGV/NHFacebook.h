//
//  NHFacebook.h
//  BettingExpert
//
//  Created by Nathan Hegedus on 9/11/12.
//  Copyright (c) 2012 pactodigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FacebookDelegate <NSObject>

@required
-(void)facebookWasShared:(BOOL)posted;

@end

@interface NHFacebook : NSObject

@property (nonatomic, strong) id <FacebookDelegate> delegate;

-(void)connectWithFacebook;
-(void)disconnectFacebook;
-(void)facebookShareText:(NSString *)text;
-(void)facebookUploadPhotoWithImage:(UIImage *)image;
-(void)facebookUploadPhotoWithImage:(UIImage *)image andText:(NSString *)text;

-(NSString *)getUserName;

-(BOOL)verifyFacebookWasLogged;

@end
