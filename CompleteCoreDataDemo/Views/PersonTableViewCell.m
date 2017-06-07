//
//  PersonTableViewCell.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/7.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "PersonTableViewCell.h"
#import "PersonModelEntity.h"
#import "ChildModel.h"

@interface PersonTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatorView;
@property (weak, nonatomic) IBOutlet UILabel *personDesLabel;
@property (weak, nonatomic) IBOutlet UILabel *propertyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dictLabel;
@property (weak, nonatomic) IBOutlet UILabel *childLabel;


@end

@implementation PersonTableViewCell

+ (PersonTableViewCell *)cellWithTableView:(UITableView *)tableView {
    
    
    static NSString *reuseIdentifer = @"PersonTableViewCell";
    UINib * nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifer];
    PersonTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer];
    
    return cell;
}

- (void)setModel:(PersonModelEntity *)model {

    _model = model;
    
    self.avatorView.image = model.avater;
    self.personDesLabel.text = [NSString stringWithFormat:@"姓名：%@ 年龄：%hd 性别：%hd",model.name,model.age,model.vender];
    self.propertyLabel.text = [NSString stringWithFormat:@"%@", [(NSArray *)model.property componentsJoinedByString:@"、"]];
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:model.familyDict options:NSJSONWritingPrettyPrinted error:&parseError];
    self.dictLabel.text = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    self.childLabel.text = [NSString stringWithFormat:@"孩子姓名：%@ 孩子年龄：%ld",((ChildModel *)model.childClass).name,(long)((ChildModel *)model.childClass).age];
    
}
@end
