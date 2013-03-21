//
//  Club.h
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Club : NSObject

+(NSArray *)getClassificationList;
+(NSString *)getClassificationSelected:(int)index;

@end
