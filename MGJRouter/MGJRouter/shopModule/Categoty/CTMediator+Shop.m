//
//  CTMediator+Shop.m
//  MGJRouter
//
//  Created by 韩志峰 on 2018/10/24.
//  Copyright © 2018 韩志峰. All rights reserved.
//

#import "CTMediator+Shop.h"
NSString * const kCTMediatorTargetShop = @"Shop";
NSString * const kCTMediatorActionNativeFetchShopViewController = @"NativeFetchShopViewController";
@implementation CTMediator (Shop)
- (UIViewController *)CTMediatorViewControllerForShop{
    NSDictionary *dict = @{@"shoppingId":@"123",@"shopName":@"456"};
    UIViewController *targetVC = [self performTarget:kCTMediatorTargetShop cation:kCTMediatorActionNativeFetchShopViewController params:dict shouldCacheTarget:false];
    if ([targetVC isKindOfClass:[UIViewController class]]){
        return  targetVC;
    }else{
        return [[UIViewController alloc] init];
    }
}
@end
