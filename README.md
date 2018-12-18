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
#import "KLFloatListItem.h"
#import "KLFloatListViewController.h"
```
```
- (void)initNavigationBar {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked:)];
}

- (void)rightBarButtonItemClicked: (UIBarButtonItem *)sender {
    KLFloatListItem *itemA = [KLFloatListItem itemWithImageName:@"ic_add_friend" text:@"添加好友"];
    KLFloatListItem *itemB = [KLFloatListItem itemWithImageName:@"ic_add_group" text:@"添加群组"];
    
    KLFloatListViewController *vc = [[KLFloatListViewController alloc]init];
    vc.items = @[itemA, itemB];
    [vc setLocationWithPoint:CGPointMake(10, 70) method:KLFloatListViewLocateMethodRightTop];
    vc.delegate = self;
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)floatListViewController:(KLFloatListViewController *)floatListViewController didSelectItemAtIndex:(NSInteger)index {
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

## Requirements
iOS 9.0+

## Contact
Find me via id: badassme on WeChat.
Pull requests are always welcome.

## License
KLFloatingListView is pushblied under MIT license. See the LICENSE file for more.
