//
//  News.m
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "News.h"
#import "LAFileManager.h"

@implementation News

+(NSArray *)getNewsList{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [dict objectForKey:@"Noticias"];
}

+(NSDictionary *)getNewSelected:(int)index{
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[dict objectForKey:@"Noticias"] objectAtIndex:index];
    
}

@end
