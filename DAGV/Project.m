//
//  Project.m
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "Project.h"
#import "LAFileManager.h"

@implementation Project

+(NSArray *)getProjectList{
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[array valueForKey:@"Mais - Descritivo"] valueForKey:@"Projetos"];
}

+(NSArray *)getProjectSelected:(int)index{
    
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[[array valueForKey:@"Mais - Descritivo"] valueForKey:@"Projetos" ] objectAtIndex:index];
    
}

@end
