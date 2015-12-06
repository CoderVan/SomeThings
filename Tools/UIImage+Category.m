//
//  UIImage+Category.m
//  AnyTools
//
//  Created by CosyVan on 15/12/6.
//  Copyright (c) 2015年 iFreeTeam. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)
/**
 *  根据颜色返回一张图片
 *
 *  @param color  颜色
 *  @param size   返回图片大小
 *  @param radius 圆角
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(size);
    
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    
    [image drawInRect:rect];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 *  比例压缩/扩大图片
 *
 *  @param image 传入的image
 *  @param w     宽度
 *
 *  @return 返回处理完成的图片
 */
+ (UIImage *)scaleImage:(UIImage *)image width:(CGFloat)w{
    CGFloat resizeH = w;
    CGFloat resizeW = w;
    
    UIGraphicsBeginImageContext(CGSizeMake(resizeW, resizeH));
    [image drawInRect:CGRectMake(0, 0, resizeW, resizeH)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

/**
 *  调整图片大小
 *
 *  @param image 原图片
 *  @param w     宽度
 *  @param h     高度
 *
 *  @return 返回处理完成的图片
 */
+ (UIImage *)resizeImage:(UIImage *)image width:(CGFloat)w height:(CGFloat)h{
    
    CGFloat resizeH = 0.0f;
    CGFloat resizeW = 0.0f;
    CGFloat oldH    = image.size.height;
    CGFloat oldW    = image.size.width;
    
    
    
    CGFloat centerX = 0.0f;
    CGFloat centerY = 0.0f;
    resizeH = h;
    resizeW = w;
    centerX = 0.5*oldW - 0.5*resizeW;
    centerY = 0.5*oldH - 0.5*resizeH;
    
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(centerX, centerY, resizeW, resizeH));
    CGRect smallBounds     = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context   = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage    = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    
    return smallImage;
    
}



@end
