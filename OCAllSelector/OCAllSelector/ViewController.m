//
//  ViewController.m
//  OCAllSelector
//
//  Created by  ZhuHong on 2018/1/14.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 调用空段 sel
    [self hgWithFirstParam:@"1" secParam:@"2" :@"3"];
    // 多参函数调用
    hgLog(@"fmt_param", @"other_param", @"23", nil);
}

#pragma mark - 多参函数实现
void hgLog(NSString* fmt, ...) {
    // 中间变量
    NSString *midParam = nil;
    
    // 参数列表
    va_list arg_list;
    // 创建 arg_list ,并将指针指向第一个参数的位置
    va_start(arg_list, fmt);
    
    // 所有的值
    NSMutableArray *params = [NSMutableArray array];
    // 假装 fmt 是非空
    [params addObject:fmt];
    // 循环获取具体的参数值
    while((midParam = va_arg(arg_list, id))){
        [params addObject:midParam];
    }
    
    // 结束,释放指针
    va_end(arg_list);
    
    // 打印
    NSLog(@"%@", params);
}

#pragma mark - 空段
- (void)hgWithFirstParam:(NSString*)firstParam secParam:(NSString*)secParam :(NSString*)thirthParam {
    // 打印参数值
    NSLog(@"firstParam = %@, secParam = %@, thirthParam = %@", firstParam, secParam, thirthParam);
    
    NSLog(@"当前的sel字符串 = %s",__FUNCTION__);
}

#pragma mark - 常规的方法, 不用介绍



@end
