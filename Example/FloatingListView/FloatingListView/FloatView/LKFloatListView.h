//
//  LKFloatListView.h
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKFloatListItem.h"

@class LKFloatListView;
@protocol LKFloatListViewProtocol <NSObject>

@optional
- (void)floatListView: (LKFloatListView *)floatListView didSelectItemAtIndex: (NSInteger)index;

@end

@interface LKFloatListView : UIButton

@property (nonatomic, copy) NSArray<LKFloatListItem *> *items;
@property (nonatomic, weak) id <LKFloatListViewProtocol> delegate;

- (void)locateFloatListViewAtPoint: (CGPoint)point method: (LKFloatListViewLocateMethod)method;

@end
