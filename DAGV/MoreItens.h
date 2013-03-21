//
//  MoreItens.h
//  DAGV
//
//  Created by Nathan Hegedus on 09/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoreItens : NSObject

+(NSArray *)getItensList;
+(NSArray *)getItemSelected:(int)index;

+(NSArray *)getItensDescList;
+(NSArray *)getItemDescSelected:(NSString *)item;

@end
