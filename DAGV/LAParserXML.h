//
//  LAParserXML.h
//  LAACE
//
//  Created by Nathan Hegedus on 17/10/12.
//  Copyright (c) 2012 Nathan Hegedus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAParserXML : NSObject

+(int)totalOfSports;
+(NSString *)getSportFromIndex:(int)index;
+(NSArray *)getDetailsFromSport:(NSString *)sport;
+(NSArray *)getDetailsFromEvents;
+(NSString *)getTwitterAccountFromIndex:(int)index;
+(UIImage *)getTwitterImageFromIndex:(int)index;
+(NSString *)getDateEvent:(int)index;
+(NSString *)getBorderNameByIndex:(int)index;
+(NSString *)getSplashImageFromIndex:(int)index;

+(int)getTotalOfDays;
+(int)getCountEventsForDay:(NSString *)date byEvent:(NSString *)event;
+(int)getIndexFromEventByDate:(NSString *)date forEvent:(NSString *)event;
+(int)getTotalOfBorders;
+(int)getTotalOfSplashes;
@end
