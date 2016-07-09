//
//  GetPlist.m
//  [GCDDemo]
//
//  Created by 刘隆昌 on 14-12-29.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import "GetPlist.h"

@implementation GetPlist



+(NSString*)getPlist{
    
    static NSString * plistPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSFileManager * fm = [NSFileManager defaultManager];
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString * filePath = [paths objectAtIndex:0];
        plistPath = [filePath stringByAppendingPathComponent:@"test.plist"];
        
        NSLog(@"plist文件保存路径:%@",plistPath);
        
        [fm createFileAtPath:plistPath contents:nil attributes:nil];
        
        
    });
    
    return plistPath;
}





@end
