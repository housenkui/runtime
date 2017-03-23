//
//  NSDictionary+SafeValue.m
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "NSDictionary+SafeValue.h"
#import <objc/runtime.h>
@implementation NSDictionary (SafeValue)
//加载分类到内存中的时候使用
- (id)safeValueForKey:(NSString *)key{
    
    if (!key) {
        NSLog(@"key不能为nil");
        return nil;
    }
    
    id obj =  [self objectForKey:key];
    
    if (!obj) {
        
        NSLog(@"%@中以%@为key的值是空",self,key);
    }
    return obj;
}
- (id)objectForKey:(NSString *)key{
    
    if (!key) {
        NSLog(@"key不能为nil");
        return nil;
    }
    id obj =  [self safeValueForKey:key];
    
    if (!obj) {
        
        NSLog(@"%@中%@为key的值是空",self,key);
    }
    return obj;
    
}
//+(void)load{
//    
//    
//    //交换方法
//    //获取imageWithName方法地址
//    Method safeValueForKey = class_getClassMethod(self, @selector(safeValueForKey:));
//    //获取imageName方法地址
//    Method objectForKey  = class_getClassMethod(self, @selector(objectForKey:));
//    
//    //交换方法地址、相当于交换实现的方法
//    method_exchangeImplementations(safeValueForKey, objectForKey);
//    
//}

@end
