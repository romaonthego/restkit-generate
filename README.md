# restkit-generate

A model generator for iOS RestKit (Rails-like), ARC compliant

## Sample usage

`$ ./restkit-generate.rb model Business id:NSNumber address:NSString created_at:NSDate updated_at:NSDate`

It produces 2 files:
`Business.h`

```objective-c
//
//  Business.h

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
					 
@interface Business : NSObject

@property (nonatomic, strong) NSNumber *businessId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;

+ (RKObjectMapping *)getMapping;

@end
```

and `Business.m`

```objective-c
//
//  Business.m

#import "Business.h"

@implementation Business

@synthesize businessId, address, createdAt, updatedAt;

+ (RKObjectMapping *)getMapping 
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[Business class]];
	[mapping mapKeyPathsToAttributes:
	 @"id", @"businessId",
	 @"address", @"address",
	 @"created_at", @"createdAt",
	 @"updated_at", @"updatedAt", nil];
	return mapping;
}

@end
```

## Copyright

Copyright (c) 2012 Roman Efimov