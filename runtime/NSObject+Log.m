//
//  NSObject+Log.m
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "NSObject+Log.h"

@implementation NSObject (Log)
+(void)resolveDict:(NSDictionary *)dict{
    
    //拼接属性字符串代码
    NSMutableString *strM =[NSMutableString string];
    
    //1.遍历字典，把字典中的所有的key取出来，生成对应的属性代码
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //类型经常变，抽出来
        NSString *type;
        
        if([obj isKindOfClass:[NSString class]]){
            
            type = @"NSString";
        }else if ([obj isKindOfClass:[NSArray class]]){
            
            type = @"NSArray";
        }
        else if ([obj isKindOfClass:[NSNumber class]]){
            
            type = @"int";
        }
        else if ([obj isKindOfClass:[NSDictionary class]]){
            
            type = @"NSDictionary";
        }
        
        NSLog(@"obj = %@",obj);
        
        NSLog(@"key = %@",key);
        
        NSLog(@"type = %@",type);

        
      //属性字符串
        NSString *str;
        if ([type containsString:@"NS"]) {
            
            str = [NSString stringWithFormat:@"@property (nonatomic,strong) %@ *%@",type,key];
        }
        else{
            str = [NSString stringWithFormat:@"@property (nonatomic,assign) %@ %@",type,key];

        }
        //每生成属性字符串，就自动换行
        [strM appendFormat:@"\n%@;\n",str];
    }];
    //把拼接好的字符串打印出来，就好了
    NSLog(@"%@",strM);
}
@end
