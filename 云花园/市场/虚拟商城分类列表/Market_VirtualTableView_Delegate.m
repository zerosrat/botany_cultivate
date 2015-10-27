//
//  Market_VirtualTableView_Delegate.m
//  云花园
//
//  Created by 白彬涵 on 15/10/26.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "Market_VirtualTableView_Delegate.h"


@implementation Market_VirtualTableView_Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *TableSampleIdentifier = @"virtualTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableSampleIdentifier];
    }
    cell.textLabel.text = @"hello";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //可在此处修改点击后cell栏的颜色
    if ((_dataArray.count - [indexPath row])<12) {
        [tableView setContentOffset:CGPointMake(0,(_dataArray.count-12)*44+12) animated:YES];
    }
    else{
        [tableView setContentOffset:CGPointMake(0, [indexPath row]*44) animated:YES];
    }
}

@end
