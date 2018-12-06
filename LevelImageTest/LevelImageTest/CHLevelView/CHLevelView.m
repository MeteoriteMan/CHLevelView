//
//  CHLevelViewk.m
//  03-星级评价
//
//  Created 张晨晖 apple on 17/1/3.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import "CHLevelView.h"
#import <Masonry.h>

@interface CHLevelView()

@property (nonatomic, strong) NSArray <UIImageView *> *imageViews;

@property (nonatomic ,strong) UIPanGestureRecognizer *panGestureRecognizer;

@property (nonatomic ,strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation CHLevelView {
    NSUInteger _starNumber;
}

- (void)setStarNumber:(NSUInteger)starNumber {
    _starNumber = starNumber;
    [self setupUI];
}

- (NSUInteger)starNumber {
    if (_starNumber == 0) {
        _starNumber = 5;
    }
    return _starNumber;
}

- (void)setAllowGestureRecognizer:(BOOL)allowGestureRecognizer {
    _allowGestureRecognizer = allowGestureRecognizer;
    [self removeGestureRecognizer:self.panGestureRecognizer];
    self.panGestureRecognizer = nil;
    [self removeGestureRecognizer:self.tapGestureRecognizer];
    self.tapGestureRecognizer = nil;
    if (allowGestureRecognizer) {
        self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
        [self addGestureRecognizer:self.panGestureRecognizer];
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setConfig];
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setConfig];
        [self setupUI];
    }
    return self;
}

- (void)setConfig {
    /// 初始化默认值
    self.allowGestureRecognizer = NO;
}

- (void)setupUI {
    
    for (UIView *subView in self.imageViews) {
        [subView removeFromSuperview];
    }
    self.imageViews = nil;
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < self.starNumber; i++) {
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
    if (level > self.imageViews.count) {
        return;
    }
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

// MARK: Action:
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan {
    [self caculateLevelWithGestureRecognizer:pan];
}

- (void)tapGestureRecognizer:(UITapGestureRecognizer *)tap {
    [self caculateLevelWithGestureRecognizer:tap];
}

- (void)caculateLevelWithGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (self.imageViews.count == 0) {
        return;
    }
    CGFloat level = 0.0;
    CGPoint point = [gestureRecognizer locationInView:self];
    if (point.x <= 0.0) {//左边.0
        level = 0.0;
    } else if (point.x > self.bounds.size.width) {
        level = self.imageViews.count;
    } else {
        /// 计算当前是level
        CGFloat viewWidth = self.bounds.size.width / self.imageViews.count;
        NSUInteger roundNumber = point.x / viewWidth;
        CGFloat number = (point.x - roundNumber * viewWidth) / (viewWidth / 2);
        if (number < 1.0) {
            level = roundNumber + .5;
        } else {
            level = roundNumber + 1.0;
        }
    }
    self.level = level;
    if (self.gestureRecognizerBlock) {
        self.gestureRecognizerBlock(level);
    }
}

@end
