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
    
    id obj =  [self safeValueForKey:key];
    
    if (!obj) {
        
        NSLog(@"%@中以%@为key的值是空",self,key);
    }
    return obj;
}

//FIXME:这里为什么交换不成功

/*
 objectForKey:属于实例 方法
 暂时的理解  load这里还没有创建实例  所以不能交换
 */
+(void)load{
    
    //交换方法
    //获取safeValueForKey方法地址
    Method safeValueForKey = class_getInstanceMethod(self, @selector(safeValueForKey:));
    //获取objectForKey方法地址
    Method objectForKey  = class_getInstanceMethod(self, @selector(objectForKey:));
    
    //交换方法地址、相当于交换实现的方法
    method_exchangeImplementations(safeValueForKey, objectForKey);
    
    
}

@end
