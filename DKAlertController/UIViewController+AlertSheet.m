//
//  UIViewController+AlertSheet.m
//  DKAlertController
//
//  Created by darkwing90s on 15/12/28.
//  Copyright © 2015年 darkwing. All rights reserved.
//

#import "UIViewController+AlertSheet.h"

@implementation UIViewController (AlertSheet)

#pragma mark - 基本方法
- (void)showAlertWithMessage:(NSString *)message title:(NSString *)title confirmButtonTitle:(NSString*)confirmButtonTitle  cancelButtonTitle:(NSString *)cancelButtonTitle isTextField:(BOOL)isTextField cancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other textField:(void (^)(UITextField *))textField preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    switch (preferredStyle) {
        case 0:
        {
            [self showSheetWithMessage:nil title:nil confirmButtonTitle:confirmButtonTitle cancelButtonTitle:cancelButtonTitle cancelAction:cancel otherAction:other];
            break;
        }
        case 1:
        {
            
            [self showAlertWithMessage:message title:title confirmButtonTitle:confirmButtonTitle cancelButtonTitle:cancelButtonTitle isTextField:isTextField cancelAction:cancel otherAction:other textField:textField];
            
            break;
        }
        default:
            break;
    }
}

#pragma mark - 创建sheetView
- (void)showSheetWithMessage:(NSString *)message title:(NSString *)title confirmButtonTitle:(NSString*)confirmButtonTitle  cancelButtonTitle:(NSString *)cancelButtonTitle cancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other
{
    NSString *cancelButtonTitleString = NSLocalizedString(cancelButtonTitle, nil);
    NSString *destructiveButtonTitleString = NSLocalizedString(confirmButtonTitle, nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitleString style:UIAlertActionStyleCancel handler:cancel];
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitleString style:UIAlertActionStyleDestructive handler:other];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:destructiveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 创建alertView
- (void)showAlertWithMessage:(NSString *)message title:(NSString *)title confirmButtonTitle:(NSString*)confirmButtonTitle  cancelButtonTitle:(NSString *)cancelButtonTitle isTextField:(BOOL)isTextField cancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other textField:(void (^)(UITextField *))textField
{
    NSString *titleString = NSLocalizedString(title, nil);
    NSString *cancelButtonTitleString = NSLocalizedString(cancelButtonTitle, nil);
    NSString *confirmButtonTitleString = NSLocalizedString(confirmButtonTitle, nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleString message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitleString style:UIAlertActionStyleCancel handler:cancel];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmButtonTitleString style:UIAlertActionStyleDefault handler:other];
    
    // Add the actions.
    if (![[self convertNull:cancelButtonTitle] isEqualToString:@""]) {
        [alertController addAction:cancelAction];
    }
    
    if (![[self convertNull:confirmButtonTitle] isEqualToString:@""]) {
        [alertController addAction:confirmAction];
    }
    
    if (isTextField) {
        [alertController addTextFieldWithConfigurationHandler:textField];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showAlertWithMessage:(NSString *)message
{
    [self showAlertWithMessage:message title:@"A Short Title Is Best" confirmButtonTitle:@"OK" cancelButtonTitle:nil isTextField:NO cancelAction:NULL otherAction:NULL textField:NULL preferredStyle:UIAlertControllerStyleAlert];
}

- (void)showAlertWithMessage:(NSString *)message cancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other
{
    [self showAlertWithMessage:message isTextField:NULL cancelAction:cancel otherAction:other textField:NULL];
}

- (void)showAlertWithMessage:(NSString *)message isTextField:(BOOL)isTextField cancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other textField:(void (^)(UITextField *))textField
{
    [self showAlertWithMessage:message title:@"A Short Title Is Best" confirmButtonTitle:@"OK" cancelButtonTitle:@"Cancel" isTextField:isTextField cancelAction:cancel otherAction:other textField:textField preferredStyle:UIAlertControllerStyleAlert];
}

- (void)showSheet
{
    [self showSheetWithCancelAction:nil otherAction:nil];
}

- (void)showSheetWithCancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other
{
    [self showAlertWithMessage:nil title:nil confirmButtonTitle:@"OK" cancelButtonTitle:@"Cancel" isTextField:NO cancelAction:cancel otherAction:other textField:NULL preferredStyle:UIAlertControllerStyleActionSheet];
}

#pragma mark - 判空
-(NSString *)convertNull:(id)obj
{
    if ([obj isEqual:[NSNull null]]) {
        return @"";
    }
    else if([obj isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else if(obj==nil)
    {
        return @"";
    }
    return obj;
}

@end
