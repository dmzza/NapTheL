//
//  TripViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>

@interface TripViewController : UIViewController

@property int origin;
@property int destination;
@property (strong, nonatomic) NSArray *durations;
@property (strong, nonatomic) NSDate *arrivalTime;
@property (strong, nonatomic) UILabel *subtextLabel;
@property (strong, nonatomic) UIButton *startButton;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) NSTimer *timer;

@property int timeRemaining;

-(id)initWithOrigin:(NSString *)anOrigin destination:(NSString *)aDestination;

@end
