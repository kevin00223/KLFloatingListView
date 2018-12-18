//
//  LKFloatListView.m
//  FloatingListView
//
//  Created by 李凯 on 2018/12/3.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "LKFloatListView.h"
#import "Masonry.h"
#import "LKConst.h"

#define floatListItemWidth 120  //不写固定值
#define floatListItemHeight 40

@interface LKFloatListView ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSMutableArray *lines;

@property (nonatomic, strong) UIColor *floatViewBackgroundColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) LKFloatListViewLocateMethod method;

@end

@implementation LKFloatListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initValues];
        [self initSubviews];
    }
    return self;
}

- (void)initValues {
    self.backgroundColor = [UIColor clearColor];
    self.buttons = [NSMutableArray array];
    self.lines = [NSMutableArray array];
    self.floatViewBackgroundColor = [UIColor blackColor];
    self.textColor = [UIColor whiteColor];
    self.lineColor = [UIColor whiteColor];
}

- (void)initSubviews {
    self.containerView = [[UIView alloc]init];
    self.containerView.backgroundColor = self.floatViewBackgroundColor;
    self.containerView.layer.cornerRadius = 4.0;
    self.containerView.layer.masksToBounds = YES;
    [self addSubview:self.containerView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (self.method) {
        case LKFloatListViewLocateMethodRightTop: {
            [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self).offset(self.point.y);
                make.right.equalTo(self).offset(-self.point.x);
                make.width.offset(floatListItemWidth+20);
                make.height.offset(self.items.count * floatListItemHeight);
            }];
        }
            break;
        default:
            break;
    }
    
    int i = 0;
    for (UIButton *button in self.buttons) {
        [button setFrame:CGRectMake(10, i * floatListItemHeight, floatListItemWidth, floatListItemHeight)];
        i ++;
    }
    
    i = 0;
    for (UIView *singleLine in self.lines) {
        [singleLine setFrame:CGRectMake(10, (i+1)*floatListItemHeight, floatListItemWidth, 1/[UIScreen mainScreen].scale)];
    }
}

- (void)setItems:(NSArray<LKFloatListItem *> *)items {
    _items = items;
    
    [self resetSubviews];
    [self setNeedsLayout];
}

- (void)locateFloatListViewAtPoint:(CGPoint)point method:(LKFloatListViewLocateMethod)method {
    self.point = point;
    self.method = method;
    
    [self setNeedsLayout];
}

- (void)resetSubviews {
    int i = 0;
    for (LKFloatListItem *item in self.items) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btn setImage:[UIImage imageNamed:item.imageName] forState:UIControlStateNormal];
        [btn setTitle:item.text forState:UIControlStateNormal];
        [btn setTitleColor:self.textColor forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnDidSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:btn];
        [self.buttons addObject:btn];
        
        if (self.items.lastObject != item) {
            UIView *singleLine = [[UIView alloc]init];
            singleLine.backgroundColor = self.lineColor;
            [self.containerView addSubview:singleLine];
            [self.lines addObject:singleLine];
        }
        
        i ++;
    }
}

- (void)btnDidSelected: (UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(floatListView:didSelectItemAtIndex:)]) {
        [self.delegate floatListView:self didSelectItemAtIndex:sender.tag];
    }
}


@end
