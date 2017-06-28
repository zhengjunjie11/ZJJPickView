//
//  ViewController.m
//  PickView
//
//  Created by Kop on 2017/5/11.
//  Copyright © 2017年 恒昌. All rights reserved.
//

#import "ViewController.h"
#import "ZJJPickView.h"


@interface ViewController ()
{
    ZJJPickView *pick;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button setTitle:@"打开" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
   pick = [[ZJJPickView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 246)];
    
    pick.dataArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",];
    
    pick.determineBlock = ^(NSInteger index) {
       
        NSLog(@"我被选中了%ld",(long)index);
    };
    [self.view addSubview:pick];
   
   
}
-(void)buttonClicked
{
     [pick open];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
