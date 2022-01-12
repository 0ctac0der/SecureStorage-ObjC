//
//  CardTableViewCell.m
//  SecureStorageObjC


#import "CardTableViewCell.h"
#import "UIView+UIView_Extension.h"

@implementation CardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setupWith:(Card *)card{
    self.lblCardNumber.text = card.cardNumber;
    self.lblNameOnCard.text = card.username;
    self.lblExpiry.text = card.expDate;
    self.lblCVV.text = card.cvv;
    
    [self.btnEdit roundCorner];
    [self.btnDelete roundCorner];
    [self.stkViewButtons setHidden:!self.isEditMode];
    
    
}

- (IBAction)btnDeleteClicked:(id)sender {
    if(self.delegate != nil){
        [self.delegate deleteClicked:self.inCard];
    }
}

- (IBAction)btnEditClicked:(id)sender {
    if(self.delegate != nil){
        [self.delegate editClicked:self.inCard];
    }
}
@end
