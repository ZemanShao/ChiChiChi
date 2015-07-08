//
//  Shop.h
//  chichichi
//
//  Created by Nathan on 7/9/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Shop : NSObject

@property NSUInteger shopId;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *tel;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) UIImage *image;

+(instancetype)shopWithDic:(NSDictionary *)dic;
@end
