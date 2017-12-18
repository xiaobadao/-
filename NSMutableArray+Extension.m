//
//  NSMutableArray+Extension.m
//  CaihangjiaSDK
//
//  Created by ShaobinHuang on 2017/2/22.
//  Copyright © 2017年 ShaobinHuang. All rights reserved.
//

#import "NSMutableArray+Extension.h"
/**runtime实现 addObject:nil 不崩溃**/
@implementation NSMutableArray (Extension)

+ (void)load{
    Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(chj_addObject:));
    //交换系统方法
    method_exchangeImplementations(orginalMethod, newMethod);
}
//自己的方法
- (void)chj_addObject:(id)object{
    if (object != nil) {
        [self chj_addObject:object];
    }
}
@end
