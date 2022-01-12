//
//  NSString+Extension.m
//  SecureStorage


#import "NSString+Extension.h"

@implementation NSString(Extension)

- (nullable NSDate *)getServerFormattedDate {
    NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss ZZ";
    return [formatter dateFromString:self];
}

@end
