//
//  CardsViewController.m
//  SecureStorageObjC


#import "CardsViewController.h"
#import "GeneralUtils.h"
#import "CardTableViewCell.h"
#import "Card.h"
#import "UIStoryboard+Extension.h"


@interface CardsViewController  () <UITableViewDataSource, UITableViewDelegate,CardTableViewCellDelegate>

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrDataSource = [GeneralUtils getAllCards];
    [self.tableViewObj setDelegate:self];
    [self.tableViewObj setDataSource:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CardTableViewCell *cell = (CardTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CardTableViewCell" forIndexPath:indexPath];
    Card *card = self.arrDataSource[indexPath.row];
    cell.inCard = card;
    cell.delegate = self;
    cell.isEditMode = self.isEditMode;
    [cell setupWith:card];
    return cell;
}
- (void)editClicked: (Card*)card{
    ProUserPaymentViewController* controller = [UIStoryboard getProUserPaymentViewController:YES];
    controller.existingCard = card;
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)deleteClicked: (Card *)card {
    [GeneralUtils remove:card];
    self.arrDataSource = [GeneralUtils getAllCards];
    [self.tableViewObj reloadData];
}


@end
