//
//  XLProgressView.m
//  XLProgressView
//
//  Created by Jason on 15/8/1.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLProgressView.h"

@interface XLProgressView ()
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, assign) CGFloat fonSize;
@end

@implementation XLProgressView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    UIBezierPath *path1 = [UIBezierPath bezierPath];
    CGSize size = self.frame.size;
    CGFloat radius = MIN(size.width, size.height) / 2 - self.barWidth;
    CGPoint center = CGPointMake(size.width/2, size.height/2);
    [path1 addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    path1.lineWidth = self.barWidth;
    path1.lineCapStyle = kCGLineCapRound;
    [self.barBackGroundColor set];
    [path1 stroke];

    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = startAngle + self.progress * M_PI * 2;
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    path.lineWidth = self.barWidth - 0.5;
    path.lineCapStyle = kCGLineCapRound;
    [self.barTintColor set];
    [path stroke];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setAttribute];
        [self addSubview:self.progressLabel];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setAttribute];
        [self addSubview:self.progressLabel];
    }
    return self;
}

- (void)setAttribute {
    self.backgroundColor = [UIColor clearColor];
    self.barWidth = 10.0f;
    self.barTintColor = [UIColor whiteColor];
    self.barBackGroundColor = [UIColor lightGrayColor];
    self.progressLabelColor = self.barBackGroundColor;
    self.progress = 0.0f;
}

- (void)setProgress:(CGFloat)progress {
    dispatch_async(dispatch_get_main_queue(), ^{
        _progress = progress;
        _progressLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress * 100];
        [self setNeedsDisplay];
    });
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] init];
        _progressLabel.textColor = self.progressLabelColor;
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress * 100];
    }
    return _progressLabel;
}

- (void)layoutSubviews {
    self.progressLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.progressLabel.font = [UIFont fontWithName:@"Menlo-Bold" size:MIN(self.frame.size.width, self.frame.size.height) / 5];
}




@end
