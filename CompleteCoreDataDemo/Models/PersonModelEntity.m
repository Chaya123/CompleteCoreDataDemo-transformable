//
//  PersonModel.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "PersonModelEntity.h"

@implementation PersonModelEntity

@dynamic age;
@dynamic vender;
@dynamic name;
@dynamic property;
@dynamic childClass;
@dynamic familyDict;
@dynamic avater;

@end

@implementation UIImageTransToDataTransform

//转换成什么类型
+ (Class)transformedValueClass {
    return [NSData class];
}
//允许转换
+ (BOOL)allowsReverseTransformation {
    return YES;
}
//将图片转化成NSData存储
- (id)transformedValue:(id)value{
    
    if (value == nil) {
        return nil;
    }
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    return UIImagePNGRepresentation((UIImage *)value);
}
//将NSData类型数据反转成图片
- (id)reverseTransformedValue:(id)value {
    
    return [UIImage imageWithData:(NSData *)value];
}

@end
