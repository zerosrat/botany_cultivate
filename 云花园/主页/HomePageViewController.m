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
#import "Home_Recommend_CollectionDelegate.h"
#import "Home_Today_CollectionViewCell.h"
#import "Home_TodayCollectionDelegate.h"
@interface HomePageViewController ()<UIScrollViewDelegate>
@property (nonatomic,assign) CGFloat SCREEN_WIDTH;
@property (nonatomic,assign) CGFloat SCREEN_HEIGHT;
@property (nonatomic,strong) UIScrollView *rootScrollView;//最背景的scrollview
@property (nonatomic,strong) UIScrollView *headImageScrollView;//图片轮播
@property (nonatomic,strong) UIPageControl *headImagePageControl;//图片轮播中的小点
@property (nonatomic,strong) UIView *infoRootView;//城市天气信息背景
@property (nonatomic,strong) UICollectionView *collectionView;//资料库collection
@property (nonatomic,strong) Home_CollectionDelegate *collectionDelegate;//资料库协议
@property (nonatomic,strong) UICollectionView *recommendCollectionView;//今日推荐collection
@property (nonatomic,strong) Home_Recommend_CollectionDelegate *recommendCollectionDelegate;//今日推荐协议
@property (nonatomic,strong) UICollectionView *todayCollectionView;//今日推荐collection
@property (nonatomic,strong) Home_TodayCollectionDelegate *todayCollectionDelegate;//今日推荐协议


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
    [self initFrame];
}
#pragma mark 修改控件frame
- (void)initFrame{
    //背景滑动ScrollView
    _rootScrollView = [[UIScrollView alloc]init];
    _rootScrollView.frame = CGRectMake(0, 0, _SCREEN_WIDTH, _SCREEN_HEIGHT);
    _rootScrollView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    _rootScrollView.contentSize = CGSizeMake(_SCREEN_WIDTH, 1000);
    _rootScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_rootScrollView];
    [self initHeadScrollView];
    [self initCityAndWeatherInfo];
    [self initExplainLabel:@"资料库" andFrame:CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.3+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.08)];
    [self initMeansInfo];
    [self initExplainLabel:@"今日推荐种子" andFrame:CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.66+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.08)];
    [self initRecommon];
    [self initExplainLabel:@"今日优惠" andFrame:CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.94+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.08)];
    [self initTodayCollection];
}
#pragma mark 初始化图片轮播
- (void)initHeadScrollView{
    //开头的轮播图片
    NSTimer *timer = [[NSTimer alloc]init];
    timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    _headImageScrollView = [[UIScrollView alloc]init];
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
    _headImagePageControl = [[UIPageControl alloc]init];
    _headImagePageControl.numberOfPages = 3;
    _headImagePageControl.currentPage = 0;
    CGSize size= [_headImagePageControl sizeForNumberOfPages:3];
    _headImagePageControl.bounds=CGRectMake(0, 0, size.width, size.height);
    _headImagePageControl.center = CGPointMake(_SCREEN_WIDTH/2,_SCREEN_HEIGHT*0.2-20);
    [_rootScrollView addSubview:_headImageScrollView];
    [_rootScrollView addSubview:_headImagePageControl];
}
- (void)timeAction{
    int count = _headImageScrollView.contentOffset.x/_SCREEN_WIDTH;
    if (count==2) {
        [_headImageScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else {
        [_headImageScrollView setContentOffset:CGPointMake((count+1)*_SCREEN_WIDTH, 0) animated:YES];
    }
    int index =(_headImageScrollView.contentOffset.x/_SCREEN_WIDTH);
    _headImagePageControl.currentPage = (index+1)%3;
}
#pragma mark 初始化城市以及天气信息
- (void)initCityAndWeatherInfo{
     //城市当天信息
    _infoRootView = [[UIView alloc]init];
    _infoRootView.frame = CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.2+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.1);
    _infoRootView.backgroundColor = [UIColor whiteColor];
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
    [_rootScrollView addSubview:_infoRootView];
}
#pragma mark 初始化描述文字
- (void)initExplainLabel:(NSString *)string andFrame:(CGRect )rect{
    //资料库描述
    UIView *rootView = [[UIView alloc]init];
    rootView.frame = rect;
    CGFloat width = rect.size.width;
    CGFloat height= rect.size.height;
    rootView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    UIView *line1OfMean = [[UIView alloc]initWithFrame:CGRectMake(0, (height-1)/2,width*0.3, 1)];
    line1OfMean.backgroundColor = [UIColor grayColor];
    [rootView addSubview:line1OfMean];
    UIView *line2OfMean = [[UIView alloc]initWithFrame:CGRectMake(width*0.7, (height-1)/2,width*0.3, 1)];
    line2OfMean.backgroundColor = [UIColor grayColor];
    [rootView addSubview:line2OfMean];
    UILabel *meanLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,width,height)];
    meanLabel.text = string;
    meanLabel.textAlignment = NSTextAlignmentCenter;
    meanLabel.font = [UIFont systemFontOfSize:20];
    [rootView addSubview:meanLabel];
    [_rootScrollView addSubview:rootView];
}
#pragma mark 初始化资料库collectionview
- (void)initMeansInfo{
    //资料库collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _collectionDelegate = [[Home_CollectionDelegate alloc]init];
    CGRect rect = CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.38+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.28);
    flowLayout.itemSize = CGSizeMake(50, 50);
    flowLayout.minimumLineSpacing = 70;
    flowLayout.minimumInteritemSpacing = 30;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 30, 30, 30);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[Home_RewriteCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = _collectionDelegate;
    _collectionView.dataSource = _collectionDelegate;
    [_rootScrollView addSubview:_collectionView];
}
#pragma mark 初始化今日推荐种子collectionview
- (void)initRecommon{
    //今日推荐collectionview
    CGRect rect = CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*0.74+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.2);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80, 80);
    flowLayout.minimumLineSpacing = 70;
    flowLayout.minimumInteritemSpacing = 30;
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 30, 30, 30);
    _recommendCollectionDelegate = [[Home_Recommend_CollectionDelegate alloc]init];
    _recommendCollectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
    _recommendCollectionView.backgroundColor = [UIColor whiteColor];
    [_recommendCollectionView registerClass:[Home_Recommend_CollectionViewCell class] forCellWithReuseIdentifier:@"recommendCell"];
    _recommendCollectionView.delegate = _recommendCollectionDelegate;
    _recommendCollectionView.dataSource = _recommendCollectionDelegate;
    [_rootScrollView addSubview:_recommendCollectionView];
}
- (void)initTodayCollection{
    
    CGRect rect = CGRectMake(_SCREEN_WIDTH*0.02, _SCREEN_HEIGHT*1.02+_SCREEN_WIDTH*0.02, _SCREEN_WIDTH*0.96, _SCREEN_HEIGHT*0.45);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80, 80);
    flowLayout.minimumLineSpacing = 60;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(50, 0, 0, 0);
    _todayCollectionDelegate = [[Home_TodayCollectionDelegate alloc]init];
    _todayCollectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
    _todayCollectionView.backgroundColor = [UIColor whiteColor];
    [_todayCollectionView registerClass:[Home_Today_CollectionViewCell class] forCellWithReuseIdentifier:@"todayRecommendCell"];
    _todayCollectionView.delegate = _todayCollectionDelegate;
    _todayCollectionView.dataSource = _todayCollectionDelegate;
    [_rootScrollView addSubview:_todayCollectionView];
    
}
#pragma mark 同步pagecontroll和scrollview
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = fabs(_headImageScrollView.contentOffset.x/_SCREEN_WIDTH);
    _headImagePageControl.currentPage = index;
}

- (void)didReceiveMemoryWarning {
    NSLog(@"receiveMemoryWarning");
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
