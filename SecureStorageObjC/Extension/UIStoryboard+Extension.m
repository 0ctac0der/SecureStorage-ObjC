//
//  UIStoryboard+Extension.m
//  SecureStorage


#import "UIStoryboard+Extension.h"

#import "UIViewController+Extension.h"

#define Main [UIStoryboard storyboardWithName:@"Main" bundle:NULL]

@implementation UIStoryboard(Extension)

+ (AfterLoginViewController *)getAfterLoginViewController {
    return [Main instantiateViewControllerWithIdentifier:[AfterLoginViewController storyboardID]];
}
+ (LoginViewController *)getLoginViewController {
    return [Main instantiateViewControllerWithIdentifier:[LoginViewController storyboardID]];
}
+ (SignUpViewController *)getSignUpViewController {
    return [Main instantiateViewControllerWithIdentifier:[SignUpViewController storyboardID]];
}

+ (ProUserPaymentViewController *)getProUserPaymentViewController:(BOOL)isEditMode {
    ProUserPaymentViewController* controller = [Main instantiateViewControllerWithIdentifier:[ProUserPaymentViewController storyboardID]];
    controller.isEditMode = isEditMode;
    return controller;
}
+ (CardsViewController *)getCardsViewController:(BOOL)isEditMode{
    CardsViewController* controller = [Main instantiateViewControllerWithIdentifier:[CardsViewController storyboardID]];
    controller.isEditMode = isEditMode;
    return controller;
}

@end
