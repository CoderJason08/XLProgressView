//
//  XLProgressView.h
//  XLProgressView
//
//  Created by Jason on 15/8/1.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLProgressView : UIView
// 进度条颜色
@property (nonatomic, strong) UIColor *barTintColor;
// 进度条底色
@property (nonatomic, strong) UIColor *barBackGroundColor;
// 进度字体颜色
@property (nonatomic, strong) UIColor *progressLabelColor;
// 进度条宽度
@property (nonatomic, assign) CGFloat barWidth;
// 进度
@property (nonatomic, assign) CGFloat progress;
@end
