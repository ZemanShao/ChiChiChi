//
//  ViewController.m
//  chichichi
//
//  Created by Nathan on 7/7/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "QiniuSDK.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)buttonDidPressed:(id)sender {
    [self getUploadToken];
}

- (void)getUploadToken{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://localhost:8881/ChiChiChi/Server/getuploadtoken.php" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *response) {
        
        NSString *token = response[@"token"];
        QNUploadManager *upManager = [[QNUploadManager alloc] init];
        NSData *data = [NSData dataWithData:UIImagePNGRepresentation([UIImage imageNamed:@"1"])];
        [upManager putData:data key:@"4" token:token
                  complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                      NSLog(@"%@", info);
                      NSLog(@"%@", resp);
                  } option:nil];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}




@end
