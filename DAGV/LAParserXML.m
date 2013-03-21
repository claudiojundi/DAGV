//
//  LAParserXML.m
//  LAACE
//
//  Created by Nathan Hegedus on 17/10/12.
//  Copyright (c) 2012 Nathan Hegedus. All rights reserved.
//

#import "LAParserXML.h"
#import "LAFileManager.h"

#define SCHEDULE @"Schedule"
#define LEAGUES @"Leagues"
#define BORDERS @"Borders"
#define SPLASH @"Splash"

@implementation LAParserXML

+(int)totalOfSports{
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[dict objectForKey:@"Sports"] count];
}

+(NSString *)getSportFromIndex:(int)index{
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [[dict objectForKey:@"Sports"] objectAtIndex:index];

}

+(NSArray *)getDetailsFromSport:(NSString *)sport{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];

    return [dict objectForKey:sport];
}

+(NSArray *)getDetailsFromEvents{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return [dict objectForKey:@"Events"];
}


+(NSString *)getTwitterAccountFromIndex:(int)index{
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:LEAGUES ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistFile];
    
    return [[array objectAtIndex:index] valueForKey:@"Twitter"];
}

+(UIImage *)getTwitterImageFromIndex:(int)index{
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:LEAGUES ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistFile];
    
    UIImage *logotypeLeague = [UIImage imageNamed:[[array objectAtIndex:index] valueForKey:@"Logotype"]];
    
    return logotypeLeague;
}

+(NSString *)getDateEvent:(int)index{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];

    return [[dict objectForKey:@"Days"] objectAtIndex:index];

}

+(NSString *)getBorderNameByIndex:(int)index{
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:BORDERS ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistFile];
    
    return  [array objectAtIndex:index];
}

+(NSString *)getSplashImageFromIndex:(int)index{
    
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:SPLASH ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistFile];
    
    return [array objectAtIndex:index];
    
}


+(int)getTotalOfDays{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    
    return  [[dict objectForKey:@"Days"] count];
}

+(int)getTotalOfBorders{
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:BORDERS ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistFile];
    
    return  [array count];
}

+(int)getCountEventsForDay:(NSString *)date byEvent:(NSString *)event{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    int index = 0;
    
    for (int i = 0; i < [[dict objectForKey:event] count] ; i++) {
        if ([[[[dict objectForKey:event] objectAtIndex:i] valueForKey:@"date"] isEqualToString:date] ) {
            index ++;
        }
    }
    
    return index;
}

+(int)getIndexFromEventByDate:(NSString *)date forEvent:(NSString *)event{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[LAFileManager loadPlistFile]];
    int index = 0;
    
    for (int i = 0; i < [[dict objectForKey:event] count] ; i++) {
        if ([[[[dict objectForKey:event] objectAtIndex:i] valueForKey:@"date"] isEqualToString:date] ) {
            index = i;
            break;
        }
    }
    
    return index;
}

+(int)getTotalOfSplashes{
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:SPLASH ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistFile];
    
    return  [array count];
}

@end
