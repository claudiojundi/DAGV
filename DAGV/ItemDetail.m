//
//  ItemDetail.m
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "ItemDetail.h"
#import "MoreItens.h"

@implementation ItemDetail


+(NSArray *)getItemDetailSelected:(NSString *)item{
    
    return [MoreItens getItemDescSelected:item];
    
}

@end
