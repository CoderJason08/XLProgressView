//
//  XLProgressView.h
//  XLProgressView
//
//  Created by Jason on 15/8/1.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLProgressView : UIView
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, strong) UIColor *barBackGroundColor;
@property (nonatomic, strong) UIColor *progressLabelColor;
@property (nonatomic, assign) CGFloat barWidth;
@property (nonatomic, assign) CGFloat progress;
@end
