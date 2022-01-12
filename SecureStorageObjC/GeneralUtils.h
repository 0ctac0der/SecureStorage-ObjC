//
//  GeneralUtils.h
//  SecureStorageObjC

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeneralUtils : NSObject

+(void)save: (Card*) card;
+(void)remove: (Card*) card;
+(NSMutableArray<Card *> *)getAllCards;

@end

NS_ASSUME_NONNULL_END
