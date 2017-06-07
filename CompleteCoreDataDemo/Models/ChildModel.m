//
//  ChildModel.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "ChildModel.h"

@implementation ChildModel


- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
}
@end
