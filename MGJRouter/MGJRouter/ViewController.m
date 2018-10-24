//
//  ViewController.m
//  MGJRouter
//
//  Created by 韩志峰 on 2018/10/24.
//  Copyright © 2018 韩志峰. All rights reserved.
//

#import "ViewController.h"
#import "CTMediator+Shop.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    UIViewController *viewController = [[CTMediator shareInstance] CTMediatorViewControllerForShop];
    [self presentViewController:viewController animated:true completion:^{
        NSLog(@"tanchu");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
