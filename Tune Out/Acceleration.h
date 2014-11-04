//
//  Acceleration.h
//  Tune Out
//
//  Created by David Mazza on 11/4/14.
//  Copyright (c) 2014 Peaking. All rights reserved.
//

#import "FCModel.h"
#import <CoreMotion/CoreMotion.h>

@interface Acceleration : FCModel

@property (nonatomic, copy) NSString *uniqueID;
@property (nonatomic, copy) NSString *tripID;
@property (nonatomic, copy) NSDate *timestamp;
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;

- (id)initWithTrip:(NSString *)aTripId andVector:(CMAcceleration)vector;
- (double)magnitude;

@end
