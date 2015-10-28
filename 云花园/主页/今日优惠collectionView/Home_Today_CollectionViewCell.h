//
//  Home_Today_CollectionViewCell.h
//  云花园
//
//  Created by 白彬涵 on 15/10/20.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    bigOne,
    smallOne,
}typeOfcell;
@interface Home_Today_CollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,assign) typeOfcell *type;
@end
