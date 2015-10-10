//
//  ViewController.m
//  testXcode
//
//  Created by BLZ on 15/8/17.
//  Copyright (c) 2015年 BLZ. All rights reserved.
//

#import "ViewController.h"
#define ScreenFrame [UIScreen mainScreen].bounds

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController




- (void)viewDidLoad {

    
    UITableView *tableView = [[UITableView alloc] initWithFrame:ScreenFrame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
    
}

@end
