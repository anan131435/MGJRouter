//
//  CTMediator.m
//  MGJRouter
//
//  Created by 韩志峰 on 2018/10/24.
//  Copyright © 2018 韩志峰. All rights reserved.
//

#import "CTMediator.h"
#import <objc/runtime.h>

NSString *const kCTMediatorParamsKeySwiftTargetModuleName = @"kCTMediatorParamsKeySwiftTargetModuleName";

@interface CTMediator ()


@property (nonatomic, strong) NSMutableDictionary  *cachedTarget;

@end



@implementation CTMediator
+ (instancetype)shareInstance{
    static CTMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[CTMediator alloc] init];
    });
    return mediator;
}
- (id)performTarget:(NSString *)targetName cation:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget{
    //generate target
//    NSString *modelName = params[kCTMediatorParamsKeySwiftTargetModuleName];
//    NSString *targetClassString = nil;
//    if (modelName.length > 0){
//        targetClassString = [NSString stringWithFormat:@"%@.Target%@",modelName,targetName];
//    }else{
//        targetClassString = [NSString stringWithFormat:@"Target%@",targetName];
//    }
    NSString *targetClassString = nil;
    targetClassString = [NSString stringWithFormat:@"Target%@",targetName];
    NSObject *target = self.cachedTarget[targetClassString];
    if (!target){
        Class targetCalss = NSClassFromString(targetClassString);
        target = [[targetCalss alloc] init];
    }
    //generate action
    NSString *actionString = [NSString stringWithFormat:@"Action%@:",actionName];
    SEL action = NSSelectorFromString(actionString);
    
    if (shouldCacheTarget){
        self.cachedTarget[targetClassString] = target;
    }
    if ([target respondsToSelector:action]){
        return [target performSelector:action withObject:params];
    }else{
        return nil;
    }
    
}
- (NSMutableDictionary *)cachedTarget{
    if (!_cachedTarget){
        _cachedTarget = [[NSMutableDictionary alloc] init];
    }
    return  _cachedTarget;
}
@end
