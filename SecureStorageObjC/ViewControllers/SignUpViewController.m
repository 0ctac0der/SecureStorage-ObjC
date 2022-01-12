//
//  SignUpViewController.m
//  SecureStorage

#import "SignUpViewController.h"
#import "UIAlertController+Extension.h"
#import "UIView+UIView_Extension.h"
#import "AfterLoginViewController.h"
#import "UIStoryboard+Extension.h"



@interface SignUpViewController () <UITextFieldDelegate>

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex = 1;
    self.txtfUserName.delegate = self;
    self.txtfPassword.delegate = self;
    self.txtfConfirmPassword.delegate = self;
    
    [self.btnSignUp roundCorner];
    [self.txtfUserName roundCorner];
    [self.txtfConfirmPassword roundCorner];
    [self.txtfPassword roundCorner];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self deregisterFromKeyboardNotifications];
    
}

-(IBAction)btnSignUpClicked: (UIButton *)sender {
    if (self.txtfUserName.text.length == 0) {
        [UIAlertController showAlertWithMessage:@"Please Enter User Name" onViewController:self];
        return;
    }
    if (self.txtfPassword.text.length == 0 || self.txtfConfirmPassword.text.length == 0){
        [UIAlertController showAlertWithMessage: @"Please enter password" onViewController: self];
    }
    if (![self.txtfPassword.text isEqualToString:self.txtfConfirmPassword.text] ) {
        [UIAlertController showAlertWithMessage: @"Please enter matching password" onViewController: self];
        return;
    }
    NSString* userName = [self.txtfUserName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString* userPassword = [self.txtfPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"UserNameForLogin"];
    [[NSUserDefaults standardUserDefaults] setObject:userPassword forKey: [userName stringByAppendingString:@"Password"]];
    NSArray* controllers = [self.navigationController viewControllers];
    NSMutableArray* arrViewController = [[NSMutableArray alloc] initWithArray:controllers];
    [arrViewController removeAllObjects];
    
    AfterLoginViewController* controller = [UIStoryboard getAfterLoginViewController];
    [arrViewController addObject:controller];
    [self.navigationController setViewControllers:arrViewController];
    
    
    
}


- (IBAction) btnSignInClicked: (UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)keyboardWasShown: (NSNotification *)notification {
    CGRect keyboardSize = ((NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey]).CGRectValue;
    self.view.frame = CGRectMake(0, -(keyboardSize.size.height/((CGFloat)self.selectedIndex)), self.view.frame.size.width, self.view.frame.size.height);
}

- (void)keyboardWillBeHidden: (NSNotification *)notification {
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)registerForKeyboardNotifications {
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:NULL];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:NULL];
}

- (void)deregisterFromKeyboardNotifications {
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillShowNotification object:NULL];
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillHideNotification object:NULL];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger tag = textField.tag;
    tag = tag - 1;
    switch (tag) {
        case 4:
            [self.txtfUserName becomeFirstResponder];
            break;
        case 2:
            [self.txtfPassword becomeFirstResponder];
            break;
        case 1:
            [self.txtfConfirmPassword becomeFirstResponder];
            break;
        default:
            [self.view endEditing:YES];
            break;
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.selectedIndex = textField.tag;
    return YES;
}

@end
