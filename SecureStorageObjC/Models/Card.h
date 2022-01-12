//
//  User.h
//  SecureStorage

#import <Foundation/Foundation.h>
#import "Mappable.h"

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject <Mappable>

@property (strong, nonatomic) NSString *username;
@property (assign, nonatomic) NSString *cvv;
@property (strong, nonatomic) NSString *expDate;
@property (strong, nonatomic) NSString *cardNumber;


@end

NS_ASSUME_NONNULL_END
