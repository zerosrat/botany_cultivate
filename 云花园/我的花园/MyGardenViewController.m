//
//  MyGardenViewController.m
//  云花园
//
//  Created by 白彬涵 on 15/10/15.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "MyGardenViewController.h"

@interface MyGardenViewController ()
@property (nonatomic,assign) CGFloat SCREEN_WIDTH;//屏幕宽度
@property (nonatomic,assign) CGFloat SCREEN_HEIGHT;//屏幕高度
@end

@implementation MyGardenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSubView{
    _SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    _SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
