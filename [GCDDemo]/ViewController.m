//
//  ViewController.m
//  [GCDDemo]
//
//  Created by 刘隆昌 on 14-12-29.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)loadView{
    
    self.view = [[[NSBundle mainBundle] loadNibNamed:@"ViewController" owner:self options:nil] lastObject];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // self.imagView.layer.cornerRadius = 25;
   // self.imagView.layer.masksToBounds = YES;
    

    
    ViewController * vc = self;
    [self.imagView setImageFromUrl:IMAGEURL completion:^{
       
        NSLog(@"图片加载完毕");
        
        NSString * plistPath = [GetPlist getPlist];
        
        NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:@"zhangsan",@"name",@"lisi",@"name",nil];
        [dic writeToFile:plistPath atomically:YES];
        
        
        NSDictionary * dic2 = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSArray * arr =[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
        [arr writeToFile:plistPath atomically:YES];
        NSArray * arr1 = [NSArray arrayWithContentsOfFile:plistPath];
        
        
        
        
        
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,0,YES);
        NSString * filePat = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"pic_%d.png",1]];
        
        [UIImagePNGRepresentation(vc.imagView.image) writeToFile:filePat atomically:YES];
        
        
        //在plist中保存路径
        NSMutableDictionary * info = [[NSMutableDictionary alloc]initWithObjectsAndKeys:filePat,@"img", nil];
        [info writeToFile:plistPath atomically:YES];
        
        
        NSLog(@"]]]][[[[ %@",plistPath);
        
    }];
    
    self.imagView.layer.masksToBounds = YES;
    self.imagView.layer.cornerRadius = 25;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
