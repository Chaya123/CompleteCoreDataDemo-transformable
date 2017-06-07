//
//  PersonModel.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ChildModel.h"

typedef enum{
    
    VerderWoman = 1,
    VerderMan = 2
    
} Verder;

@interface PersonModel : NSObject

@property(nonatomic,assign) NSInteger age;

@property(nonatomic,assign) Verder vender;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,strong) NSArray *property;//财产数组

@property(nonatomic,strong) ChildModel *childClass;

@property(nonatomic,strong) NSDictionary *familyDict;

@property(nonatomic,strong) UIImage *avater;


@end
