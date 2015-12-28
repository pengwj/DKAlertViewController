//
//  UIViewController+AlertSheet.h
//  DKAlertController
//
//  Created by darkwing90s on 15/12/28.
//  Copyright © 2015年 darkwing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertSheet)

- (void)showAlertWithMessage:(NSString *)message;

- (void)showAlertWithMessage:(NSString *)message cancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other;

- (void)showAlertWithMessage:(NSString *)message isTextField:(BOOL)isTextField cancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other textField:(void (^)(UITextField *))textField;

- (void)showSheet;

- (void)showSheetWithCancelAction:(void (^)(UIAlertAction *))cancel otherAction:(void (^)(UIAlertAction *))other;

@end
