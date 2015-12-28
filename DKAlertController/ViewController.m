//
//  ViewController.m
//  DKAlertController
//
//  Created by darkwing90s on 15/12/28.
//  Copyright © 2015年 darkwing. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AlertSheet.h"

#define UIWIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self makeUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"showAlertWithMessage" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, UIWIDTH, 40);
    [btn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"showAlertWithAction" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(0, 150, UIWIDTH, 40);
    [btn2 addTarget:self action:@selector(showAlertWithAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:@"showAlertWithTextField" forState:UIControlStateNormal];
    btn3.frame = CGRectMake(0, 200, UIWIDTH, 40);
    [btn3 addTarget:self action:@selector(showAlertWithTextField) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setTitle:@"showSheetWithAction" forState:UIControlStateNormal];
    btn4.frame = CGRectMake(0, 250, UIWIDTH, 40);
    [btn4 addTarget:self action:@selector(showSheetWithAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
}

- (void)showAlert
{
    [self showAlertWithMessage:@"警告"];
}

- (void)showAlertWithAction
{
    [self showAlertWithMessage:@"传递点击事件" cancelAction:^(UIAlertAction *cancelAction){
        
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        
    } otherAction:^(UIAlertAction *otherAction){
        
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
        
    }];
}

- (void)showAlertWithTextField
{
    [self showAlertWithMessage:@"带输入框" isTextField:YES cancelAction:^(UIAlertAction *cancelAction){
        
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        
    } otherAction:^(UIAlertAction *otherAction){
        
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
        
    } textField:^(UITextField *textField){
        
        
        
    }];
}

- (void)showSheetWithAction
{
    [self showSheetWithCancelAction:^(UIAlertAction *cancelAction){
        
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        
    } otherAction:^(UIAlertAction *otherAction){
        
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
        
    }];
}


@end
