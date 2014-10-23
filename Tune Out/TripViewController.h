//
//  TripViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "StopTableViewController.h"
#import "DACircularProgressView.h"
#import "GAITrackedViewController.h"
#import <iAd/iAd.h>

@class Trip;

@interface TripViewController : GAITrackedViewController <StopTableViewControllerDelegate, MFMailComposeViewControllerDelegate, CLLocationManagerDelegate>

@property int origin;
@property int destination;
@property double timeRemaining;
@property double stoppedTime;
@property double movingTime;
@property double accumulatedPauseTime;
@property double errorThreshold;
@property double movementThreshold;
@property double movementSum;
@property double lastMovementSum;
@property double stdDoorTime;
@property double earlyAlarmTime;

@property (strong, nonatomic) NSArray *durations;
@property (strong, nonatomic) NSDate *arrivalTime;
@property (strong, nonatomic) IBOutlet UIButton *originButton;
@property (strong, nonatomic) IBOutlet UIButton *destinationButton;
@property (strong, nonatomic) IBOutlet UIView *locationView;
@property (strong, nonatomic) UIButton *locationButton;
@property (strong, nonatomic) DACircularProgressView *locationSpinner;
@property (strong, nonatomic) IBOutlet UIButton *swapButton;
@property (strong, nonatomic) UILabel *subtextLabel;
@property (strong, nonatomic) IBOutlet UIView *clockView;
@property (strong, nonatomic) DACircularProgressView *tripProgress;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *mailButton;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimer *movementTimer;
@property (strong, nonatomic) Trip *trip;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) CMMotionActivityManager *motionActivityManager;
@property (strong, nonatomic) CLLocationManager *locationManager;

// STATES
@property BOOL detectingOrigin;
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
- (void) detectOrigin;
- (void) pickOrigin;
- (void) pickDestination;
- (void) swap;
- (void) pause;
- (void) resume;
- (void) endTrip;
- (void) cancel;
- (void) mail;
- (void) movementLoop;
- (void) resetMovementLoop;
- (NSString *) findNearestStationToLocation:(CLLocation *)location;
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void) locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager;
- (void) locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager;



@end
