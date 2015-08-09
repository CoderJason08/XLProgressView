//
//  ViewController.m
//  XLProgressView
//
//  Created by Jason on 15/8/1.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "XLProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XLProgressView *progressView;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start {
    self.progressView.progress = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
}

- (void)changeProgress {
    self.progressView.progress += 0.01;
    if (self.progressView.progress >= 1) {
        [self.timer invalidate];
    }
}

@end
