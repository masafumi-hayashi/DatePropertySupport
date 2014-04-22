//
//  DatePropertySupportTests.m
//  DatePropertySupportTests
//
//  Created by masafumi hayashi on 4/21/14.
//  Copyright (c) 2014 masafumi hayashi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DatePropertySupport.h"
static NSDate * to_date(NSString *dateString){
    NSDateFormatter * fmt = [NSDateFormatter new];
    [fmt setLocale:[NSLocale localeWithLocaleIdentifier:@"ja_JP"]];
    [fmt setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [fmt dateFromString:dateString];
}

@interface DatePropertySupportTests : XCTestCase {
    NSDate * _date;
}

@end

@implementation DatePropertySupportTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _date = to_date(@"2014-04-21 01:23:45");
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEra
{
    XCTAssertEqual(_date.era, 1);
    XCTAssertEqualObjects(_date.eraName, @"AD");
}

- (void)testYear
{
    XCTAssertEqual(_date.year, 2014);
}

- (void)testMonth
{
    XCTAssertEqual(_date.month, 4);
    XCTAssertEqualObjects(_date.monthName, @"Apr");
    XCTAssertEqualObjects(_date.monthFullName, @"April");
    XCTAssertEqualObjects(_date.monthShortName, @"A");
}

- (void)testDay
{
    XCTAssertEqual(_date.day, 21);
    XCTAssertEqual(_date.dayOfYear, 111);
}

- (void)testHour
{
    XCTAssertEqual(_date.hour, 1);
    XCTAssertEqual(_date.hour12, 1);
    XCTAssertEqual(to_date(@"2014-04-21 13:00:00").hour12, 1);
}

- (void)testMinute
{
    XCTAssertEqual(_date.minute, 23);
}

- (void)testSecond
{
    XCTAssertEqual(_date.second, 45);
}

- (void)testPeriod
{
    XCTAssertEqualObjects(_date.period, @"AM");
}

- (void)testWeekday
{
    XCTAssertEqual(_date.weekdayOrdinal, 3);
    XCTAssertEqual(_date.weekday, 2);
    XCTAssertEqualObjects(_date.weekdayName, @"Mon");
    XCTAssertEqualObjects(_date.weekdayFullName, @"Monday");
    XCTAssertEqualObjects(_date.weekdayNarrowName, @"M");
    XCTAssertEqualObjects(_date.weekdayShortName, @"Mo");
}

- (void)testQuarter
{
    XCTAssertEqual(_date.quarter, 2);
    XCTAssertEqualObjects(_date.quarterName, @"Q2");
    XCTAssertEqualObjects(_date.quarterFullName, @"2nd quarter");
}

- (void)testWeekOfMonth
{
    XCTAssertEqual(_date.weekOfMonth, 4);
}

- (void)testWeekOfYear
{
    XCTAssertEqual(_date.weekOfYear, 17);
}

- (void)testYearForWeekOfYear
{
    XCTAssertEqual(_date.yearForWeekOfYear, 2014);
    XCTAssertEqual(to_date(@"2013-12-31 00:00:00").yearForWeekOfYear, 2014);
}

- (void)testIsLeapYear
{
    XCTAssertFalse(_date.isLeapYear);
    XCTAssertTrue(to_date(@"2016-01-01 00:00:00").isLeapYear);
}
@end
