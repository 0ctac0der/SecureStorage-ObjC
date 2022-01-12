//
//  ProUserPaymentViewController.m
//  SecureStorage

#import "ProUserPaymentViewController.h"
#import "UIAlertController+Extension.h"
#import "UIView+UIView_Extension.h"
#import "GeneralUtils.h"

@interface ProUserPaymentViewController () <UITextFieldDelegate>

@end

@implementation ProUserPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTapGesture];
    
    self.txtFCVV.text = self.existingCard.cvv;
    self.txtFExpiry.text = self.existingCard.expDate;
    self.txtFCardNmber.text = self.existingCard.cardNumber;
    self.txtFNameOnCard.text = self.existingCard.username;
    
    
    self.txtFCardNmber.delegate = self;
    self.txtFExpiry.delegate = self;
    self.txtFCVV.delegate = self;
    self.txtFNameOnCard.delegate = self;

    [self.btnPayment roundCorner];
    [self.txtFCVV roundCorner];
    [self.txtFExpiry roundCorner];
    [self.txtFCardNmber roundCorner];
    [self.txtFNameOnCard roundCorner];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self deregisterFromKeyboardNotifications];
}

- (IBAction)btnPaymentTapped: (id)sender {
    
    if (self.txtFCardNmber.text.length != 16) {
        [UIAlertController showAlertWithMessage:@"Please enter a valid card number" onViewController:self];
        return;
    }
    if (self.txtFCardNmber.text.length == 16) {
        int64_t number = [self.txtFCardNmber.text longLongValue];
        if (number < 1000000000000000) {
            [UIAlertController showAlertWithMessage: @"Please enter a valid card number" onViewController: self];
            return;
        }
    }
    if (self.txtFNameOnCard.text.length < 2) {
        [UIAlertController showAlertWithMessage: @"Please enter a valid name" onViewController: self];
        return;
    }
    if (self.txtFCVV.text.length != 3) {
        [UIAlertController showAlertWithMessage: @"Please enter a valid cvv" onViewController: self];
        return;
    }
    if (self.txtFCVV.text.length == 3) {
        int number = [self.txtFCVV.text intValue];
        if (number <= 0 || number > 999) {
            [UIAlertController showAlertWithMessage: @"Please enter a valid cvv" onViewController: self];
            return;
        }
    }
    if (self.txtFExpiry.text.length  != 5) {
        [UIAlertController showAlertWithMessage: @"Please enter a valid expiry" onViewController: self];
        return;
    }
    if ([self getExpiryDateWithString:self.txtFExpiry.text] == NULL) {
        [UIAlertController showAlertWithMessage: @"Please enter a valid expiry" onViewController: self];
        return;
    }
    
    Card* card = [[Card alloc] init];
    card.username = self.txtFNameOnCard.text;
    card.expDate = self.txtFExpiry.text;
    card.cvv = self.txtFCVV.text;
    card.cardNumber = self.txtFCardNmber.text;
    [GeneralUtils save:card];
    
    [UIAlertController showAlertWithMessage: @"Card updated successfully!" onViewController: self];

    
}

-(NSDate *)getExpiryDateWithString: (NSString *)dateStr {
    if (dateStr == NULL || dateStr.length == 0) {
        return NULL;
    }
    NSString *dateString = @"01/";
    dateString = [dateString stringByAppendingString:dateStr];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat  = @"dd/MM/YY";
    return [dateFormatter dateFromString:dateString];
}

- (void)addTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(done)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)done {
    [self.view endEditing:YES];
}

- (void)keyboardWasShown: (NSNotification *)notification {
    CGRect keyboardSize = ((NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey]).CGRectValue;
    self.view.frame = CGRectMake(0, -(keyboardSize.size.height/1.5), self.view.frame.size.width, self.view.frame.size.height);
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
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) {
        if (textField == self.txtFCVV) {
            if (textField.text.length == 3) {
                textField.text = [textField.text substringToIndex:2];// String (textField.text!.prefix(2))
            }
        }
        return YES;
    } else {
        if (textField == self.txtFCardNmber) {
            if (textField.text.length < 16) { return YES; } else { return NO; }
        } else if (textField == self.txtFNameOnCard) {
            if (textField.text.length < 30) { return YES; } else { return NO; }
        } else if (textField == self.txtFExpiry) {
            if (textField.text.length < 5) {
                if (textField.text.length == 2) {
                    textField.text = [textField.text stringByAppendingString:@"/"];
                }
                return YES;
            } else { return NO; }
        } else if (textField == self.txtFCVV) {
            if (textField.text.length < 3) { return YES;} else {return NO;}
        }
    }
    return YES;
}

@end
