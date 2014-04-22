//
//  DatePropertySupport.m
//  DatePropertySupport
//
//  Created by masafumi hayashi on 4/21/14.
//  Copyright (c) 2014 masafumi hayashi. All rights reserved.
//

#import "DatePropertySupport.h"

static NSDateComponents * component(NSDate * date, NSCalendarUnit unit)
{
    NSCalendar* c = [NSCalendar currentCalendar];
    return [c components:unit fromDate:date];
}

static NSString * get_value(NSDate * date, NSString * sym);
static NSString * get_value(NSDate * date, NSString * sym)
{
    NSDateFormatter *fmt = [NSDateFormatter new];
    [fmt setDateFormat:sym];
    
    return [fmt stringFromDate:date];
}

@implementation NSDate (PropertySupport)
- (NSInteger)era
{
    return [component(self, NSCalendarUnitEra) era];
}

- (NSString *)eraName
{
    return get_value(self, @"GG");
}

- (NSInteger)year
{
    return [component(self, NSCalendarUnitYear) year];
}

- (NSInteger)month
{
    return [component(self, NSCalendarUnitMonth) month];
}

- (NSString *)monthName
{
    return get_value(self, @"MMM");
}

- (NSString *)monthFullName
{
    return get_value(self, @"MMMM");
}

- (NSString *)monthShortName
{
    return get_value(self, @"MMMMM");
}

- (NSInteger)day
{
    return [component(self, NSCalendarUnitDay) day];
}

- (NSInteger)dayOfYear
{
    return get_value(self, @"DDD").integerValue;
}

- (NSInteger)hour
{
    return [component(self, NSCalendarUnitHour) hour];
}

- (NSInteger)hour12
{
    return get_value(self, @"hh").integerValue;
}

- (NSInteger)minute
{
    return [component(self, NSCalendarUnitMinute) minute];
}

- (NSInteger)second
{
    return [component(self, NSCalendarUnitSecond) second];
}

- (NSInteger)weekday
{
    return [component(self, NSCalendarUnitWeekday) weekday];
}

- (NSString *)weekdayName
{
    return get_value(self, @"eee");
}

- (NSString *)weekdayFullName
{
    return get_value(self, @"eeee");
}

- (NSString *)weekdayNarrowName
{
    return get_value(self, @"eeeee");
}

- (NSString *)weekdayShortName
{
    return get_value(self, @"eeeeee");
}

- (NSString *)period
{
    return get_value(self, @"a");
}

- (NSInteger)weekdayOrdinal
{
    return [component(self, NSCalendarUnitWeekdayOrdinal) weekdayOrdinal];
}

- (NSInteger)quarter
{
    return [get_value(self, @"Q") integerValue];
}

- (NSString *)quarterName
{
    return get_value(self, @"QQQ");
}

- (NSString *)quarterFullName
{
    return get_value(self, @"QQQQ");
}

- (NSInteger)weekOfMonth
{
    return get_value(self, @"W").integerValue;
}

- (NSInteger)weekOfYear
{
    return get_value(self, @"ww").integerValue;
}

- (NSInteger)yearForWeekOfYear
{
    return get_value(self, @"YYYY").integerValue;
}

- (BOOL)isLeapYear
{
    NSInteger year = self.year;
    if (year % 400 == 0) {
        return YES;
    }
    
    if (year % 100 == 0) {
        return NO;
    }
    
    return year % 4 == 0;
}
@end