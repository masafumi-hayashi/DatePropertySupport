//
//  DatePropertySupport.h
//  DatePropertySupport
//
//  Created by masafumi hayashi on 4/21/14.
//  Copyright (c) 2014 masafumi hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PropertySupport)
@property (nonatomic, readonly) NSInteger era;
@property (nonatomic, readonly) NSString * eraName;
@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSString * monthName;
@property (nonatomic, readonly) NSString * monthFullName;
@property (nonatomic, readonly) NSString * monthShortName;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger dayOfYear;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger hour12;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;
@property (nonatomic, readonly) NSInteger weekday;
@property (nonatomic, readonly) NSString * weekdayName;
@property (nonatomic, readonly) NSString * weekdayFullName;
@property (nonatomic, readonly) NSString * weekdayNarrowName;
@property (nonatomic, readonly) NSString * weekdayShortName;
@property (nonatomic, readonly) NSInteger weekdayOrdinal;
@property (nonatomic, readonly) NSString * period;
@property (nonatomic, readonly) NSInteger quarter;
@property (nonatomic, readonly) NSString * quarterName;
@property (nonatomic, readonly) NSString * quarterFullName;
@property (nonatomic, readonly) NSInteger weekOfMonth;
@property (nonatomic, readonly) NSInteger weekOfYear;
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;
@property (nonatomic, readonly) BOOL isLeapYear;
@end
