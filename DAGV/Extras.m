//
//  Extras.m
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "Extras.h"
#import "LAFileManager.h"

@implementation Extras

+(NSArray *)getExtrasListWithType:(NSString *)type{
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[array valueForKey:@"Mais - Descritivo"] valueForKey:type];
}

+(NSString *)getExtrasSelected:(int)index andType:(NSString *)type{
    
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[[array valueForKey:@"Mais - Descritivo"] valueForKey:type ] objectAtIndex:index];
    
}

@end
