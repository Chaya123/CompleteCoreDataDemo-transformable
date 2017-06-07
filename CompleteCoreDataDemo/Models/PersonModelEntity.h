//
//  PersonModel.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface PersonModelEntity : NSManagedObject

@property(nonatomic) int16_t age;
//
@property(nonatomic) int16_t vender;

@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) id property;   //数组

@property(nonatomic,strong) id childClass;//类

@property(nonatomic,strong) id familyDict;//字典

@property(nonatomic,strong) id avater;//图片

@end

//如果想trans为特定的类型，就可以声明该类型，保持和type那一致

@interface UIImageTransToDataTransform : NSValueTransformer

@end
