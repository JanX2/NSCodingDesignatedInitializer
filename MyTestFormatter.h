//
//  MyTestFormatter.h
//  NSCodingDesignatedInitializer
//
//  Created by Jan on 14.06.15.
//  Copyright © 2015 Jan Weiß. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTestFormatter : NSFormatter <NSCopying, NSCoding, NSSecureCoding>

@property (nonatomic, copy) NSString *testString;

- (instancetype)initWithTestString:(NSString *)testString NS_DESIGNATED_INITIALIZER;

@end
