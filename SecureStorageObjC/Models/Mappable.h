//
//  Mappable.h
//  Abstractors
//
//  Created by Anand Kumar on 09/06/19.
//  Copyright © 2019 Harry. All rights reserved.
//

typedef NSDictionary<NSString *, id> JSON;

@protocol Mappable <NSObject>

- (id)initWithJSON: (JSON *)JSON;
- (JSON *)toJSON;

@end
