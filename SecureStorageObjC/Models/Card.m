//
//  Card.m
//  SecureStorage


#import "Card.h"
#import "NSString+Extension.h"

@implementation Card

- (id)initWithJSON:(JSON *)JSON {
    self = [super init];
    if (self) {
        self.username = JSON[@"username"];
        self.cvv = JSON[@"cvv"];
        self.expDate = JSON[@"expDate"];
        self.cardNumber = JSON[@"cardNumber"];
        
    }
    return self;
}

- (JSON *)toJSON {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.username forKey: @"username"];
    [dict setValue:self.cvv forKey: @"cvv"];
    [dict setValue:self.expDate forKey: @"expDate"];
    [dict setValue:self.cardNumber forKey: @"cardNumber"];
    return dict;
}


@end
