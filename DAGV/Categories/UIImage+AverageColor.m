//
//  UIImage+AverageColor.m
//  DAGV
//
//  Created by Gilson Gil on 3/29/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "UIImage+AverageColor.h"

@implementation UIImage (AverageColor)

- (UIColor *)averageColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char rgba[4];
    CGContextRef context = CGBitmapContextCreate(rgba, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), self.CGImage);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    if (rgba[3] > 0) {
        CGFloat alpha = ((CGFloat)rgba[3]) / 255.0f;
        CGFloat multiplier = alpha / 255.0f;
        return [UIColor colorWithRed:((CGFloat)rgba[0])*multiplier
                               green:((CGFloat)rgba[1])*multiplier
                                blue:((CGFloat)rgba[2])*multiplier
                               alpha:alpha];
    } else {
        return [UIColor colorWithRed:((CGFloat)rgba[0])/255.0f
                               green:((CGFloat)rgba[1])/255.0f
                                blue:((CGFloat)rgba[2])/255.0f
                               alpha:((CGFloat)rgba[3])/255.0f];
    }
}

@end
