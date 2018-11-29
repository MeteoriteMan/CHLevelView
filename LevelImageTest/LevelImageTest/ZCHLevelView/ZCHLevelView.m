//
//  ZCHLevelView.m
//  03-星级评价
//
//  Created 张晨晖 apple on 17/1/3.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import "ZCHLevelView.h"
#import <Masonry.h>

@interface ZCHLevelView()

@property (nonatomic, strong) NSArray <UIImageView *> *imageViews;

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
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        [arrayM addObject:imageView];
    }
    self.imageViews = arrayM.copy;
}

- (void)setImageViews:(NSArray<UIImageView *> *)imageViews {
    _imageViews = imageViews;
    UIView *lastView;
    for (UIImageView *imageView in imageViews) {
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView) {
                make.left.equalTo(lastView.mas_right).offset(0);
            } else {
                make.left.offset(0);
            }
            make.height.equalTo(self.mas_height);
            make.width.equalTo(imageView.mas_height);
            make.centerY.equalTo(self);
        }];
        lastView = imageView;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
    }];
}

- (void)setLevel:(CGFloat)level {
    _level = level;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BundleTest.bundle" ofType:nil];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
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

@end
