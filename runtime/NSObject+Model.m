//
//  NSObject+Model.m
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/runtime.h>

@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    
    //思路：遍历模型中所有属性--->使用运行时
    //0.创建对应的对象
    
    id obj = [[self alloc]init];
    
    //1.利于runtime给对象中的成员属性赋值
    
    //
    //class_copyIvarList:获取类中的所有成员属性;
    //Ivar:成员属性的意思
    //第一参数:表示获取哪个类中的所有成员属性
    //第二个参数:表示这个类有多少成员属性，传入一个Int变量地址，会自动给这个变量赋
    //返回值Ivar* :指的是一个ivar数组，会把所有成员属性放在一个数组中，通过返回的数组就能全部获取到。
    /*类似下面的这种写法
    Ivar ivar;
    Ivar ivar1;
    Ivar ivar2;
    //定义一个ivar的数组a
    Ivar a[] = {ivar,ivar1,ivar2};
    
    //用一个Ivar *指针指向数组的第一个元素
    Ivar *ivarList = a;
    
    //根据指针访问数组第一个元素
    ivarList[0];
    */
    
    unsigned int count;
    
    //获取类中的所有成员属性
    
    Ivar *ivarList = class_copyIvarList(self, &count);
    //FIXME:为什么是NULL
    
    for (int i =0; i<count; i++) {
        
        //根据角标，从数组取出对应的成员属性
        
        Ivar ivar = ivarList[i];
        
        //获取成员属性名
        NSString *name =[NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //处理成员属性名-->字典中的key
        //从第一个角标开始截取
        NSString *key = [name substringFromIndex:1];
        
        //根据成员属性名去字典中查找对应的value
        
        id value = dict[key];
        
        //二级转换：如果字典中还有字典，也需要把对应的字典转成模型
        //判断value 是否是字典
        if([value isKindOfClass:[NSDictionary class]])
        {
            //字典转模型
            //获取模型的类对象，调用modelWithDict
            //模型的类名已知，就是成员属性的类型
            
            //获取成员属性类型
            NSString *type  =[NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            //
        }
        
        
        
        
        
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return obj;
    
}

/*摘了一段Apple源码 
 
 底层函数的命名方式 _objc_fixup_protocol_objects_for_image
 
  */

/*
static void _objc_fixup_protocol_objects_for_image (header_info * hi)
{
    unsigned int		size;
    OBJC_PROTOCOL_PTR	protos;
    unsigned int		index;
    
    // Locate protocals in the image
    protos = (OBJC_PROTOCOL_PTR) _getObjcProtocols ((headerType *) hi->mhdr, &size);
    if (!protos)
        return;
    
    // Apply the slide bias
    protos = (OBJC_PROTOCOL_PTR) ((unsigned long) protos + hi->image_slide);
    
    // Process each protocol
    for (index = 0; index < size; index += 1)
    {
        // Selectorize the instance methods
        if (protos[index] OBJC_PROTOCOL_DEREF instance_methods)
            map_method_descs (protos[index] OBJC_PROTOCOL_DEREF instance_methods);
        
        // Selectorize the class methods
        if (protos[index] OBJC_PROTOCOL_DEREF class_methods)
            map_method_descs (protos[index] OBJC_PROTOCOL_DEREF class_methods);
    }
    
    // Invoke Protocol class method to fix up the protocol
    [Protocol _fixup:(OBJC_PROTOCOL_PTR)protos numElements:size];
}
*/

@end
