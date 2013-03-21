//
//  Financial.h
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Financial : NSObject

+(NSArray *)getFinancialList;
+(NSString *)getFinancialSelected:(int)index;

@end
