//
//  KLFloatListViewController.m
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "KLFloatListViewController.h"
#import "KLFloatListView.h"

@interface KLFloatListViewController () <KLFloatListViewProtocol>

@end

@implementation KLFloatListViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        //默认情况下 modal出一个覆盖整个screen的页面时, 系统为节省内存 会不再加载用来present的控制器(可通过viewDidDisappear方法验证)
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)loadView {
    KLFloatListView *floatListView = [[KLFloatListView alloc]init];
    floatListView.delegate = self;
    self.view = floatListView;
    [floatListView addTarget:self action:@selector(floatListViewDidSelect:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)floatListView:(KLFloatListView *)floatListView didSelectItemAtIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(floatListViewController:didSelectItemAtIndex:)]) {
        [self.delegate floatListViewController:self didSelectItemAtIndex:index];
    }
}

- (void)setLocationWithPoint:(CGPoint)point method:(KLFloatListViewLocateMethod)method {
    KLFloatListView *floatListView = (KLFloatListView *)self.view;
    [floatListView locateFloatListViewAtPoint:point method:method];
}

- (void)floatListViewDidSelect: (UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)setItems:(NSArray<KLFloatListItem *> *)items {
    _items = items;
    KLFloatListView *floatListView = (KLFloatListView *)self.view;
    floatListView.items = _items;
}

@end
