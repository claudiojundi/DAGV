//
//  LAFileManager.m
//  LAACE
//
//  Created by Nathan Hegedus on 24/10/12.
//  Copyright (c) 2012 Nathan Hegedus. All rights reserved.
//

#import "LAFileManager.h"
#import "ASIHTTPRequest.h"


#define DESTINATION_BASE_PATH [NSHomeDirectory() stringByAppendingFormat:@"/Plist"]
#define DESTINATION_THUMB_PATH [NSHomeDirectory() stringByAppendingFormat:@"/Plist/Thumb"]

#define URL_FILE @"http://www.dagv.com.br/site/FeedDAGV.plist"//http://s3.amazonaws.com/hegedusTest/FeedDAGV.plist
#define FILE_NAME @"FeedDAGV"

@implementation LAFileManager

-(void)downloadContent{

    if (![[NSFileManager defaultManager] fileExistsAtPath:[self thumbPath]]) {
        BOOL boolean = [[NSFileManager defaultManager] createDirectoryAtPath:[self thumbPath] withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"%d",boolean);
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self filePath]]) {
        BOOL boolean = [[NSFileManager defaultManager] createDirectoryAtPath:[self filePath] withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"%d",boolean);
    }
    
    
    ASIHTTPRequest *file = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:URL_FILE]];
    [file setDownloadDestinationPath: [NSString stringWithFormat:@"%@/%@.plist", [self thumbPath], FILE_NAME]];
    [file setTemporaryFileDownloadPath:[NSString stringWithFormat:@"%@/temp%@.download",[self thumbPath] ,FILE_NAME]];
    [file setAllowResumeForFileDownloads:NO];
    [file startAsynchronous];
    

    [file setCompletionBlock:^{
        [self verifyFileVersion];
    }];
    
    [file setFailedBlock:^{
        
        [self.delegate fileManagerDownloadCompleted:YES];

        NSLog(@"download error: %@", file.error);
    }];
}


-(void)verifyFileVersion{
//    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *plistFile = [NSString stringWithFormat:@"%@/%@.plist",[self filePath], FILE_NAME];
    NSString *newFilePath = [NSString stringWithFormat:@"%@/%@.plist",[self thumbPath], FILE_NAME];

    NSDictionary *existsFileDict = [NSDictionary dictionaryWithContentsOfFile:plistFile];
    NSDictionary *newFileDict = [NSDictionary dictionaryWithContentsOfFile: newFilePath];
    
    float versionNewFile = [[newFileDict objectForKey:@"Version"] floatValue];
    float versionOldFile = [[existsFileDict objectForKey:@"Version"] floatValue];

    if (versionNewFile > versionOldFile) {
        NSLog(@"new file, version: %f",versionNewFile);
        [self updateFile];
    }else{
        NSLog(@"old file, version: %f",versionOldFile);
    }
    
    [self removeThumbFile];
    
}

-(void)removeThumbFile{
    NSString *thumb = [NSString stringWithFormat:@"%@",[self thumbPath]];

    if ([[NSFileManager defaultManager] removeItemAtPath:thumb error:nil]) {
        NSLog(@"removed");
        [self.delegate fileManagerDownloadCompleted:NO];

    }else{
        NSLog(@"nothing");
    }
}

-(void)updateFile{
    
    NSString *actualFile = [NSString stringWithFormat:@"%@/%@.plist",[self filePath], FILE_NAME];
    NSString *newFile = [NSString stringWithFormat:@"%@/%@.plist",[self thumbPath], FILE_NAME];
    NSError *error;
    
    [[NSFileManager defaultManager] removeItemAtPath:actualFile error:nil];
    
//    if () {
        if ([[NSFileManager defaultManager] moveItemAtPath:newFile toPath:actualFile error:&error]) {
            NSLog(@"moved");
        }else{
            NSLog(@"error: %@",error);
        }
//    }

}

-(BOOL)verifyFileExists{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/%@.plist",[self filePath], FILE_NAME]]) {
        return YES;
    }else{
        return NO;
    }
    
}

-(NSString *)thumbPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
    NSString *thumbPath = [NSString stringWithFormat:@"%@/Thumb", documentsDir];
    
    return thumbPath;
}

-(NSString *)filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/Plist", documentsDir];
    
    return filePath;
}

+(NSString *)loadPlistFile{
    
    NSString *plistFile;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
    
    plistFile = [NSString stringWithFormat:@"%@/Plist/%@.plist", documentsDir, FILE_NAME];
    ///////////////////////////////////	//////////////////////////////////////	/////////////////////////// TEST ONLY FOR NEW PLIST
//    NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"FeedDAGV" ofType:@"plist"];
    ///////////////////////////////////	//////////////////////////////////////	///////////////////////////
    return  plistFile;
    
}

@end
