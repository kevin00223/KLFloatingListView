//
//  KLFloatListViewController.h
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLFloatListItem.h"

@class KLFloatListViewController;
@protocol KLFloatListViewControllerProtocol <NSObject>

@optional
- (void)floatListViewController: (KLFloatListViewController *)floatListViewController didSelectItemAtIndex: (NSInteger)index;

@end

@interface KLFloatListViewController : UIViewController

@property (nonatomic, copy) NSArray<KLFloatListItem *> *items;
@property (nonatomic, weak) id <KLFloatListViewControllerProtocol> delegate;

- (void)setLocationWithPoint: (CGPoint)point method: (KLFloatListViewLocateMethod)method;

@end
