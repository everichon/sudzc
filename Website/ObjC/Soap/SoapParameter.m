//
//  SoapParameter.m
//  Giant
//
//  Created by Jason Kichline on 7/13/09.
//  Copyright 2009 andCulture. All rights reserved.
//

#import "SoapParameter.h"
#import "Soap.h"

@implementation SoapParameter

@synthesize name, value, null, xml;

-(void)setValue:(id)valueParam{
	[value autorelease];
	value = [valueParam retain];
	null = (value == nil);
}

-(id)initWithValue:(id)valueParam forName: (NSString*) nameValue {
	if(self = [super init]) {
		self.name = nameValue;
		self.value = valueParam;
	}
	return self;
}

-(NSString*)xml{
	if(null) {
		return [NSString stringWithFormat:@"<%@ xsi:nil=\"true\"/>", name];
	} else {
		return [NSString stringWithFormat:@"<%@>%@</%@>", name, [Soap serialize: value], name];
	}
}

@end