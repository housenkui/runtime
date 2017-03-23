//
//  Person.m
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person

- (void)eat
{
    
    NSLog(@"吃午饭-----");
}
+ (void)eat{
    NSLog(@"吃午饭+++++");

}
//
void drink(id self,SEL sel){
    
    NSLog(@"%@  %@",self,NSStringFromSelector(sel));
    NSLog(@"C的方法");
    
}

//暂且理解函数名称就是函数的地址

//当一个对象调用未实现的方法，会调用这个方法处理，并且会把对应的方法列表传过来
//刚好可以用来判断，未实现的方法是不是我们想要动态添加的方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    NSLog(@"方法名------%@",NSStringFromSelector(sel));
    if (sel==@selector(drink)) {
        //动态添加drink方法
        //第一个参数:给哪个类添加方法
        //第二个参数:添加方法的方法编号
        //第三个参数：添加方法的函数实现(函数地址) 函数名
        //第四个参数：函数的类型，（返回值+参数类型）v:void @:对象->self :表示SEL->_cmd
        
        class_addMethod(self,@selector(drink),drink,"v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}
/*
 void func(int x,...);
 其中，&func和func是一样的，都可以看做函数地址．
 
 */

/**
 * Adds a new method to a class with a given name and implementation.
 *
 * @param cls The class to which to add a method.
 * @param name A selector that specifies the name of the method being added.
 * @param imp A function which is the implementation of the new method. The function must take at least two arguments—self and _cmd.
 //实际上我在C函数里面没有参数也可以通过
 
 * @param types An array of characters that describe the types of the arguments to the method.
 *
 * @return YES if the method was added successfully, otherwise NO
 *  (for example, the class already contains a method implementation with that name).
 *
 * @note class_addMethod will add an override of a superclass's implementation,
 *  but will not replace an existing implementation in this class.
 *  To change an existing implementation, use method_setImplementation.
 */
@end
