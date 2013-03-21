//
//  Financial.m
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "Financial.h"
#import "LAFileManager.h"

@implementation Financial

+(NSArray *)getFinancialList{
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[array valueForKey:@"Mais - Descritivo"] valueForKey:@"Financeiro"];
}

+(NSString *)getFinancialSelected:(int)index{
    
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[[array valueForKey:@"Mais - Descritivo"] valueForKey:@"Financeiro" ] objectAtIndex:index];
    
}

@end
