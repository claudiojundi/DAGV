//
//  Events.m
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "Events.h"
#import "LAFileManager.h"

@implementation Events

+(NSArray *)getEventList{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [dict objectForKey:@"Eventos"];
}

+(NSDictionary *)getEventSelected:(int)index{

    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];

    return [[dict objectForKey:@"Eventos"] objectAtIndex:index];
    
}

@end
