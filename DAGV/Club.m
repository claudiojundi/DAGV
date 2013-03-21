//
//  Club.m
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "Club.h"
#import "LAFileManager.h"

@implementation Club

+(NSArray *)getClassificationList{
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [array valueForKey:@"Mais - Classificacao"];
}

+(NSString *)getClassificationSelected:(int)index{
    
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[array valueForKey:@"Mais - Classificacao"] objectAtIndex:index];
    
}


@end
