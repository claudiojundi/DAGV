//
//  Project.h
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

+(NSArray *)getProjectList;
+(NSArray *)getProjectSelected:(int)index;

@end
