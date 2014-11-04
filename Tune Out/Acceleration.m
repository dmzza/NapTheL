//
//  Acceleration.m
//  Tune Out
//
//  Created by David Mazza on 11/4/14.
//  Copyright (c) 2014 Peaking. All rights reserved.
//

#import "Acceleration.h"
#include "math.h"

@implementation Acceleration

- (id)initWithTrip:(NSString *)aTripId andVector:(CMAcceleration)vector
{
    self = [super init];
    if (self) {
        self.tripID = aTripId;
        self.timestamp = [[NSDate alloc] init];
        self.x = vector.x;
        self.y = vector.y;
        self.z = vector.z;
    }
    return self;
}

- (double)magnitude
{
    return sqrt(pow(_x,2) + pow(_y,2) + pow(_z,2));
}

@end
