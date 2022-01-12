//
//  LoginViewController.m


#import "LoginViewController.h"
#import "UIAlertController+Extension.h"
#import "UIStoryboard+Extension.h"
#import "UIView+UIView_Extension.h"

#define configurationPassword   @"1234"

@interface LoginViewController () <UITextFieldDelegate>

@end


@implementation LoginViewController

//Life Cycle Functions
- (void)viewDidLoad {
    [super viewDidLoad];

    self.txtFEmail.delegate = self;
    self.txtFPassword.delegate = self;
    [self.txtFEmail roundCorner];
    [self.txtFPassword roundCorner];
    [self.btnLogin roundCorner];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self deregisterFromKeyboardNotifications];
}



- (IBAction)btnLoginClicked: (id)sender {
   
    NSString *email = self.txtFEmail.text;
    NSString *password = self.txtFPassword.text;
    if (email.length == 0) {
        [UIAlertController showAlertWithMessage:@"Please enter username" onViewController: self];
        return;
    }
    if (password.length == 0) {
        [UIAlertController showAlertWithMessage:@"Please enter password" onViewController: self];
        return;
    }
    [self loginWithemail:email andPassword:password];
}


- (IBAction)btnSignUpNowClicked: (id)sender {
    SignUpViewController *vc = [UIStoryboard getSignUpViewController];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)loginWithemail: (NSString *)email andPassword : (NSString *)password {
    NSString* userName = self.txtFEmail.text;
    NSString* key = [userName stringByAppendingString:@"Password"];
    NSString* oldPassword = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if([oldPassword isEqualToString:self.txtFPassword.text]){
        
        NSArray* controllers = [self.navigationController viewControllers];
        NSMutableArray* arrViewController = [[NSMutableArray alloc] initWithArray:controllers];
        [arrViewController removeAllObjects];
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:[userName stringByAppendingString:@"Password"]];
        AfterLoginViewController* controller = [UIStoryboard getAfterLoginViewController];
        [arrViewController addObject:controller];
        [self.navigationController setViewControllers:arrViewController];
        
    } else {
        [UIAlertController showAlertWithMessage:@"Please check username and password" onViewController: self];
    }
}

- (void)keyboardWasShown: (NSNotification *)notification {
    CGRect keyboardSize = ((NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey]).CGRectValue;
    self.view.frame = CGRectMake(0, -(keyboardSize.size.height/4), self.view.frame.size.width, self.view.frame.size.height);
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
    [self.view endEditing:YES];
    return YES;
}

@end
