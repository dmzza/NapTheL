//
//  TripViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "StopTableViewController.h"
#import "Trip.h"
#import "DACircularProgressView.h"

@interface TripViewController : UIViewController <StopTableViewControllerDelegate, MFMailComposeViewControllerDelegate>

@property int origin;
@property int destination;
@property int timeRemaining;
@property (strong, nonatomic) NSArray *durations;
@property (strong, nonatomic) NSDate *arrivalTime;
@property (strong, nonatomic) UIButton *originButton;
@property (strong, nonatomic) UIButton *destinationButton;
@property (strong, nonatomic) UIButton *swapButton;
@property (strong, nonatomic) UILabel *subtextLabel;
@property (strong, nonatomic) IBOutlet UIView *clockView;
@property (strong, nonatomic) DACircularProgressView *tripProgress;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *mailButton;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) Trip *trip;

// STATES
@property BOOL hasStarted;
@property BOOL isPaused;
@property BOOL isFinished;
@property BOOL stationsAreChosen;

- (void) calculateTime;
- (void) startClock;
- (void) setAlarm;
- (void) updateClock;
- (void) finishClock;
- (void) showMailButton;
- (void) spinWithTitle:(NSString *)aTitle subtext:(NSString *)aSubtext titleFont:(UIFont *)aTitleFont backgroundColor:(UIColor *)aBackgroundColor;
- (void) handleFlipFrom:(UIPanGestureRecognizer *)recognizer;
- (void) pickOrigin;
- (void) pickDestination;
- (void) swap;
- (void) pause;
- (void) resume;
- (void) endTrip;
- (void) cancel;
- (void) mail;




@end
