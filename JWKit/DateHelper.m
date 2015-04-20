//
//  DateHelper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "DateHelper.h"
#import "Constants.h"

@implementation DateHelper

+(NSDate *)dateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSTimeZone *tz = [NSTimeZone timeZoneWithName:kTimeZoneGreenwich];
    [dateFormatter setDateFormat:kDateTimeFormatISO8601];
    [dateFormatter setTimeZone:tz];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    if ( date == nil ) {
        
        // Get first 4 caracteres of dateString
        NSString *year = [dateString substringWithRange:NSMakeRange(0, 4)];
        
        if ( ! [year isEqualToString:@"0000"] ) {
            
            dateString = [NSString stringWithFormat:@"%@ %@", dateString, @"23:59:59"];
            date = [dateFormatter dateFromString:dateString];
            return date;
            
        }
        
        [dateFormatter setDateFormat:kDateFormatISO8601];
        date = [dateFormatter dateFromString:dateString];
        
    }
    
    return date;
    
}

+(NSString *)dateFormattedBrazilStandard:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSTimeZone *tz = [NSTimeZone timeZoneWithName:kTimeZoneGreenwich];
    [dateFormatter setDateFormat:kDateFormatBrazil];
    [dateFormatter setTimeZone:tz];
    
    NSString *dateFormatted = [dateFormatter stringFromDate:date];
    
    if ( dateFormatted == nil ) {
        return @"0000-00-00";
    } else {
        return dateFormatted;
    }
    
}

+(NSString *)dateFormattedISO8601Standard:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSTimeZone *tz = [NSTimeZone timeZoneWithName:kTimeZoneGreenwich];
    [dateFormatter setDateFormat:kDateFormatISO8601];
    [dateFormatter setTimeZone:tz];
    
    NSString *dateFormatted = [dateFormatter stringFromDate:date];
    
    if ( dateFormatted == nil ) {
        return @"0000-00-00";
    } else {
        return dateFormatted;
    }
    
}

+(NSString *)dateTimeFormattedISO8601Standard:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSTimeZone *tz = [NSTimeZone timeZoneWithName:kTimeZoneGreenwich];
    [dateFormatter setDateFormat:kDateTimeFormatISO8601];
    [dateFormatter setTimeZone:tz];
    
    NSString *dateFormatted = [dateFormatter stringFromDate:date];
    
    if ( dateFormatted == nil ) {
        return @"0000-00-00 00:00:00";
    } else {
        return dateFormatted;
    }
    
}

-(NSString *)getCurrentDate {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.timeZone = [NSTimeZone timeZoneWithName:kTimeZoneAmericaSaoPaulo];
    formatter.dateFormat = kDateTimeFormatISO8601;
    
    NSDate *now = [NSDate date];
    
    return [formatter stringFromDate:now];
    
}

+(void)addNumberOfDays:(int)days onDate:(NSDate *)date {
    
    int seconds = 60;
    int minutes = 60;
    int hours   = 24;
    int daysToAdd = days*hours*minutes*seconds;
    
    date = [date dateByAddingTimeInterval:daysToAdd];
    
}

+(void)addNumberOfHours:(int)hours onDate:(NSDate *)date {
    
    int seconds = 60;
    int minutes = 60;
    
    int hoursToAdd = hours*minutes*seconds;
    
    date = [date dateByAddingTimeInterval:hoursToAdd];
    
}

+(NSInteger)daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime {
    
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
    
}

+(NSDate *)decreaseOneDayInDate:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    
    // I test if hour is equal 2 because of timezone America/Sao Paulo with +03:00:00
    if ( hour == 2 && minute == 59 ) {
        
        NSDate *newDate = [date dateByAddingTimeInterval:(-1)*24*60*60];
        
        return newDate;
        
    }
    
    return date;
    
}

-(NSString *)dateTimeFormat:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd/MM/yyyy - HH:mm"];
    
    NSString *dateFormatted = [dateFormatter stringFromDate:date];
    
    return dateFormatted;
    
}

+(BOOL)thisDate:(NSDate *)date isMoreRecentThanOtherDate:(NSDate *)otherDate {
    
    if ( date && ! otherDate )
        return YES;
    
    if ( ! date )
        return NO;
    
    return ( [date compare:otherDate] == NSOrderedDescending );
    
}

@end
