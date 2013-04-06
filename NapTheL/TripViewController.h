//
//  TripViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripViewController : UIViewController

@property NSInteger *origin;
@property NSInteger *destination;
@property (strong, nonatomic) NSArray *durations;

-(id)initWithOrigin:(NSString *)anOrigin destination:(NSString *)aDestination;

@end
