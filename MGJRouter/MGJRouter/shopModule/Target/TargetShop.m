//
//  TargetShop.m
//  MGJRouter
//
//  Created by 韩志峰 on 2018/10/24.
//  Copyright © 2018 韩志峰. All rights reserved.
//

#import "TargetShop.h"
#import "ShopViewController.h"

@implementation TargetShop
- (UIViewController *)ActionNativeFetchShopViewController:(NSDictionary *)parama{
    ShopViewController *shopVC = [[ShopViewController alloc] init];
    if ([parama valueForKey:@"shoppingId"]){
        shopVC.shoppingId = parama[@"shoppingId"];
    }
    if ([parama valueForKey:@"shopName"]){
        shopVC.shopName = parama[@"shopName"];
    }
    return  shopVC;
    
}
@end
