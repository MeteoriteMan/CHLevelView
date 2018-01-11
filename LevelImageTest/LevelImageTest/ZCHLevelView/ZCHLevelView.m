//
//  ZCHLevelView.m
//  03-星级评价
//
//  Created 张晨晖 apple on 17/1/3.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import "ZCHLevelView.h"

@interface ZCHLevelView()

@property (nonatomic, strong) NSMutableArray<UIImageView *> *imageViews;

@end

@implementation ZCHLevelView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor redColor];
    self.imageViews = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        [self.imageViews addObject:imageView];
    }
}

- (void)setLevel:(CGFloat)level {
    _level = level;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BundleTest.bundle" ofType:nil];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    //image Test
//    NSString *imagePath = [bundle pathForResource:@"Images/full_star.png" ofType:nil];
    int temp = level;
    for (int i = 0; i < temp; i++) {
        self.imageViews[i].image = [UIImage imageNamed:[bundle pathForResource:@"Images/full_star.png" ofType:nil]];
    }
    if ((int)(level / 0.5) % 2) { // 奇数 带.5
        self.imageViews[temp].image = [UIImage imageNamed:[bundle pathForResource:@"Images/half_star.png" ofType:nil]];
        temp++;
    }
    for (int i = temp; i < self.imageViews.count; i++) {
        self.imageViews[i].image = [UIImage imageNamed:[bundle pathForResource:@"Images/empty_star.png" ofType:nil]];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews]; //!!!! 一定要写super
    CGFloat W = 0.0;
    CGFloat H = 0.0;
    for (int i = 0; i < self.imageViews.count; i++) {
        // 获取imageView
        UIImageView *imageView = self.imageViews[i];
        imageView.backgroundColor = [UIColor redColor];
        CGFloat w = self.bounds.size.height;
        CGFloat h = w;
        CGFloat x = i * w; // 第0个图片  就是x 就是  0 * w
        CGFloat y = 0;
        imageView.frame = CGRectMake(x, y, w, h);
        W = w;
        H = h;
    }
    self.bounds = CGRectMake(0, 0, W, H);
}


@end
