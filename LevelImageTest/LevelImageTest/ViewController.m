//
//  ViewController.m
//  LevelImageTest
//
//  Created by 张晨晖 on 2018/1/11.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import "ZCHLevelView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ZCHLevelView *viewLevelStart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_viewLevelStart setLevel:3.5];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
