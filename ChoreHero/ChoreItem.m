//
//  ChoreItem.m
//  ChoreHero
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ChoreItem.h"

@implementation ChoreItem

+ (NSString *)getArchiveURL {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectoryPath = [paths objectAtIndex:0];
	NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"chores"];
	
	return filePath;
}

- (id)initWithCoder:(NSCoder *)decoder {
	if (self = [super init]) {
		self.name = [decoder decodeObjectForKey:@"name"];
		self.choreDescription = [decoder decodeObjectForKey:@"choreDescription"];
		self.status = [decoder decodeObjectForKey:@"status"];
		self.dueDate = [decoder decodeObjectForKey:@"dueDate"];
		self.assignedTo = [decoder decodeObjectForKey:@"assignedTo"];
		self.estimatedTimeToComplete = [decoder decodeObjectForKey:@"estimatedTimeToComplete"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:_name forKey:@"name"];
	[encoder encodeObject:_choreDescription forKey:@"choreDescription"];
	[encoder encodeObject:_status forKey:@"status"];
	[encoder encodeObject:_dueDate forKey:@"dueDate"];
	[encoder encodeObject:_assignedTo forKey:@"assignedTo"];
	[encoder encodeObject:_estimatedTimeToComplete forKey:@"estimatedTimeToComplete"];
}

@end
