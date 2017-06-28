//
//  ZJJPickView.m
//  PickView
//
//  Created by Kop on 2017/5/11.
//  Copyright © 2017年 恒昌. All rights reserved.
//

#import "ZJJPickView.h"

@implementation ZJJPickView
{
    UIView *topView;
    NSInteger zjjIndex;
}

-(id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self createTopView];
         [self createLeftBtn];
        [self createRightBtn];
        [self createPickView:frame];
      
    }
    return self;

}
-(void)createTopView
{
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:topView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, .5)];
    line.backgroundColor = [UIColor grayColor];
    [topView addSubview:line];
    
    
}
-(void)createLeftBtn
{
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(0, 0, 60, 30);
    [_leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [topView addSubview:_leftBtn];
    [_leftBtn addTarget:self action:@selector(leftBtnClicke) forControlEvents:UIControlEventTouchUpInside];

}
-(void)createRightBtn
{
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-60, 0, 60, 30);
    [_rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(buttonRightClicked) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:_rightBtn];
    
}
-(void)createPickView:(CGRect)frame
{
    _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width, 216)];
    // 显示选中框
    _pickView.backgroundColor = [UIColor lightGrayColor];
    _pickView.showsSelectionIndicator=YES;
    _pickView.dataSource = self;
    _pickView.delegate = self;
    [self addSubview:_pickView];

}
#pragma Mark -- UIPickerViewDataSource
// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return [_dataArray count];
    
}

#pragma Mark -- UIPickerViewDelegate
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    if (component == 1) {
        return 40;
    }
    return 180;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        zjjIndex = row;
    }
    
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_dataArray objectAtIndex:row];
    }
    return 0;
}

-(void)buttonRightClicked
{
    if (_determineBlock) {
        _determineBlock(zjjIndex);
    }
    [self close];
}
-(void)leftBtnClicke
{
    [self close];
}
-(void)open
{
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-246, [UIScreen mainScreen].bounds.size.width, 246);
    [UIView commitAnimations];
    
}
-(void)close
{
       
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 246);
    [UIView commitAnimations];

}
-(void)reloadALL
{
    [_pickView reloadAllComponents];
}
@end
