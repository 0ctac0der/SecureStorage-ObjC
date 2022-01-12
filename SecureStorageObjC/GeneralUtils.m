//
//  GeneralUtils.m
//  SecureStorageObjC

#import "GeneralUtils.h"
#import "FWEncryptorAES.h"

@implementation GeneralUtils

+(void)remove: (Card*) card {
    NSString* userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserNameForLogin"];
    NSString* key = [userName stringByAppendingString:@"Cards"];
    NSData* enDataFromLocal = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    NSData * cleanData = [FWEncryptorAES decrypt:enDataFromLocal];
    
    NSString * jsonString = [[NSString alloc] initWithData : cleanData
                                                   encoding: NSUTF8StringEncoding];
    
    NSData* data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *values = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray* arrCards = [[NSMutableArray alloc] initWithArray:values];
    
    NSInteger index = 0;
    NSInteger matchedIndex = -1;
    for(JSON *cardJSON in values){
        Card* oldCard = [[Card alloc] initWithJSON:cardJSON];
        if([oldCard.cardNumber isEqualToString:card.cardNumber]){
            matchedIndex = index;
        }
        index = index + 1;
    }
    if (matchedIndex > -1) {
        [arrCards removeObjectAtIndex:matchedIndex];
    }
    NSError* error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrCards options:NSJSONWritingPrettyPrinted error:&error];
    NSString *newJsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    NSData *enData = [newJsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedDat = [FWEncryptorAES encrypt:enData];
    [[NSUserDefaults standardUserDefaults] setObject:encryptedDat forKey:key];
    //[[NSUserDefaults standardUserDefaults] setObject:newJsonString forKey:key];
}
+(void)save: (Card*) card{
    NSString* userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserNameForLogin"];
    NSString* key = [userName stringByAppendingString:@"Cards"];
    NSData* enDataFromLocal = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    NSData * cleanData = [FWEncryptorAES decrypt:enDataFromLocal];
    
    NSString * jsonString = [[NSString alloc] initWithData : cleanData
                                                   encoding: NSUTF8StringEncoding];
    
    NSMutableArray* arrCards = [[NSMutableArray alloc] init];
    NSArray *values = nil;
    if(jsonString != nil){
        NSData* data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        values = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for(JSON* value in values){
            Card * existing = [[Card alloc] initWithJSON:value];
            [arrCards addObject:existing];
        }
    }
    
    NSInteger index = 0;
    NSInteger matchedIndex = -1;
    for(JSON *cardJSON in values){
        Card* oldCard = [[Card alloc] initWithJSON:cardJSON];
        if([oldCard.cardNumber isEqualToString:card.cardNumber]){
            matchedIndex = index;
        }
        index = index + 1;
    }
    if (matchedIndex > -1) {
        [arrCards replaceObjectAtIndex:matchedIndex withObject:card];
    } else {
        [arrCards addObject:card];
    }
    NSMutableArray* savingArray = [[NSMutableArray alloc] init];
    for(Card* cr in arrCards){
        [savingArray addObject:[cr toJSON]];
    }
    NSError* error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:savingArray options:NSJSONWritingPrettyPrinted error:&error];
    NSString *newJsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSData *enData = [newJsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedDat = [FWEncryptorAES encrypt:enData];
    [[NSUserDefaults standardUserDefaults] setObject:encryptedDat forKey:key];
    
    //[[NSUserDefaults standardUserDefaults] setObject:newJsonString forKey:key];
}
+(NSMutableArray<Card *> *)getAllCards{
    NSString* userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserNameForLogin"];
    NSString* key = [userName stringByAppendingString:@"Cards"];
    NSData* enDataFromLocal = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    NSData * cleanData = [FWEncryptorAES decrypt:enDataFromLocal];
    
    NSString * jsonString = [[NSString alloc] initWithData : cleanData
                                                   encoding: NSUTF8StringEncoding];
    
    NSData* data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *values = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray* arrCards = [[NSMutableArray alloc] init];
    
    for(JSON *cardJSON in values){
        Card* card = [[Card alloc] initWithJSON:cardJSON];
        [arrCards addObject:card];
        
    }
    return arrCards;
}
@end
