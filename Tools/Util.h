//
//  Util.h
//  AnyTools
//
//  Created by CosyVan on 15/12/6.
//  Copyright (c) 2015年 iFreeTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
/**
 *  判断是否为手机号码
 *
 *  @param aPhoneNumber 手机号码
 *
 *  @return 返回BOOL类型
 */
+ (BOOL)isValidOfPhoneNumber:(NSString*)aPhoneNumber;

/**
 *  根据出生日期返回年龄
 *
 *  @param aBirthDay 出生日期
 *
 *  @return 年龄
 */
+ (NSInteger)calAgeWithBirthDay:(NSDate *)aBirthDay;

/**
 *  MD5加密
 *
 *  @param string 传人MD5的字符串
 *
 *  @return 返回
 */
+ (NSString*)md5WithString:(NSString*)string;
@end
