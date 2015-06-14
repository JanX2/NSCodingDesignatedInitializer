//
//  MyTestFormatter.m
//  NSCodingDesignatedInitializer
//
//  Created by Jan on 14.06.15.
//  Copyright © 2015 Jan Weiß. All rights reserved.
//

#import "MyTestFormatter.h"

static NSString	* const MyTestString    = @"MyTestString";

#define ENABLE_WORKAROUND	0

#if ENABLE_WORKAROUND
@interface NSFormatter ()
- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)decoder NS_DESIGNATED_INITIALIZER;
@end

@interface MyTestFormatter ()
- (instancetype)initWithCoder:(NSCoder *)decoder NS_DESIGNATED_INITIALIZER;
@end
#endif

@implementation MyTestFormatter

+ (BOOL)supportsSecureCoding
{
	return YES;
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
	self = [super initWithCoder:decoder];
	if (self == nil) {return nil;}
	
	_testString = [decoder decodeObjectOfClass:[NSString class]
										forKey:MyTestString];

	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[super encodeWithCoder:encoder];

	[encoder encodeObject:_testString forKey:MyTestString];
}

- (instancetype)init
{
	return [self initWithTestString:nil];
}

- (instancetype)initWithTestString:(NSString *)testString;
{
	self = [super init];
	
	if (self) {
		_testString = testString;
	}
	
	return self;
}

@end
