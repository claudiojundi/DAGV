//
//  LAFileManager.h
//  LAACE
//
//  Created by Nathan Hegedus on 24/10/12.
//  Copyright (c) 2012 Nathan Hegedus. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FileManagerDelegate <NSObject>

@optional

-(void)fileManagerDownloadCompleted:(BOOL)error;

@end


@interface LAFileManager : NSObject

@property (nonatomic, strong) id <FileManagerDelegate> delegate;

-(void)downloadContent;
-(BOOL)verifyFileExists;
+(NSString *)loadPlistFile;

@end
