//
//  UIImage+withColor.m
//  NapTheL
//
//  Created by David Mazza on 4/23/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "UIImage+withColor.h"

@implementation UIImage (withColor)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
