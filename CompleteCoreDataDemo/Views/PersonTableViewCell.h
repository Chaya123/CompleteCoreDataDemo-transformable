//
//  PersonTableViewCell.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/7.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersonModelEntity;
@interface PersonTableViewCell : UITableViewCell

+ (PersonTableViewCell *)cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong) PersonModelEntity *model;

@end
