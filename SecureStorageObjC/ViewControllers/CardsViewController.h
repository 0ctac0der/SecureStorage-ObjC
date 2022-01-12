//
//  CardsViewController.h
//  SecureStorageObjC

#import <UIKit/UIKit.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardsViewController : UIViewController

@property (nonatomic) BOOL isEditMode;
@property (weak, nonatomic) IBOutlet UITableView *tableViewObj;
@property (strong, nonatomic) NSMutableArray<Card *> *arrDataSource;

@end

NS_ASSUME_NONNULL_END
