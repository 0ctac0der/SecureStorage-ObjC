//
//  UIAlertController+Extension.m
//  SecureStorage


#import "UIAlertController+Extension.h"

@implementation UIAlertController(Extension)

+ (void)showAlertWithError: (NSError *)error onViewController: (UIViewController *)viewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SecureStorage" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:NULL];
    [alertController addAction:dismissAction];
    [viewController presentViewController:alertController animated:YES completion:NULL];
}

+ (void)showAlertWithMessage: (NSString *)message onViewController: (UIViewController *)viewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SecureStorage" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:NULL];
    [alertController addAction:dismissAction];
    [viewController presentViewController:alertController animated:YES completion:NULL];
}


+ (void)showAlertWithInputTextWithMessage: (NSString *)message onViewController: (UIViewController *)viewController completion:(void(^)(NSString * __nullable text))completion {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SecureStorage" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = @"";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completion(alertController.textFields.firstObject.text);
    }];
    [alertController addAction:dismissAction];
    [viewController presentViewController:alertController animated:YES completion:NULL];
}

@end
