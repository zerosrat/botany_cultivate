//
//  HomePageViewController.m
//  真实花园
//
//  Created by 白彬涵 on 15/9/7.
//  Copyright (c) 2015年 BBH工作室. All rights reserved.
//

#import "HomePageViewController.h"
#import "Home_CollectionDelegate.h"
#import "Home_RewriteCollectionViewCell.h"
@interface HomePageViewController ()<UIScrollViewDelegate>
@property (nonatomic,assign) CGFloat SCREEN_WIDTH;
@property (nonatomic,assign) CGFloat SCREEN_HEIGHT;
@property (nonatomic,strong) UIScrollView *rootScrollView;
@property (nonatomic,strong) UIScrollView *headImageScrollView;
@property (nonatomic,strong) UIPageControl *headImagePageControl;
@property (nonatomic,strong) UIView *infoRootView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) Home_CollectionDelegate *collectionDelegate;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    _SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    [self initSubView];
    // Do any additional setup after loading the view.
}
#pragma mark 初始化控件
- (void)initSubView{
    _rootScrollView = [[UIScrollView alloc]init];
    _headImageScrollView = [[UIScrollView alloc]init];
    _headImagePageControl = [[UIPageControl alloc]init];
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _collectionDelegate = [[Home_CollectionDelegate alloc]init];
    _infoRootView = [[UIView alloc]init];
    
    
    [self initFrame];
    
    
    
    [self.view addSubview:_rootScrollView];
    [_rootScrollView addSubview:_headImageScrollView];
    [_rootScrollView addSubview:_headImagePageControl];
    [_rootScrollView addSubview:_collectionView];
    [_rootScrollView addSubview:_infoRootView];
}
#pragma mark 修改控件frame
- (void)initFrame{
    //背景滑动ScrollView
    _rootScrollView.frame = CGRectMake(0, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT);
    _rootScrollView.backgroundColor = [UIColor whiteColor];
    _rootScrollView.contentSize = CGSizeMake(_SCREEN_WIDTH, 1000);
    //开头的轮播图片
    _headImageScrollView.frame = CGRectMake(0, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT*0.2);
    _headImageScrollView.backgroundColor = [UIColor lightGrayColor];
    _headImageScrollView.contentSize = CGSizeMake(_SCREEN_WIDTH*3, 60);
    _headImageScrollView.pagingEnabled = YES;
    _headImageScrollView.showsHorizontalScrollIndicator = NO;
    _headImageScrollView.delegate = self;
    //为其添加图片
    UIImageView *firstImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    firstImage.frame = CGRectMake(0, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT*0.2);
    [_headImageScrollView addSubview:firstImage];
    UIImageView *secondImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    secondImage.frame = CGRectMake(_SCREEN_WIDTH, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT*0.2);
    [_headImageScrollView addSubview:secondImage];
    UIImageView *thirdImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3"]];
    thirdImage.frame = CGRectMake(_SCREEN_WIDTH*2, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT*0.2);
    [_headImageScrollView addSubview:thirdImage];
    //分页圆点
    _headImagePageControl.numberOfPages = 3;
    _headImagePageControl.currentPage = 0;
    CGSize size= [_headImagePageControl sizeForNumberOfPages:3];
    _headImagePageControl.bounds=CGRectMake(0, 0, size.width, size.height);
    _headImagePageControl.center = CGPointMake(_SCREEN_WIDTH/2,_SCREEN_HEIGHT*0.2-20);
    [_headImagePageControl addTarget:self action:@selector(changePages) forControlEvents:UIControlEventValueChanged];
    //资料库collectionView
    _flowLayout.itemSize = CGSizeMake(50, 50);
    _flowLayout.minimumLineSpacing = 70;
    _flowLayout.minimumInteritemSpacing = 30;
    _flowLayout.sectionInset = UIEdgeInsetsMake(10, 30, 30, 30);
    
    CGRect rect = CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.3+_SCREEN_WIDTH*0.04, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.28);
    _collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:_flowLayout];
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerClass:[Home_RewriteCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = _collectionDelegate;
    _collectionView.dataSource = _collectionDelegate;
    //城市当天信息
    _infoRootView.frame = CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.2+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.1);
    _infoRootView.backgroundColor = [UIColor lightGrayColor];
    UILabel *cityInfo = [[UILabel alloc]init];
    cityInfo.frame = CGRectMake(10, (_infoRootView.frame.size.height-50)/2, 100, 50);
    cityInfo.text = @"成都";
    cityInfo.font = [UIFont systemFontOfSize:20];
    [_infoRootView addSubview:cityInfo];
    UILabel *temperature = [[UILabel alloc]init];
    temperature.frame = CGRectMake(_SCREEN_WIDTH*0.3, (_infoRootView.frame.size.height-50)/2, 100, 50);
    temperature.text = @"30℃";
    temperature.font = [UIFont systemFontOfSize:20];
    [_infoRootView addSubview:temperature];
    
}
- (void)changePages{
    [_headImageScrollView setContentOffset:CGPointMake(_headImagePageControl.currentPage*_SCREEN_WIDTH, 0) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = fabs(_headImageScrollView.contentOffset.x/_SCREEN_WIDTH);
    _headImagePageControl.currentPage = index;
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
