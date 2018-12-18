# KLFloatingListView
A floatingListView, just like the one in WeChat and QQ, in Objective-C

## About
It is very common to present a floating list view, at the right top of certain pages most time, in commercial apps. KLFloatingListView helps you create such a view in no time, which can save you much trouble.

## Installation
### Cocoapods
To your podfile add:
`pod KLFloatingListView`

## Example Usage
```
#import "LKFloatListItem.h"
#import "LKFloatListViewController.h"
```
```
- (void)initNavigationBar {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked:)];
}

- (void)rightBarButtonItemClicked: (UIBarButtonItem *)sender {
    LKFloatListItem *itemA = [LKFloatListItem itemWithImageName:@"ic_add_friend" text:@"添加好友"];
    LKFloatListItem *itemB = [LKFloatListItem itemWithImageName:@"ic_add_group" text:@"添加群组"];
    
    LKFloatListViewController *vc = [[LKFloatListViewController alloc]init];
    vc.items = @[itemA, itemB];
    [vc setLocationWithPoint:CGPointMake(10, 70) method:LKFloatListViewLocateMethodRightTop];
    vc.delegate = self;
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)floatListViewController:(LKFloatListViewController *)floatListViewController didSelectItemAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"跳转到添加好友页面");
            break;
        case 1:
            NSLog(@"跳转到添加群组页面");
            break;
        default:
            break;
    }
}
```


