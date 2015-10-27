//
//  SelfCenterViewController.m
//  云花园
//
//  Created by 白彬涵 on 15/10/15.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "SelfCenterViewController.h"
#import "CenterTableViewCell_Model.h"
#import "CenterTableVIew_Delegate.h"
@interface SelfCenterViewController ()
@property (nonatomic,assign) CGFloat SCREEN_WIDTH;
@property (nonatomic,assign) CGFloat SCREEN_HEIGHT;
@property (nonatomic,strong) UITableView *rootTableView;
@property (nonatomic,strong) CenterTableVIew_Delegate *rootTableViewDelegate;
@property (nonatomic,strong) UIButton *logOutButton;
@end

@implementation SelfCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    _SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    [self initSubView];
    // Do any additional setup after loading the view.
}
- (void)initSubView{
    [self rootTableView];
    [self logOutButton];
}
- (UITableView *)rootTableView{
    if (!_rootTableView) {
        _rootTableView = [[UITableView alloc]init];
        _rootTableView.frame = CGRectMake(0, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT);
        _rootTableViewDelegate = [[CenterTableVIew_Delegate alloc]init];
        _rootTableView.dataSource = _rootTableViewDelegate;
        _rootTableView.delegate = _rootTableViewDelegate;
        _rootTableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        _rootTableView.tableFooterView = [[UIView alloc]init];
        [self initTableViewData];
        [self.view addSubview:_rootTableView];
    }
    return _rootTableView;
}

- (void)initTableViewData{
    CenterTableViewCell_Model *model1 = [[CenterTableViewCell_Model alloc]init];
    model1.modelType = headLine;
    model1.titleString = @"BBH";
    model1.describString = @"我的介绍:awefafwefdggwgefadfhaiwugheaihf";
    model1.imageString = @"头像";
    NSMutableArray *group1 = [[NSMutableArray alloc]initWithObjects:model1, nil];
    
    CenterTableViewCell_Model *model2 = [[CenterTableViewCell_Model alloc]init];
    model2.modelType = others;
    model2.titleString = @"我的收货地址";
    CenterTableViewCell_Model *model3 = [[CenterTableViewCell_Model alloc]init];
    model3.modelType = others;
    model3.titleString = @"我买到的";
    CenterTableViewCell_Model *model4 = [[CenterTableViewCell_Model alloc]init];
    model4.modelType = others;
    model4.titleString = @"我卖出的";
    NSMutableArray *group2 = [[NSMutableArray alloc]initWithObjects:model2, model3, model4,nil];
    
    CenterTableViewCell_Model *model5 = [[CenterTableViewCell_Model alloc]init];
    model5.modelType = others;
    model5.titleString = @"我的收藏";
    CenterTableViewCell_Model *model6 = [[CenterTableViewCell_Model alloc]init];
    model6.modelType = others;
    model6.titleString = @"我的积分";
    CenterTableViewCell_Model *model7 = [[CenterTableViewCell_Model alloc]init];
    model7.modelType = others;
    model7.titleString = @"设置";
    NSMutableArray *group3 = [[NSMutableArray alloc]initWithObjects:model5, model6, model7,nil];
    NSMutableArray *dataArray = [[NSMutableArray alloc]initWithObjects:group1, group2, group3, nil];
    _rootTableViewDelegate.dataArray = dataArray;
}
- (UIButton *)logOutButton{
    if (!_logOutButton) {
        _logOutButton = [[UIButton alloc]init];
        _logOutButton.backgroundColor = [UIColor redColor];
        _logOutButton.frame = CGRectMake(_SCREEN_WIDTH*0.3, _SCREEN_HEIGHT*0.7, _SCREEN_WIDTH*0.4, 40);
        _logOutButton.layer.cornerRadius = 5;
        [_logOutButton setTitle:@"退出登陆" forState:UIControlStateNormal];
        [_logOutButton addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchUpInside];
        [self.rootTableView addSubview:_logOutButton];
    }
    return _logOutButton;
}
- (void)logOut{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
