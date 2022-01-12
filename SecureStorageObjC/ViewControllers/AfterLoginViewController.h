//
//  AfterLoginViewController.h
//  SecureStorageObjC


#import <UIKit/UIKit.h>
#import "UIView+UIView_Extension.h"
#import "LoginViewController.h"



NS_ASSUME_NONNULL_BEGIN

@interface AfterLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnSaveInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnCardDetails;
@property (weak, nonatomic) IBOutlet UIButton *btnEditCards;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;

- (IBAction)btnSaveCardinfoClicked:(id)sender;
- (IBAction)btnCardDetailsClicked:(id)sender;
- (IBAction)btnEditCardClicked:(id)sender;
- (IBAction)btnLogoutClicked:(id)sender;




@end

NS_ASSUME_NONNULL_END
