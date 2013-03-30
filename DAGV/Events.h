//
//  Events.h
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

@interface Events : NSObject

+(NSArray *)getEventList;
+(NSDictionary *)getEventSelected:(int)index;
+ (NSDictionary *)getNextEventSelected:(int)index;

@end
