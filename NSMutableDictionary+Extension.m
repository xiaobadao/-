//
//  NSMutableDictionary+Extension.m
//  CaihangjiaSDK
//
//  Created by ShaobinHuang on 2017/2/22.
//  Copyright © 2017年 ShaobinHuang. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>
/**runtime实现 setObject:nil 不崩溃**/
@implementation NSMutableDictionary (Extension)

+ (void)load{
    Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(chj_setObject:forKey:));
    //交换系统方法
    method_exchangeImplementations(orginalMethod, newMethod);
}
//自己的方法
- (void)chj_setObject:(id)anObject forKey:(id)aKey{
    [self chj_setObject:anObject?anObject:@"" forKey:aKey];
}
@end
