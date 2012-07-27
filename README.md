# restkit-generate

A model generator for iOS RestKit (Rails-like), ARC compliant

## Installation

Install via rubygems

`gem install restkit-generate`

## Sample usage

`$ ./restkit-generate model Business id:NSNumber title:NSString address:NSString created_at:NSDate updated_at:NSDate`

It produces 2 files:
`BaseBusiness.h`

```objective-c
//
//  BaseBusiness.h
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface BaseBusiness : NSObject <NSCoding>

@property (nonatomic, strong) NSNumber *businessId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;

+ (RKObjectMapping *)objectMapping;

@end
```

and `BaseBusiness.m`

```objective-c
//
//  BaseBusiness.m
//

#import "BaseBusiness.h

@implementation BaseBusiness

@synthesize businessId, title, address, createdAt, updatedAt;

+ (RKObjectMapping *)objectMapping
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping mapKeyPathsToAttributes:
	@"id", @"businessId",
	@"title", @"title",
	@"address", @"address",
	@"created_at", @"createdAt",
	@"updated_at", @"updatedAt", nil];
}

- (id)initWithCoder:(NSCoder *)coder
{
	self = [[[self class] alloc] init];
	if (self) {
		self.businessId = [coder decodeObjectForKey:@"businessId"];
		self.title = [coder decodeObjectForKey:@"title"];
		self.address = [coder decodeObjectForKey:@"address"];
		self.createdAt = [coder decodeObjectForKey:@"createdAt"];
		self.updatedAt = [coder decodeObjectForKey:@"updatedAt"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:self.businessId forKey:@"businessId"];
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.address forKey:@"address"];
	[coder encodeObject:self.createdAt forKey:@"createdAt"];
	[coder encodeObject:self.updatedAt forKey:@"updatedAt"];
}

@end
```

Include these files with your project and inherit a `Business` object from `BaseBusiness` where you can implement additional calls/methods. You can rebuild BaseBusiness anytime (in case you add/remove fields, etc.) so your main logic in the Business model won't be affected.

## Copyright

Copyright (c) 2012 Roman Efimov

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
