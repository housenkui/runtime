//
//  ViewController.m
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>

#import "UIImage+Image.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建person对象
    Person *p = [[Person alloc]init];
    //调用对象方法
    [p eat];
    SEL sel = @selector(eat);
    //本质让对象发消息
    objc_msgSend(p,sel);
    
#pragma mark---对象底层发送消息
    
    //调用类方法的两种
    //第一种通过 类名调用
    [Person eat];
    
    //第二种通过类对象调用
    [[Person class]eat];
    
    //用类名调用类方法，底层会自动把类名转化为类对象调用
    
    //本质上是让类对象发消息
    objc_msgSend([Person class], sel);
    
    
    
    
    
    
#pragma mark---方法交换
    
    // 需求：给imageNamed方法提供功能，每次加载图片就判断下图片是否加载成功。
    // 步骤一：先搞个分类，定义一个能加载图片并且能打印的方法+ (instancetype)imageWithName:(NSString *)name;
    // 步骤二：交换imageNamed和imageWithName的实现，就能调用imageWithName，间接调用imageWithName的实现。
    
    
    
    UIImage *image =[UIImage imageNamed:@"hou.png"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
