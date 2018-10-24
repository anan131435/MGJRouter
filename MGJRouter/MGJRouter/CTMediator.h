//
//  CTMediator.h
//  MGJRouter
//
//  Created by 韩志峰 on 2018/10/24.
//  Copyright © 2018 韩志峰. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString *const kCTMediatorParamsKeySwiftTargetModuleName;
@interface CTMediator : NSObject
+ (instancetype)shareInstance;
//本地组件调用入口
- (id)performTarget:(NSString *)targetName cation:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;
@end
