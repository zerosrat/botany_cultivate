//
//  CenterTableView_Cell.m
//  云花园
//
//  Created by 白彬涵 on 15/10/22.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "CenterTableView_Cell.h"
@interface CenterTableView_Cell()
@property (nonatomic,assign) CGFloat SCREEN_WIDTH;
@property (nonatomic,assign) CGFloat SCREEN_HEIGHT;
@property (nonatomic,strong) UIImageView *userHeadImageView;
@property (nonatomic,strong) UILabel *userNameLable;
@property (nonatomic,strong) UILabel *userDetalLable;
@end
@implementation CenterTableView_Cell
- (void)setCellModel:(CenterTableViewCell_Model *)cellModel{
    _cellModel = cellModel;
    [self initSubView];
}
- (void)initSubView{
    if (_cellModel.modelType == headLine) {
        [self userHeadImageView];
        [self userNameLable];
        [self userDetalLable];
    }
    else{
        self.textLabel.text = _cellModel.titleString;
        self.detailTextLabel.text = _cellModel.describString;
//        self.imageView.image = [UIImage imageNamed:@"头像"];
    }
}
- (UIImageView *)userHeadImageView{
    if (!_userHeadImageView) {
        _userHeadImageView = [[UIImageView alloc]init];
        _userHeadImageView.frame = CGRectMake(10, 10, 80, 80);
        _userHeadImageView.image = [UIImage imageNamed:_cellModel.imageString];
        _userHeadImageView.layer.masksToBounds = YES;
        _userHeadImageView.layer.cornerRadius = 5;
        [self addSubview:_userHeadImageView];
    }
    return _userHeadImageView;
}
- (UILabel *)userNameLable{
    if (!_userNameLable) {
        _userNameLable = [[UILabel alloc]init];
        _userNameLable.frame = CGRectMake(110, 5, 100, 30);
        _userNameLable.text = _cellModel.titleString;
        [self addSubview:_userNameLable];
    }
    return _userNameLable;
}
- (UILabel *)userDetalLable{
    if (!_userDetalLable) {
        _userDetalLable = [[UILabel alloc]init];
        _userDetalLable.frame = CGRectMake(110, 40, 200, 40);
        _userDetalLable.text = _cellModel.describString;
        [self addSubview:_userDetalLable];
    }
    return _userDetalLable;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
