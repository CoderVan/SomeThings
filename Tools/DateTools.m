//
//  DateTools.m
//  AnyTools
//
//  Created by CosyVan on 15/12/6.
//  Copyright (c) 2015年 iFreeTeam. All rights reserved.
//

#import "DateTools.h"

@implementation DateTools
/**
 *  初始化UIDatePicker
 *
 *  @return UIDatePicker
 */
+ (UIDatePicker *)datePicker
{
    UIDatePicker *dataPicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    
    // 日期模式
    [dataPicker setDatePickerMode:UIDatePickerModeDate];
    
    // 中文显示
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dataPicker setLocale:locale];
    
    //定义最小最大日期
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents* compMin = [calendar components:unitFlags fromDate:[NSDate date]];
    [compMin setYear:compMin.year-60];
    NSDate *minDate =[calendar dateFromComponents:compMin];
    [dataPicker setMinimumDate:minDate];
    
    NSDateComponents* compMax = [calendar components:unitFlags fromDate:[NSDate date]];
    [compMax setYear:compMax.year-18];
    NSDate *maxDate =[calendar dateFromComponents:compMax];
    [dataPicker setMaximumDate:maxDate];
    
    // 默认日期
    [compMax setMonth:1];
    [compMax setDay:1];
    NSDate *defaultDate = [calendar dateFromComponents:compMax];
    [dataPicker setDate:defaultDate];
    
    return dataPicker;
}

/**
 *  格式化时间
 *  xx年xx月xx日
 *
 *  @param date 时间啊
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedChatDate:(NSDate *)date
{
    NSString *dateString = nil;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents* curComp = [calendar components:unitFlags fromDate:[NSDate date]];
    NSDateComponents* comp = [calendar components:unitFlags|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date];
    
    if (curComp.year == comp.year)
    {
        if (curComp.month == comp.month && curComp.day - comp.day < 3)
        {
            if (curComp.day == comp.day)
            {
                dateString = [NSString stringWithFormat:@"%02ld:%02ld",(long)comp.hour,(long)comp.minute];
            }
            else if (curComp.day - comp.day == 1)
            {
                dateString = [NSString stringWithFormat:@"昨天 %@",[self _timeOfhour:comp.hour]];
            }
            else if (curComp.day - comp.day == 2)
            {
                dateString = [NSString stringWithFormat:@"前天 %@",[self _timeOfhour:comp.hour]];
            }
        }
        else
        {
            dateString = [NSString stringWithFormat:@"%ld月%ld日",(long) comp.month, (long)comp.day];
        }
    }
    else
    {
        dateString = [NSString stringWithFormat:@"%ld年%ld月%ld日", (long)comp.year,(long) comp.month,(long) comp.day];
    }
    
    return dateString;
}

/**
 *  格式化时间
 *  xx年xx月xx日
 *
 *  @param date 时间啊
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedValidityDate:(NSDate *)date
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents* comp = [calendar components:unitFlags fromDate:date];
    return [NSString stringWithFormat:@"%ld年%ld月%ld日",(long)comp.year, (long)comp.month,(long) comp.day];
}



/**
 *  格式化时间  yyyy-MM-dd-HH:mm:ss
 *
 *  @param date        时间
 *  @param aDateFormat yyyy-MM-dd-HH:mm:ss
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedDate:(NSDate *)date byDateFormat:(NSString *)aDateFormat
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:aDateFormat];
    formater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_GMT"];
    return [formater stringFromDate:date];
}

/**
 *  格式化时间字符串  yyyy-MM-dd-HH:mm:ss
 *
 *  @param string      时间字符串
 *  @param aDateFormat yyyy-MM-dd-HH:mm:ss
 *
 *  @return 格式化之后的时间
 */
+ (NSDate *)formatedString:(NSString *)string byDateFormat:(NSString *)aDateFormat
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:aDateFormat];
    formater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    return [formater dateFromString:string];
}


/**
 *  格式化时间
 *
 *  @param date      时间
 *  @param aSeparate 年月日的分隔符
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedDate:(NSDate *)date bySeparate:(NSString *)aSeparate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp = [calendar components:unitFlags fromDate:date];
    return [NSString stringWithFormat:@"%ld%@%02ld%@%02ld",(long)comp.year,aSeparate, (long)comp.month,aSeparate,(long) comp.day];
}

/**
 *  格式化时间
 *
 *  @param aTime     毫秒时间
 *  @param aSeparate 年月日的分隔符
 *
 *  @return 格式化之后的时间字符串
 */
+ (NSString *)formatedTimeInMillisecond:(long long)aTime bySeparate:(NSString *)aSeparate
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:aTime/1000];
    return [self formatedDate:date bySeparate:aSeparate];
}

+ (NSString *)_timeOfhour:(NSInteger)aHour
{
    if (aHour < 7)
    {
        return @"凌晨";
    }
    else if (aHour < 12)
    {
        return @"上午";
    }
    else if(aHour < 19)
    {
        return @"下午";
    }else{
        return @"晚上";
    }
}


+ (NSString *)timeDescriptionOfTimeInterval:(NSTimeInterval)timeInterval
{
    NSDateComponents *components = [self.class componetsWithTimeInterval:timeInterval];
    NSInteger roundedSeconds = lround(timeInterval - (components.hour * 60 * 60) - (components.minute * 60));
    
    if (components.hour > 0)
        return [NSString stringWithFormat:@"%ld:%02ld:%02ld", (long)components.hour, (long)components.minute, (long)roundedSeconds];
    
    else
        return [NSString stringWithFormat:@"%ld:%02ld", (long)components.minute, (long)roundedSeconds];
}

+ (NSDateComponents *)componetsWithTimeInterval:(NSTimeInterval)timeInterval
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:timeInterval sinceDate:date1];
    
    unsigned int unitFlags =
    NSSecondCalendarUnit | NSMinuteCalendarUnit | NSHourCalendarUnit |
    NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    
    return [calendar components:unitFlags
                       fromDate:date1
                         toDate:date2
                        options:0];
}

+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

+ (NSTimeInterval)curTime
{
    return [[NSDate date] timeIntervalSince1970];
}

+ (long long)curTimeMillisecond
{
    return [self curTime] *1000;
}

+ (NSInteger)curHour
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comp = [calendar components:NSHourCalendarUnit fromDate:[NSDate date]];
    NSInteger hour = comp.hour;
    return hour;
}



@end
