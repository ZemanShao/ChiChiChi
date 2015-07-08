
//
//  ShopDetailTableViewController.m
//  chichichi
//
//  Created by Nathan on 7/9/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "ShopDetailTableViewController.h"
#import "AFNetworking.h"
#import "ASMediaFocusManager.h"

@interface ShopDetailTableViewController ()<ASMediasFocusDelegate>
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
//        ASMediaFocusManager *mediaFocusManager = [[ASMediaFocusManager alloc] init];
//        mediaFocusManager.delegate = self;
//        [mediaFocusManager installOnView:self.imageView];
    }
}

#pragma mark - ASMediaFocusDelegate

- (UIViewController *)parentViewControllerForMediaFocusManager:(ASMediaFocusManager *)mediaFocusManager
{
    return self.parentViewController;
}

// Returns the URL where the media (image or video) is stored. The URL may be local (file://) or distant (http://).
- (NSURL *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager mediaURLForView:(UIView *)view
{
//    NSInteger index;
//    NSString *name;
//    NSURL *url;
//    
//    // Here, medias are accessed through their name stored in self.mediaNames
//    index = [self.imageViews indexOfObject:view];
//    name = self.mediaNames[index];
//    url = [[NSBundle mainBundle] URLForResource:name withExtension:nil];

    return [NSURL URLWithString:self.currentShop.imageUrl];
}

// Returns the title for this media view. Return nil if you don't want any title to appear.
- (NSString *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager titleForView:(UIView *)view
{
    return @"My title";
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
         }];
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
