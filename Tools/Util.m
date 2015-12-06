//
//  Util.m
//  AnyTools
//
//  Created by CosyVan on 15/12/6.
//  Copyright (c) 2015年 iFreeTeam. All rights reserved.
//

#import "Util.h"
#import <CommonCrypto/CommonDigest.h>
#include <sys/xattr.h>

@implementation Util
/**
 *  判断是否为手机号码
 *
 *  @param aPhoneNumber 手机号码
 *
 *  @return 返回BOOL类型
 */
+ (BOOL)isValidOfPhoneNumber:(NSString*)aPhoneNumber
{
    if (aPhoneNumber.length <= 0)
    {
        return NO;
    }
    
    NSString *phoneRegex = @"\\b(1)[358][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:aPhoneNumber];
}

/**
 *  根据出生日期返回年龄
 *
 *  @param aBirthDay 出生日期
 *
 *  @return 年龄
 */
+ (NSInteger)calAgeWithBirthDay:(NSDate *)aBirthDay
{
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:aBirthDay];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return iAge;
}

/**
 *  MD5
 *
 *  @param string 传人MD5的字符串
 *
 *  @return 返回
 */
+ (NSString*)md5WithString:(NSString*)string
{
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str,(CC_LONG) strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}
@end
