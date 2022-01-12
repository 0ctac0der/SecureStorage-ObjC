//
//  CardTableViewCell.h
//  SecureStorageObjC


#import <UIKit/UIKit.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN


@protocol CardTableViewCellDelegate <NSObject>

- (void)editClicked: (Card*)card;
- (void)deleteClicked: (Card *)card;

@end

@interface CardTableViewCell : UITableViewCell

@property (weak,nonatomic) Card* inCard;
@property (nonatomic) BOOL isEditMode;
@property (weak, nonatomic) IBOutlet UILabel *lblCardNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblNameOnCard;
@property (weak, nonatomic) IBOutlet UILabel *lblExpiry;
@property (weak, nonatomic) IBOutlet UILabel *lblCVV;

@property (weak, nonatomic) IBOutlet UIButton *btnEdit;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;
@property (weak, nonatomic) IBOutlet UIStackView *stkViewButtons;

@property (weak, nonatomic) id<CardTableViewCellDelegate> delegate;

- (void) setupWith:(Card *)card;
- (IBAction) btnEditClicked:(id)sender;
- (IBAction) btnDeleteClicked:(id)sender;


@end

NS_ASSUME_NONNULL_END
