//
//  UIImageView+DispatchLoad.m
//  [GCDDemo]
//
//  Created by 刘隆昌 on 14-12-29.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import "UIImageView+DispatchLoad.h"

@implementation UIImageView (DispatchLoad)


-(void)setImageFromUrl:(NSString*)urlString{
    
    
    [self setImageFromUrl:urlString completion:NULL];
    
}


-(void)setImageFromUrl:(NSString*)urlString completion:(void(^)(void))completion{
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        UIImage * avatarImage = nil;
        NSURL * url = [NSURL URLWithString:urlString];
        NSData * responseData = [NSData dataWithContentsOfURL:url];
        avatarImage = [UIImage imageWithData:responseData];
        
        
        if (avatarImage) {
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                self.image = avatarImage;
                
            });
            
            
            
            
            
            
        }else{
            
            NSLog(@"----impossible download:%@",urlString);
            
        }
        
        
        
        
        
    });
    
    
    
    
    
    
}


@end
