//
//  UIAlertController+Extension.h
//  SecureStorage

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController(Extension)

+ (void)showAlertWithError: (NSError *)error onViewController: (UIViewController *)viewController;
+ (void)showAlertWithMessage: (NSString *)message onViewController: (UIViewController *)viewController;
+ (void)showAlertWithInputTextWithMessage: (NSString *)message onViewController: (UIViewController *)viewController completion:(void(^)(NSString * __nullable text))completion;

@end

NS_ASSUME_NONNULL_END
