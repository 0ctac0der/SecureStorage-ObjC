//
//  LoginViewController.h
//  SecureStorage


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtFEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUpNow;

@end

NS_ASSUME_NONNULL_END
