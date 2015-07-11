
//
//  ShopDetailTableViewController.m
//  chichichi
//
//  Created by Nathan on 7/9/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "ShopDetailTableViewController.h"
#import "AFNetworking.h"
#import "VIPhotoView.h"

@interface ShopDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) Shop *currentShop;
@end

@implementation ShopDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getShopDetail];
    self.title = @"外卖详情";
}


#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        UIViewController *vc = [[UIViewController alloc]init];
        
        VIPhotoView *photoView = [[VIPhotoView alloc] initWithFrame:vc.view.frame andImage:self.currentShop.image];
//        photoView.autoresizingMask = (1 << 6) -1;
        [vc.view addSubview:photoView];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - Networking
- (void)getShopDetail{
    __weak ShopDetailTableViewController *weakSelf = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://zeman.im/chichichi/getshop.php"
      parameters:@{@"shopId" : [NSNumber numberWithUnsignedInteger:self.shopId]}
         success:^(AFHTTPRequestOperation *operation, NSDictionary *response) {
             weakSelf.currentShop = [Shop shopWithDic:response];
             [weakSelf reloadTableViewData];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
}

#pragma mark - Util

- (void)reloadTableViewData{
    __weak ShopDetailTableViewController *weakSelf = self;
    weakSelf.nameLabel.text = weakSelf.currentShop.name;
    weakSelf.telLabel.text= weakSelf.currentShop.tel;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weakSelf.currentShop.imageUrl]]];
    weakSelf.currentShop.image = image;
    self.imageView.image = image;
}

@end
