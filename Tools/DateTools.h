//
//  DateTools.h
//  AnyTools
//
//  Created by CosyVan on 15/12/6.
//  Copyright (c) 2015年 iFreeTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

@interface DateTools : NSObject
/**
 *  初始化UIDatePicker
 *
 *  @return UIDatePicker
 */
+ (UIDatePicker *)datePicker;

/**
 *  格式化时间
 *  xx年xx月xx日
 *
 *  @param date 时间啊
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedValidityDate:(NSDate *)date;

/**
 *  格式化时间
 *
 *  @param date      时间
 *  @param aSeparate 年月日的分隔符
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedDate:(NSDate *)date bySeparate:(NSString *)aSeparate;

/**
 *  格式化时间  yyyy-MM-dd-HH:mm:ss
 *
 *  @param date        时间
 *  @param aDateFormat yyyy-MM-dd-HH:mm:ss
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedDate:(NSDate *)date byDateFormat:(NSString *)aDateFormat;

/**
 *  格式化时间字符串  yyyy-MM-dd-HH:mm:ss
 *
 *  @param string      时间字符串
 *  @param aDateFormat yyyy-MM-dd-HH:mm:ss
 *
 *  @return 格式化之后的时间
 */
+ (NSDate *)formatedString:(NSString *)string byDateFormat:(NSString *)aDateFormat;

/**
 *  格式化时间
 *
 *  @param aTime     毫秒时间
 *  @param aSeparate 年月日的分隔符
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedTimeInMillisecond:(long long)aTime bySeparate:(NSString *)aSeparate;


// 时长 %ld:%02ld:%02ld
+ (NSString *)timeDescriptionOfTimeInterval:(NSTimeInterval)timeInterval;

// 是否是同一天
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2;

// 当前时间
+ (NSTimeInterval)curTime;

// 当前时间毫秒级
+ (long long)curTimeMillisecond;

// 当前小时
+ (NSInteger)curHour;
@end
