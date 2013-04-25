//
//  Trip.h
//  NapTheL
//
//  Created by David Mazza on 4/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trip : NSObject

@property (strong, nonatomic) NSString *origin;
@property (strong, nonatomic) NSString *destination;
@property (strong, nonatomic) NSDate *departureTime;
@property int duration;

@end
