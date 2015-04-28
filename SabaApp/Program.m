//
//  Program.m
//  SabaApp
//
//  Created by Syed Naqvi on 4/25/15.
//  Copyright (c) 2015 Naqvi. All rights reserved.
//

#import "Program.h"

@implementation Program

-(id)initWithArray:(NSArray * )array{
	self = [super init];
	if(self){
		
	}
	
	return self;
}

-(id)initWithDictionary:(NSDictionary * )dictionary{
	self = [super init];
	if(self){
		
		//[dateFormat setDateFormat: @"yyyy-MM-dd HH:mm:ss zzz"];
		
		self.lastUpated = [NSDateFormatter localizedStringFromDate:[NSDate date]
															  dateStyle:NSDateFormatterShortStyle
															  timeStyle:NSDateFormatterFullStyle];
		self.title				= dictionary[@"title"];
		self.programDescription = dictionary[@"description"];
		self.imageUrl			= dictionary[@"imageurl"];
		self.imageHeight		= [dictionary[@"imageheight"] intValue];
		self.imageWidth			= [dictionary[@"imagewidth"] intValue];
		//[self display];
	}
	
	return self;
}

-(void) display{
	NSLog(@"title: %@", self.title);
	NSLog(@"programDescription: %@", self.programDescription);
	NSLog(@"imageUrl: %@", self.imageUrl);
	NSLog(@"imageHeight: %ld", self.imageHeight);
	NSLog(@"imageWidth: %ld", self.imageWidth);
}

+(Program*) fromDictionary:(NSDictionary * )dictionary{
	
	return [[Program alloc] initWithDictionary:dictionary];
}

+(NSArray*) fromArray:(NSArray * )array{
	NSMutableArray *programs = [[NSMutableArray alloc]init];
	for (NSDictionary* value in array) {
		Program *program = [[Program alloc] initWithDictionary:value];
		[programs addObject:program];
		//NSLog(@"title: %@", program.title);
	}
	
	return programs;
}

@end