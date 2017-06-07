//
//  MainViewController.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "MainViewController.h"
#import "DevInsertCommandVC.h"
#import "RequestListViewController.h"
#import "CommandDataService.h"
#import "PersonDataService.h"
#import "PersonModelEntity.h"
#import "PersonModel.h"
#import "ChildModel.h"
#import "PersonListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
//开发成员提交需求
- (IBAction)dev_insertACommand:(UIButton *)sender {
    
    [self.navigationController pushViewController:[[DevInsertCommandVC alloc] init] animated:YES];
}
//开发成员查看需求
- (IBAction)dev_QueryCommandList:(UIButton *)sender {
    
    NSArray *listArray = [[CommandDataService shareData] queryCommandListDealStatus:DEAL_STATUS_ALL];
    RequestListViewController *vc = [[RequestListViewController alloc] init];
    vc.listArray = listArray;
    vc.personClass = PERSONCLASS_DEV;
    [self.navigationController pushViewController:vc animated:YES];
}
//运维成员管理需求
- (IBAction)operater_QueryAndDealCommandList:(UIButton *)sender{
    
    NSArray *listArray = [[CommandDataService shareData] queryCommandListDealStatus:DEAL_STATUS_ALL];
    RequestListViewController *vc = [[RequestListViewController alloc] init];
    vc.listArray = listArray;
    vc.personClass = PERSONCLASS_OPERATOR;
    [self.navigationController pushViewController:vc animated:YES];
}
//管理成员管理需求
- (IBAction)manage_QueryAndDealCommandList:(UIButton *)sender{
    
    NSArray *listArray = [[CommandDataService shareData] queryCommandListDealStatus:DEAL_STATUS_WAITCHECKSUCCESS];
    RequestListViewController *vc = [[RequestListViewController alloc] init];
    vc.listArray = listArray;
    vc.personClass = PERSONCLASS_MANAGE;
    [self.navigationController pushViewController:vc animated:YES];
}
//新增一个人名单
- (IBAction)addAperson:(UIButton *)sender {
    
    NSInteger x = 1 + arc4random() % 4;
    PersonModel *personModel = [[PersonModel alloc] init];
    personModel.name = [NSString stringWithFormat:@"张三%ld",(long)x];
    personModel.age = x;
    personModel.vender = x%2 == 0 ? VerderWoman:VerderMan;
    personModel.property = @[@"房子",@"车子",@"孩子"];
    personModel.familyDict = @{@"name":[NSString stringWithFormat:@"张三%ld",(long)x],@"age":@(x)};
    personModel.avater = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld",(long)x]];
    ChildModel *model = [[ChildModel alloc] init];
    model.name = [NSString stringWithFormat:@"%@的孩子",personModel.name];
    model.age = 3;
    personModel.childClass = model;
    
    [[PersonDataService shareData] insertACommandCommandModel:personModel];
    
}
//查询人 列表
- (IBAction)queryPersonList:(UIButton *)sender {
    
    NSArray * listArray = [[PersonDataService shareData] queryPersonList];
//
//    for (PersonModelEntity *entity in listArray) {
//        
//        NSLog(@"entity age = %hd",entity.age);
//    }
//    
    PersonListViewController *vc = [[PersonListViewController alloc] init];
    vc.listArray = listArray;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
