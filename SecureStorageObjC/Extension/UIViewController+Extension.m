//
//  UIViewController+Extension.m
//  SecureStorage


#import "UIViewController+Extension.h"
#import "NSObject+Extension.h"

@implementation UIViewController(Extension)

+ (NSString *)storyboardID {
    return [self className];
}

@end
