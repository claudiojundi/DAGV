//
//  MoreItens.m
//  DAGV
//
//  Created by Nathan Hegedus on 09/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "MoreItens.h"
#import "LAFileManager.h"

@implementation MoreItens

+(NSArray *)getItensList{
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [array valueForKey:@"Mais - Itens"];
}

+(NSString *)getItemSelected:(int)index{
    
    NSArray *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[array valueForKey:@"Mais - Itens"] objectAtIndex:index];
    
}


+(NSArray *)getItensDescList{
    NSDictionary *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [array valueForKey:@"Mais - Descritivo"];
}

+(NSArray *)getItemDescSelected:(NSString *)item{
    
    NSDictionary *array = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[array valueForKey:@"Mais - Descritivo"] objectForKey:item];
    
}

@end
