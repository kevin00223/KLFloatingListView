//
//  LKFloatListItem.m
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "LKFloatListItem.h"

@implementation LKFloatListItem

+ (instancetype)itemWithImageName:(NSString *)imageName text:(NSString *)text {
    LKFloatListItem *item = [[LKFloatListItem alloc]init];
    item.imageName = imageName;
    item.text = text;
    return item;
}

@end
