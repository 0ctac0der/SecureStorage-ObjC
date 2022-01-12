//
//  UIView+UIView_Extension.m
//  SecureStorageObjC


#import "UIView+UIView_Extension.h"

@implementation UIView (UIView_Extension)

-(void)roundCorner{
    self.layer.cornerRadius = 8.0;
    self.clipsToBounds = YES;
}

@end
