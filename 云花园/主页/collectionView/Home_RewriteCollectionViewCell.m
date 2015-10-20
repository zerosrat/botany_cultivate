//
//  Home_RewriteCollectionViewCell.m
//  云花园
//
//  Created by 白彬涵 on 15/10/20.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "Home_RewriteCollectionViewCell.h"

@implementation Home_RewriteCollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetWidth(self.frame))];
        self.imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.cornerRadius = 25;
        
        [self addSubview:self.imageView];
        
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imageView.frame), CGRectGetWidth(self.frame)-10, 20)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blackColor];
        
        
        [self addSubview:self.titleLabel];
        
    }
    return self;
}
@end
