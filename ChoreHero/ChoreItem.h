//
//  ChoreItem.h
//  ChoreHero
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChoreItem : NSObject


@property NSString *name;
@property NSString *choreDescription;

// @property NSPicView *image;
@property NSString *status;
@property NSDate *dueDate;
@property NSString *assignedTo;
@property NSNumber *estimatedTimeToComplete;

@end
