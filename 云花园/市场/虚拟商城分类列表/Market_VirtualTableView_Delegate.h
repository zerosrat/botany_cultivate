//
//  Market_VirtualTableView_Delegate.h
//  云花园
//
//  Created by 白彬涵 on 15/10/26.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Market_VirtualTableView_Delegate : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
