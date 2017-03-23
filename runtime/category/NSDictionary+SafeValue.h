//
//  NSDictionary+SafeValue.h
//  runtime
//
//  Created by Code_Hou on 2017/3/23.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeValue)

- (id)safeValueForKey:(NSString *)key;

- (id)objectForKey:(NSString *)key;
@end
