//
//  ZJJPickView.h
//  PickView
//
//  Created by Kop on 2017/5/11.
//  Copyright © 2017年 恒昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJJPickView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic,strong) UIPickerView *pickView;

@property (nonatomic,strong) NSArray *dataArray;//数据源

@property (nonatomic,strong) UIButton *leftBtn;

@property (nonatomic,strong) UIButton *rightBtn;




@property (nonatomic,copy) void(^determineBlock)(NSInteger index);


-(void)reloadALL;//刷新数据
//打开菜单
-(void)open;

-(void)close;
@end
