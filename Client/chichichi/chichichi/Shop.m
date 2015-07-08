//
//  Shop.m
//  chichichi
//
//  Created by Nathan on 7/9/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+(instancetype)shopWithDic:(NSDictionary *)dic{
    Shop *shop = [[Shop alloc]init];
    shop.shopId = dic[@"shopId"] == [NSNull null] ? 0 : [dic[@"shopId"] integerValue];
    shop.name = dic[@"shopName"] == [NSNull null] ? nil : dic[@"shopName"];
    shop.tel = dic[@"shopTel"] == [NSNull null] ? nil : dic[@"shopTel"];
    shop.imageUrl = dic[@"shopImage"] == [NSNull null] ? nil : dic[@"shopImage"];
    return shop;
}

@end
