//
//  TripViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>
#import "StopTableViewController.h"
#import "Trip.h"
#import "DACircularProgressView.h"

@interface TripViewController : UIViewController <StopTableViewControllerDelegate>

@property int origin;
@property int destination;
@property (strong, nonatomic) NSArray *durations;
@property (strong, nonatomic) NSDate *arrivalTime;
@property (strong, nonatomic) UIButton *originButton;
@property (strong, nonatomic) UIButton *destinationButton;
@property (strong, nonatomic) UIButton *swapButton;
@property (strong, nonatomic) UILabel *subtextLabel;
@property (strong, nonatomic) IBOutlet UIView *clockView;
@property (strong, nonatomic) DACircularProgressView *tripProgress;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) Trip *trip;

@property int timeRemaining;

// STATES
@property BOOL hasStarted;
@property BOOL isPaused;
@property BOOL isFinished;
@property BOOL stationsAreChosen;

@end
