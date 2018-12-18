//
//  LKMainViewController.m
//  FloatingListView
//
//  Created by 李凯 on 2018/11/29.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "LKMainViewController.h"
#import "UIImage+RenderingImage.h"
#import "LKFloatListViewController.h"
#import "LKFloatListItem.h"
#import "LKConst.h"

@interface LKMainViewController () <LKFloatListViewControllerProtocol>

@end

@implementation LKMainViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavigationBar];
}

#pragma mark - init
- (void)initNavigationBar {
    self.title = @"首页";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNameWithRenderingModeAlwaysOriginal:@"btn_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemOnClick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - private function
- (void)rightItemOnClick: (UIBarButtonItem *)sender {
    LKFloatListItem *firstItem = [LKFloatListItem itemWithImageName:@"ic_add_friend" text:@"添加朋友"];
    LKFloatListItem *secondeItem = [LKFloatListItem itemWithImageName:@"ic_add_group" text:@"添加群组"];
    
    LKFloatListViewController *floatListVC = [[LKFloatListViewController alloc]init];
    floatListVC.delegate = self;
    [floatListVC setLocationWithPoint:CGPointMake(10, kStatusAndNavigationBarHeight+6) method:LKFloatListViewLocateMethodRightTop];
    floatListVC.items = @[firstItem, secondeItem];
    [self presentViewController:floatListVC animated:NO completion:nil];
}

#pragma mark - delegate
- (void)floatListViewController:(LKFloatListViewController *)floatListViewController didSelectItemAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"跳转到添加朋友");
            break;
        case 1:
            NSLog(@"跳转到添加群组");
        default:
            break;
    }
    [floatListViewController dismissViewControllerAnimated:NO completion:nil];
}

@end
