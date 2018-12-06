//
//  ViewController.m
//  LevelImageTest
//
//  Created by 张晨晖 on 2018/1/11.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "CHLevelView.h"

@interface ViewController ()

@property (nonatomic ,strong) CHLevelView *viewLevelStart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.viewLevelStart = [[CHLevelView alloc] init];
    self.viewLevelStart.allowGestureRecognizer = YES;
    self.viewLevelStart.starNumber = 4;
    [self.view addSubview:self.viewLevelStart];
    [self.viewLevelStart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(100);
        make.centerX.equalTo(self.view);
        make.height.offset(70);
    }];
    [_viewLevelStart setLevel:2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
