//
//  LKConst.h
//  FloatingListView
//
//  Created by 李凯 on 2018/11/29.
//  Copyright © 2018年 李凯. All rights reserved.
//

#ifndef LKConst_h
#define LKConst_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

/*
 颜色
 */
#define kHaxColor(f) [UIColor colorWithRed:(((f) >> 16) & 0x0000ff) / 255.0 green:(((f) >> 8) & 0x0000ff) / 255.0 blue:(((f)) & 0x0000ff) / 255.0 alpha:1.0]

#define kBlueColor kHaxColor(0x0f88eb)
#define kIsIPhoneX ((kScreenWidth == 375 && kScreenHeight == 812) ? YES : NO)
#define kStatusAndNavigationBarHeight (kIsIPhoneX ? 88 : 64)


#endif /* LKConst_h */
