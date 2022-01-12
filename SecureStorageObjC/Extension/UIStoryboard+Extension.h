//
//  UIStoryboard+Extension.h
//  SecureStorage


#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "ProUserPaymentViewController.h"
#import "AfterLoginViewController.h"
#import "CardsViewController.h"



NS_ASSUME_NONNULL_BEGIN

@interface UIStoryboard(Extension)

+ (LoginViewController *)getLoginViewController;
+ (SignUpViewController *)getSignUpViewController;
+ (ProUserPaymentViewController *)getProUserPaymentViewController:(BOOL)isEditMode;
+ (AfterLoginViewController *)getAfterLoginViewController;
+ (CardsViewController *)getCardsViewController:(BOOL)isEditMode;

@end

NS_ASSUME_NONNULL_END
