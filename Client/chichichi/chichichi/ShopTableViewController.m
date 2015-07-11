//
//  ShopTableViewController.m
//  chichichi
//
//  Created by Nathan on 7/9/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "ShopTableViewController.h"
#import "ShopDetailTableViewController.h"
#import "AFNetworking.h"
#import "Shop.h"

@interface ShopTableViewController ()

@property(nonatomic, strong) NSMutableArray *shopArray;

@end

@implementation ShopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getShops];
    self.title = @"外卖列表";
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.shopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shopCell"];
    }
    Shop *shop = self.shopArray[indexPath.row];
    cell.textLabel.text = shop.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopDetailTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ShopDetailTableViewController"];
    Shop *shop = self.shopArray[indexPath.row];
    vc.shopId = shop.shopId;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Networking

- (void)getShops{
    __weak ShopTableViewController *weakSelf = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://zeman.im/chichichi/getallshopsname.php"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, NSDictionary *response) {
             for (NSDictionary *dic in response[@"shops"]) {
                 [weakSelf.shopArray addObject:[Shop shopWithDic:dic]];
             }
             [self.tableView reloadData];
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Init

- (NSMutableArray *)shopArray{
    if (!_shopArray) {
        _shopArray = [[NSMutableArray alloc]init];
    }
    return _shopArray;
}
@end
