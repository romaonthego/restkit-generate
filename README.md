# restkit-generate

A model generator for iOS RestKit (Rails-like), ARC compliant

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
	self = [[BaseBusiness alloc] init];
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
