//
//  UIImage+Category.h
//  AnyTools
//
//  Created by CosyVan on 15/12/6.
//  Copyright (c) 2015年 iFreeTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 *  根据颜色返回一张图片
 *
 *  @param color  颜色
 *  @param size   返回图片大小
 *  @param radius 圆角
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;

/**
 *  比例压缩/扩大图片
 *
 *  @param image 传入的image
 *  @param w     宽度
 *
 *  @return 返回处理完成的图片
 */
+(UIImage *)scaleImage:(UIImage *)image width:(CGFloat)w;

/**
 *  调整图片大小
 *
 *  @param image 原图片
 *  @param w     宽度
 *  @param h     高度
 *
 *  @return 返回处理完成的图片
 */
+(UIImage *)resizeImage:(UIImage *)image width:(CGFloat)w height:(CGFloat)h;
@end
