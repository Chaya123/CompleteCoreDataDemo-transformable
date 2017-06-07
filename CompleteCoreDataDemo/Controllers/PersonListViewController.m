//
//  PersonListViewController.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/7.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "PersonListViewController.h"
#import "PersonTableViewCell.h"
#import "PersonModelEntity.h"

@interface PersonListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *listTableView;

@end

@implementation PersonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationItem.title = @"查询列表";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.listTableView];
}

#pragma mark - Tableview Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    PersonTableViewCell *cell = [PersonTableViewCell cellWithTableView:tableView];
    PersonModelEntity *model = self.listArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)setListArray:(NSArray *)listArray {
    
    _listArray = listArray;
}

- (UITableView *)listTableView {
    
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStyleGrouped];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.rowHeight = 170.0f;
        _listTableView.showsVerticalScrollIndicator = NO;
    }
    return _listTableView;
}
@end
