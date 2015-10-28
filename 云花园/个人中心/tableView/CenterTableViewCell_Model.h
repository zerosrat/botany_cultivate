//
//  CenterTableViewCell_Model.h
//  云花园
//
//  Created by 白彬涵 on 15/10/22.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    headLine,
    others,
}modleType;
@interface CenterTableViewCell_Model : NSObject
@property (nonatomic,strong) NSString *titleString;
@property (nonatomic,strong) NSString *describString;
@property (nonatomic,strong) NSString *imageString;
@property (nonatomic,assign) modleType modelType;
@end
