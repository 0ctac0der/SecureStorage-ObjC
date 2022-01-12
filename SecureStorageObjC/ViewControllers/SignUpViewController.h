//
//  SignUpViewController.h
//  SecureStorage


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtfUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtfPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtfConfirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;

@property (assign, nonatomic) NSInteger selectedIndex; //= 1

@end

NS_ASSUME_NONNULL_END
