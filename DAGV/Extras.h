//
//  Extras.h
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Extras : NSObject

+(NSArray *)getExtrasListWithType:(NSString *)type;
+(NSString *)getExtrasSelected:(int)index andType:(NSString *)type;

@end
