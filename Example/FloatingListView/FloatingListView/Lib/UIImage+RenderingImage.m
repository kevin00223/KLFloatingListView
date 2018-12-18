//
//  UIImage+RenderingImage.m
//  FloatingListView
//
//  Created by 李凯 on 2018/11/29.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "UIImage+RenderingImage.h"

@implementation UIImage (RenderingImage)

+ (instancetype)imageNameWithRenderingModeAlwaysOriginal:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
