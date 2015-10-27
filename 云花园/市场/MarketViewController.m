//
//  MarketViewController.m
//  云花园
//
//  Created by 白彬涵 on 15/10/15.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "MarketViewController.h"
#import "Market_VirtualTableView_Delegate.h"
@interface MarketViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong) UIScrollView *rootScrollView;
@property (nonatomic,strong) UISegmentedControl *rootSegmentedControl;
@property (nonatomic,assign) CGFloat SCREEN_WIDTH;
@property (nonatomic,assign) CGFloat SCREEN_HEIGHT;
@property (nonatomic,strong) Market_VirtualTableView_Delegate *virtualTableViewDelegate;
@property (nonatomic,strong) UITableView *virtualShopChooseTableView;
@property (nonatomic,strong) UISearchBar *virtualSearchBar;
@property (nonatomic,strong) UITableView *realShopChooseTableView;
@property (nonatomic,strong) UISearchBar *realSearchBar;
@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubView];
    // Do any additional setup after loading the view.
}
- (void)initSubView{
    _SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    _SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    [self rootSegmentedControl];
    [self rootScrollView];
    [self virtualShopChooseTableView];
    [self virtualSearchBar];
    [self realShopChooseTableView];
    [self realSearchBar];
}
- (UISegmentedControl *)rootSegmentedControl{
    if (!_rootSegmentedControl) {
        NSArray *segArray = [NSArray arrayWithObjects:@"虚拟商城", @"真实植物", nil];
        _rootSegmentedControl = [[UISegmentedControl alloc] initWithItems:segArray];
        _rootSegmentedControl.selectedSegmentIndex = 0;
        [_rootSegmentedControl setWidth:100 forSegmentAtIndex:0];
        [_rootSegmentedControl setWidth:100 forSegmentAtIndex:1];
        [_rootSegmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
        _rootSegmentedControl.tintColor = [UIColor whiteColor];
        self.navigationItem.titleView = _rootSegmentedControl;
    }
    return _rootSegmentedControl;
}
- (UITableView *)virtualShopChooseTableView{
    if (!_virtualShopChooseTableView) {
        _virtualShopChooseTableView = [[UITableView alloc]init];
        _virtualShopChooseTableView.backgroundColor = [UIColor whiteColor];
        _virtualShopChooseTableView.frame = CGRectMake(0, 40,100, _SCREEN_HEIGHT-154);
        _virtualShopChooseTableView.tableFooterView = [[UIView alloc]init];
        _virtualTableViewDelegate = [[Market_VirtualTableView_Delegate alloc]init];
        _virtualShopChooseTableView.dataSource = _virtualTableViewDelegate;
        _virtualShopChooseTableView.delegate = _virtualTableViewDelegate;
        [self initTestData];
        [_rootScrollView addSubview:_virtualShopChooseTableView];
    }
    return _virtualShopChooseTableView;
}
- (UISearchBar *)virtualSearchBar{
    if (!_virtualSearchBar) {
        _virtualSearchBar = [[UISearchBar alloc]init];
        _virtualSearchBar.frame = CGRectMake(0, 0, _SCREEN_WIDTH, 40);
        [_rootScrollView addSubview:_virtualSearchBar];
    }
    return _virtualSearchBar;
}

- (UITableView *)realShopChooseTableView{
    if (!_realShopChooseTableView) {
        _realShopChooseTableView = [[UITableView alloc]init];
        _realShopChooseTableView.backgroundColor = [UIColor whiteColor];
        _realShopChooseTableView.frame = CGRectMake(_SCREEN_WIDTH, 40, 100, _SCREEN_HEIGHT-130);
        [_rootScrollView addSubview:_realShopChooseTableView];
    }
    return _realShopChooseTableView;
}
- (UISearchBar *)realSearchBar{
    if (!_realSearchBar) {
        _realSearchBar = [[UISearchBar alloc]init];
        _realSearchBar.frame = CGRectMake(_SCREEN_WIDTH, 0, _SCREEN_WIDTH, 40);
        [_rootScrollView addSubview:_realSearchBar];
    }
    return _realSearchBar;
}
- (void)segmentedControlAction:(UISegmentedControl *)seg{
    switch (seg.selectedSegmentIndex) {
        case 0:
            [_rootScrollView setContentOffset:CGPointMake(0, -64) animated:YES];
            break;
        case 1:
            [_rootScrollView setContentOffset:CGPointMake(_SCREEN_WIDTH, -64) animated:YES];
            break;
        default:
            break;
    }
}
- (UIScrollView *)rootScrollView{
    if (!_rootScrollView) {
        _rootScrollView = [[UIScrollView alloc]init];
        _rootScrollView.frame = CGRectMake(0, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT);
        _rootScrollView.contentSize = CGSizeMake(_SCREEN_WIDTH*2,0);
        _rootScrollView.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
        _rootScrollView.pagingEnabled = YES;
        _rootScrollView.showsHorizontalScrollIndicator = NO;
        _rootScrollView.delegate = self;
        [self.view addSubview:_rootScrollView];
    }
    return _rootScrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = _rootScrollView.contentOffset.x/_SCREEN_WIDTH;
    [_rootSegmentedControl setSelectedSegmentIndex:index];
}
- (void)initTestData{
    NSString *string = @"hello";
    NSMutableArray *datas = [[NSMutableArray alloc]initWithObjects:string, string, string, string, string, string, string, string,nil];
    [datas addObjectsFromArray:datas];
    [datas addObjectsFromArray:datas];
    [datas addObjectsFromArray:datas];
    _virtualTableViewDelegate.dataArray = datas;
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
