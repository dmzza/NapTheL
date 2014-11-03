//
//  Trip.h
//  NapTheL
//
//  Created by David Mazza on 4/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "FCModel.h"

@interface Trip : FCModel

@property (nonatomic, copy) NSString *uniqueID;
@property (nonatomic, copy) NSDate *departureTime;
@property (nonatomic) NSString *origin;
@property (nonatomic) NSString *destination;
@property (nonatomic) NSInteger duration;

@end
