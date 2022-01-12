//
//  ProUserPaymentViewController.h
//  SecureStorage


#import <UIKit/UIKit.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProUserPaymentViewController : UIViewController

@property (weak, nonatomic) Card *existingCard;
@property (nonatomic) BOOL isEditMode;
@property (weak, nonatomic) IBOutlet UILabel *lblHeaderTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtFCardNmber;
@property (weak, nonatomic) IBOutlet UITextField *txtFExpiry;
@property (weak, nonatomic) IBOutlet UITextField *txtFCVV;
@property (weak, nonatomic) IBOutlet UITextField *txtFNameOnCard;
@property (weak, nonatomic) IBOutlet UIButton *btnPayment;

@end

NS_ASSUME_NONNULL_END
