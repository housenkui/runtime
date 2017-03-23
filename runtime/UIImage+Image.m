
//
//  UIImage+Image.m
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/runtime.h>
@implementation UIImage (Image)

//加载分类到内存中的时候使用

+(void)load{
    
    //交换方法
    
    //获取imageWithName方法地址
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    //获取imageName方法地址
    Method imageName  = class_getClassMethod(self, @selector(imageNamed:));
    
    //交换方法地址、相当于交换实现的方法
    method_exchangeImplementations(imageWithName, imageName);
    
}
//分类中不能调用super,也不能重现系统方法imageNamed:,那会覆盖掉系统的方法。
//既能加载图片又能打印
+(instancetype)imageWithName:(NSString *)name{
    
    UIImage *image  =[self imageWithName:name];
    
    if (!image) {
        
        NSLog(@"加载了空的图片");
        
    }
    return image;
}























@end
