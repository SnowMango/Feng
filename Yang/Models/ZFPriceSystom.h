//
//  ZFPriceSystom.h
//  yang
//
//  Created by zhengfeng on 2018/1/31.
//  Copyright © 2018年 zhengfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

#import "ZFDishesGroup.h"

@interface ZFPriceSystom : BaseModel

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSArray <ZFDishesGroup*>*group;

@end
