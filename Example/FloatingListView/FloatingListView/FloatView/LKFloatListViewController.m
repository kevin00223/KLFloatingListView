//
//  LKFloatListViewController.m
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "LKFloatListViewController.h"
#import "LKFloatListView.h"

@interface LKFloatListViewController () <LKFloatListViewProtocol>

@end

@implementation LKFloatListViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        //默认情况下 modal出一个覆盖整个screen的页面时, 系统为节省内存 会不再加载用来present的控制器(可通过viewDidDisappear方法验证)
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)loadView {
    LKFloatListView *floatListView = [[LKFloatListView alloc]init];
    floatListView.delegate = self;
    self.view = floatListView;
    [floatListView addTarget:self action:@selector(floatListViewDidSelect:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)floatListView:(LKFloatListView *)floatListView didSelectItemAtIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(floatListViewController:didSelectItemAtIndex:)]) {
        [self.delegate floatListViewController:self didSelectItemAtIndex:index];
    }
}

- (void)setLocationWithPoint:(CGPoint)point method:(LKFloatListViewLocateMethod)method {
    LKFloatListView *floatListView = (LKFloatListView *)self.view;
    [floatListView locateFloatListViewAtPoint:point method:method];
}

- (void)floatListViewDidSelect: (UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)setItems:(NSArray<LKFloatListItem *> *)items {
    _items = items;
    LKFloatListView *floatListView = (LKFloatListView *)self.view;
    floatListView.items = _items;
}

@end
