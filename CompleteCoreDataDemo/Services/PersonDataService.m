//
//  PersonDataService.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "PersonDataService.h"
#import "PersonModel.h"
#import "PersonModelEntity.h"


@implementation PersonDataService

+ (PersonDataService *)shareData {

    static PersonDataService *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PersonDataService alloc] init];
    });
    return sharedInstance;
}

//增加一个人
- (void)insertACommandCommandModel:(PersonModel *)person {

    PersonModelEntity *model = [NSEntityDescription insertNewObjectForEntityForName:@"PersonClass" inManagedObjectContext:self.managedObjectContext];
    model.age = person.age;
    model.name = person.name;
    model.vender = person.vender;
    model.childClass = person.childClass;
    model.familyDict = person.familyDict;
    model.avater = person.avater;
    model.property = person.property;
    
    [self saveContext];
}

//查询人列表
- (NSArray *)queryPersonList {

    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PersonClass" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
 
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects.count == 0) {
        return nil;
    }
    return fetchedObjects;
}

- (void)deleteAPerson:(PersonModelEntity *)entity {

    if (entity) {
        [self.managedObjectContext deleteObject:entity];
    }
}

@end
