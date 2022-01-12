//
//  NSObject+Extension.m
//  SecureStorage


#import "NSObject+Extension.h"

@implementation NSObject(Extension)

- (NSString *)className {
    return NSStringFromClass([self class]);
}

+ (NSString *)className {
    return NSStringFromClass([self class]);
}

@end
