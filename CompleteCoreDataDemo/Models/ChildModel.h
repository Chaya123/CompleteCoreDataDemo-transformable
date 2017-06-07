//
//  ChildModel.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChildModel : NSObject<NSCoding>

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) NSInteger age;

@end
