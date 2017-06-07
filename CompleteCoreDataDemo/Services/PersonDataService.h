//
//  PersonDataService.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "BasicManagedObjectContext.h"


@class PersonModelEntity,PersonModel;

@interface PersonDataService : BasicManagedObjectContext

+ (PersonDataService *)shareData;


//增加一个人
- (void)insertACommandCommandModel:(PersonModel *)person;

//查询人列表
- (NSArray *)queryPersonList;

- (void)deleteAPerson:(PersonModelEntity *)entity;

@end
