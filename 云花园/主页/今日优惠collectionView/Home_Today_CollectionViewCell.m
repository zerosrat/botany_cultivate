//
//  Home_Today_CollectionViewCell.m
//  云花园
//
//  Created by 白彬涵 on 15/10/20.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "Home_Today_CollectionViewCell.h"

@implementation Home_Today_CollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetWidth(self.frame))];
        self.imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imageView];
        
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, -40, CGRectGetWidth(self.frame)-10, 20)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blackColor];
        [self addSubview:self.titleLabel];
        
        
        
        
        self.describeLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, -20, CGRectGetWidth(self.frame)-10, 20)];
        self.describeLabel.backgroundColor = [UIColor clearColor];
        self.describeLabel.textAlignment = NSTextAlignmentCenter;
        self.describeLabel.textColor = [UIColor blackColor];
        [self addSubview:self.describeLabel];
        
        
    }
    return self;
}
@end
