//
//  KLFloatListView.h
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLFloatListItem.h"

@class KLFloatListView;
@protocol KLFloatListViewProtocol <NSObject>

@optional
- (void)floatListView: (KLFloatListView *)floatListView didSelectItemAtIndex: (NSInteger)index;

@end

@interface KLFloatListView : UIButton

@property (nonatomic, copy) NSArray<KLFloatListItem *> *items;
@property (nonatomic, weak) id <KLFloatListViewProtocol> delegate;

- (void)locateFloatListViewAtPoint: (CGPoint)point method: (KLFloatListViewLocateMethod)method;

@end
