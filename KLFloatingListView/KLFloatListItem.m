//
//  KLFloatListItem.m
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "KLFloatListItem.h"

@implementation KLFloatListItem

+ (instancetype)itemWithImageName:(NSString *)imageName text:(NSString *)text {
    KLFloatListItem *item = [[KLFloatListItem alloc]init];
    item.imageName = imageName;
    item.text = text;
    return item;
}

@end
