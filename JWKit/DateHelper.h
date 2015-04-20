//
//  DateHelper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

+(NSDate *)dateFromString:(NSString *)dateString;
+(NSString *)dateFormattedBrazilStandard:(NSDate *)date;
+(NSString *)dateFormattedISO8601Standard:(NSDate *)date;
+(NSString *)dateTimeFormattedISO8601Standard:(NSDate *)date;
-(NSString *)getCurrentDate;
+(void)addNumberOfDays:(int)days onDate:(NSDate *)date;
+(void)addNumberOfHours:(int)hours onDate:(NSDate *)date;
+(NSInteger)daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;
+(NSDate *)decreaseOneDayInDate:(NSDate *)date;
-(NSString *)dateTimeFormat:(NSDate *)date;
+(BOOL)thisDate:(NSDate *)date isMoreRecentThanOtherDate:(NSDate *)otherDate;

@end
