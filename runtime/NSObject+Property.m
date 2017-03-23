//
//  NSObject+Property.m
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

static const NSString *key = @"name";

@implementation NSObject (Property)

-(NSString *)name{
    
    return objc_getAssociatedObject(self, (__bridge const void *)(key));
}
- (void)setName:(NSString *)name{
    //第一个参数：给哪个对象添加关联
    //第二个参数：关联的key，通过这个key获取
    //第三个参数：关联的value
    //关联的策略:
    objc_setAssociatedObject(self, (__bridge const void *)(key), name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
