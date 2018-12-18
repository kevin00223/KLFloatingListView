//
//  KLFloatListItem.h
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KLFloatListViewLocateMethod) {
    KLFloatListViewLocateMethodRightTop = 0
};

@interface KLFloatListItem : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *text;

+ (instancetype)itemWithImageName: (NSString *)imageName text: (NSString *)text;

@end
