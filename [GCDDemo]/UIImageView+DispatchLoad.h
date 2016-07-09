//
//  UIImageView+DispatchLoad.h
//  [GCDDemo]
//
//  Created by 刘隆昌 on 14-12-29.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DispatchLoad)

-(void)setImageFromUrl:(NSString*)urlString;
-(void)setImageFromUrl:(NSString*)urlString completion:(void(^)(void))completion;



@end
