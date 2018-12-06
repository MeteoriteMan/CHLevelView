//
//  CHLevelView.h
//  03-星级评价
//
//  Created by 张晨晖 on 17/1/3.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CHLevelViewGestureRecognizerBlock)(CGFloat level);

@interface CHLevelView : UIView

/// ✨数目,默认为5
@property (nonatomic ,assign) NSUInteger starNumber;

/// 当前亮✨数目(.5以半颗星处理)
@property (nonatomic, assign) CGFloat level;

/// 是否支持拖拽支持拖拽设置星星手势.默认为NO
@property (nonatomic, assign) BOOL allowGestureRecognizer;

/// 拖动星星
@property (nonatomic ,copy) CHLevelViewGestureRecognizerBlock gestureRecognizerBlock;

@end
