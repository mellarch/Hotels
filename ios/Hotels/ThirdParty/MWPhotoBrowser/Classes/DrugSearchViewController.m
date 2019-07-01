//
//  DrugSearchViewController.m
//  heletalk-patient
//
//  Created by minghanzhao on 15/8/9.
//  Copyright (c) 2015年 heletech. All rights reserved.
//

#import "DrugSearchViewController.h"
#define W [[UIScreen mainScreen] bounds].size.width
#define H [[UIScreen mainScreen] bounds].size.height
@interface DrugSearchViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) UITextField *textField;
@end

@implementation DrugSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"药品搜搜";
    [self.view setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0]];
   
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 75, W-40, 30)];
    [_textField setBackgroundColor:[UIColor whiteColor]];
    _textField.layer.cornerRadius = 5.0;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    _textField.returnKeyType=UIReturnKeyGoogle;
    _textField.placeholder = @"请输入药品名称";
    _textField.font = [UIFont fontWithName:@"Helvetica" size:14];
    UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.png"]];
    _textField.rightView=image;
    _textField.rightViewMode = UITextFieldViewModeAlways;
 //   [_textField rightViewRectForBounds:CGRectMake(10, 1, 30, 30)];
    [self.view addSubview:_textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    //返回一个BOOL值，指定是否循序文本字段开始编辑
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //开始编辑时触发，文本字段将成为first responder
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    //返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出first responder
    //要想在用户结束编辑时阻止文本字段消失，可以返回NO
    //这对一些文本字段必须始终保持活跃状态的程序很有用，比如即时消息
    
    return NO;
}

- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //当用户使用自动更正功能，把输入的文字修改为推荐的文字时，就会调用这个方法。
    //这对于想要加入撤销选项的应用程序特别有用
    //可以跟踪字段内所做的最后一次修改，也可以对所有编辑做日志记录,用作审计用途。
    //要防止文字被改变可以返回NO
    //这个方法的参数中有一个NSRange对象，指明了被改变文字的位置，建议修改的文本也在其中
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    //返回一个BOOL值指明是否允许根据用户请求清除内容
    //可以设置在特定条件下才允许清除内容
    
    return YES;
}


@end
