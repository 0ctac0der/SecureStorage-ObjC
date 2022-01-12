//
//  AfterLoginViewController.m
//  SecureStorageObjC

#import "AfterLoginViewController.h"
#import "UIStoryboard+Extension.h"

@interface AfterLoginViewController ()

@end

@implementation AfterLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btnLogout roundCorner];
    [self.btnSaveInfo roundCorner];
    [self.btnEditCards roundCorner];
    [self.btnCardDetails roundCorner];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnLogoutClicked:(id)sender {
    NSArray* controllers = [self.navigationController viewControllers];
    NSMutableArray* arrViewController = [[NSMutableArray alloc] initWithArray:controllers];
    [arrViewController removeAllObjects];
    
    LoginViewController* controller = [UIStoryboard getLoginViewController];
    [arrViewController addObject:controller];
    [self.navigationController setViewControllers:arrViewController];
}

- (IBAction)btnEditCardClicked:(id)sender {
    CardsViewController* controller = [UIStoryboard getCardsViewController:YES];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnCardDetailsClicked:(id)sender {
    CardsViewController* controller = [UIStoryboard getCardsViewController:NO];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnSaveCardinfoClicked:(id)sender {
    ProUserPaymentViewController* controller = [UIStoryboard getProUserPaymentViewController:NO];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
