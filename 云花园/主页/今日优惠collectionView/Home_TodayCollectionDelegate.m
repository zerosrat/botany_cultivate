//
//  Home_TodayCollectionDelegate.m
//  云花园
//
//  Created by 白彬涵 on 15/10/20.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "Home_TodayCollectionDelegate.h"
#import "Home_Today_CollectionViewCell.h"
@implementation Home_TodayCollectionDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"todayRecommendCell";
    Home_Today_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    cell.imageView.image = [UIImage imageNamed:@"cat"];
    cell.titleLabel.text = @"hello";
    cell.describeLabel.text = @"describe";
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //点击
    NSLog(@"hello world %@",indexPath);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    NSLog(@"nilll");
    [cell setBackgroundColor:[UIColor purpleColor]];
}

- (void)collectionView:(UICollectionView *)colView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor yellowColor]];
}
@end
