//
//  TripViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "TripViewController.h"
#import "StopTableViewController.h"
#import "OriginTableViewController.h"
#import "DestinationTableViewController.h"
#import "Trip.h"
#import "Acceleration.h"
#import "UIColor+CustomColors.h"
#import "UIImage+withColor.h"
#import "DACircularProgressView.h"
#import <GAI.h>
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

const double ERROR_THRESHOLD = 2.25;
const double MOVEMENT_THRESHOLD = 0.100;
const double EXPECTED_DOOR_TIME = 13.0;
const double EARLY_WARNING_BUFFER = 30.0;

@interface TripViewController ()

@property (nonatomic) BOOL tripSaved;

@end

@implementation TripViewController
{
    ADBannerView *_bannerView;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // iAd banner setup
        _bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    }
    
    return self;
}

- (void)awakeFromNib
{
    
  
  self.durations = [NSArray arrayWithObjects:
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"8 Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.737762 longitude:-74.001554], @"location",
                     [NSNumber numberWithInt:60], @"westBoundArrival", //huge delays here usually
                     [NSNumber numberWithInt:0], @"westBoundDoors",
                     [NSNumber numberWithInt:0], @"eastBoundArrival",
                     [NSNumber numberWithInt:0], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"6 Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.737283 longitude:-73.99704], @"location",
                     [NSNumber numberWithInt:60], @"westBoundArrival",
                     [NSNumber numberWithInt:15], @"westBoundDoors",
                     [NSNumber numberWithInt:58], @"eastBoundArrival",
                     //[NSNumber numberWithInt:8], @"eastBoundArrival",
                     [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Union Sq - 14 St", @"name",
                     [[CLLocation alloc] initWithLatitude:40.734787 longitude:-73.99071], @"location",
                     [NSNumber numberWithInt:53], @"westBoundArrival",
                     [NSNumber numberWithInt:16], @"westBoundDoors",
                     [NSNumber numberWithInt:60], @"eastBoundArrival",
                     [NSNumber numberWithInt:16], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"3 Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.733277 longitude:-73.987199], @"location",
                     [NSNumber numberWithInt:51], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:56], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"1 Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.731348 longitude:-73.98262], @"location",
                     [NSNumber numberWithInt:150], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:53], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Bedford Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.717038 longitude:-73.956442], @"location",
                     [NSNumber numberWithInt:71], @"westBoundArrival",
                     [NSNumber numberWithInt:15], @"westBoundDoors",
                     [NSNumber numberWithInt:150], @"eastBoundArrival",
                     [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Lorimer St", @"name",
                     [[CLLocation alloc] initWithLatitude:40.714084 longitude:-73.949382], @"location",
                     [NSNumber numberWithInt:55], @"westBoundArrival",
                     [NSNumber numberWithInt:15], @"westBoundDoors",
                     [NSNumber numberWithInt:71], @"eastBoundArrival",
                     [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Graham Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.714523 longitude:-73.944383], @"location",
                     [NSNumber numberWithInt:69], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:55], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Grand St", @"name",
                     [[CLLocation alloc] initWithLatitude:40.711955 longitude:-73.940695], @"location",
                     [NSNumber numberWithInt:53], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:63], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Montrose Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.707659 longitude:-73.939831], @"location",
                     [NSNumber numberWithInt:79], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:53], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Morgan Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.706153 longitude:-73.933555], @"location",
                     [NSNumber numberWithInt:80], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:80], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Jefferson St", @"name",
                     [[CLLocation alloc] initWithLatitude:40.706978 longitude:-73.923633], @"location",
                     [NSNumber numberWithInt:55], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:80], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"DeKalb Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.704306 longitude:-73.91925], @"location",
                     [NSNumber numberWithInt:71], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:55], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Myrtle-Wyckoff Avs", @"name",
                     [[CLLocation alloc] initWithLatitude:40.699666 longitude:-73.911338], @"location",
                     [NSNumber numberWithInt:71], @"westBoundArrival",
                     [NSNumber numberWithInt:15], @"westBoundDoors",
                     [NSNumber numberWithInt:71], @"eastBoundArrival",
                     [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Halsey St", @"name",
                     [[CLLocation alloc] initWithLatitude:40.696111 longitude:-73.904986], @"location",
                     [NSNumber numberWithInt:87], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:68], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Wilson Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.68881 longitude:-73.904831], @"location",
                     [NSNumber numberWithInt:66], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:87], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Bushwick Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.682379 longitude:-73.905635], @"location",
                     [NSNumber numberWithInt:57], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:66], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Broadway Junction", @"name",
                     [[CLLocation alloc] initWithLatitude:40.678893 longitude:-73.903441], @"location",
                     [NSNumber numberWithInt:66], @"westBoundArrival",
                     [NSNumber numberWithInt:15], @"westBoundDoors",
                     [NSNumber numberWithInt:55], @"eastBoundArrival",
                     [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Atlantic Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.675504 longitude:-73.903061], @"location",
                     [NSNumber numberWithInt:76], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:49], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Sutter Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.668652 longitude:-73.901843], @"location",
                     [NSNumber numberWithInt:63], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:77], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Livonia Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.663835 longitude:-73.900523], @"location",
                     [NSNumber numberWithInt:63], @"westBoundArrival",
                     [NSNumber numberWithInt:13], @"westBoundDoors",
                     [NSNumber numberWithInt:63], @"eastBoundArrival",
                     [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"New Lots Av", @"name",
                     [[CLLocation alloc] initWithLatitude:40.659073 longitude:-73.8993], @"location",
                     [NSNumber numberWithInt:83], @"westBoundArrival",
                     [NSNumber numberWithInt:15], @"westBoundDoors",
                     [NSNumber numberWithInt:60], @"eastBoundArrival",
                     [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"E 105 St", @"name",
                     [[CLLocation alloc] initWithLatitude:40.65139 longitude:-73.898989], @"location",
                     [NSNumber numberWithInt:76], @"westBoundArrival",
                     [NSNumber numberWithInt:15], @"westBoundDoors",
                     [NSNumber numberWithInt:77], @"eastBoundArrival",
                     [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                     ],
                    [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"Rockaway Parkway", @"name",
                     [[CLLocation alloc] initWithLatitude:40.647157 longitude:-73.901843], @"location",
                     [NSNumber numberWithInt:0], @"westBoundArrival",
                     [NSNumber numberWithInt:0], @"westBoundDoors",
                     [NSNumber numberWithInt:86], @"eastBoundArrival",
                     [NSNumber numberWithInt:0], @"eastBoundDoors", nil
                     ],
                    nil];
  self.title = @"TUNE OUT";
  self.detectingOrigin = NO;
  self.hasStarted = NO;
  self.isPaused = NO;
  self.isFinished = NO;
  self.stationsAreChosen = NO;
  
  self.stoppedTime = self.movingTime = self.accumulatedPauseTime = self.movementSum = self.lastMovementSum = 0.0;

    [super awakeFromNib];
}

#pragma mark - Callbacks

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(self.hasStarted && !self.stationsAreChosen) {
        [self.tripProgress setIndeterminate:1]; //I wonder if this ever causes the layout bug
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  // NAV BAR
  NSDictionary *titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIFont fontWithName:@"Quicksand-Bold" size:20.0], NSFontAttributeName,
                                       [UIColor whiteColor],                              NSForegroundColorAttributeName, nil];
  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStylePlain target:nil action:nil];
  
  [backButton setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
  [backButton setBackButtonBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
  [[self navigationItem] setBackBarButtonItem:backButton];
   
    // INIT
    self.tripSaved = NO;
    self.trip = [[Trip alloc] init];
    self.tripProgress = [[DACircularProgressView alloc] init];
    self.subtextLabel = [[UILabel alloc] init];
  
    // ORIGIN/DEST/SWAP
    self.originButton.titleLabel.textColor = self.destinationButton.titleLabel.textColor = [UIColor whiteColor];
    self.originButton.backgroundColor = [UIColor lightAlgaeColor];
    self.destinationButton.backgroundColor = [UIColor algaeColor];
    
    self.swapButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    
    [self.originButton addTarget:self action:@selector(pickOrigin) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self.destinationButton addTarget:self action:@selector(pickDestination) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self.swapButton addTarget:self action:@selector(swap) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    // PROGRESS
    [self.tripProgress setProgress:0.0 animated:NO];
    [self.tripProgress setRoundedCorners:1];
    [self.tripProgress setProgressTintColor:[UIColor colorWithRed:0.055 green:0.788 blue:0.573 alpha:1.0]];
    [self.tripProgress setTrackTintColor:[UIColor clearColor]];
    self.tripProgress.thicknessRatio = 0.075;
    
    
    
    NSLayoutConstraint *progressCenterYConstraint = [NSLayoutConstraint constraintWithItem:self.tripProgress
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.clockView
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                multiplier:1.0
                                                                                  constant:0.0];
    
    NSLayoutConstraint *progressCenterXConstraint = [NSLayoutConstraint constraintWithItem:self.tripProgress
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.clockView
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                multiplier:1.0
                                                                                  constant:0.0];
    
    NSLayoutConstraint *progressWidthConstraint = [NSLayoutConstraint constraintWithItem:self.tripProgress
                                                                               attribute:NSLayoutAttributeWidth
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.startButton
                                                                               attribute:NSLayoutAttributeWidth
                                                                              multiplier:1.1
                                                                                constant:0.0];
    
    NSLayoutConstraint *progressHeightConstraint = [NSLayoutConstraint constraintWithItem:self.tripProgress
                                                                                attribute:NSLayoutAttributeHeight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.tripProgress
                                                                                attribute:NSLayoutAttributeWidth
                                                                               multiplier:1.0
                                                                                 constant:0.0];
    
    
    
    // START
    [self.startButton addTarget:self action:@selector(startClock) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    UIPanGestureRecognizer* panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleFlipFrom:)];
    [self.startButton addGestureRecognizer:panGestureRecognizer];
    
    // SUBTEXT
    self.subtextLabel.text = @"start";
    self.subtextLabel.textAlignment = NSTextAlignmentCenter;
    self.subtextLabel.backgroundColor = [UIColor clearColor];
    self.subtextLabel.textColor = [UIColor whiteColor];
    self.subtextLabel.font = [UIFont fontWithName:@"Avenir" size:15];
    NSDictionary *viewDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.subtextLabel, @"subtextLabel", nil];
    [self.startButton addSubview:self.subtextLabel];
    NSArray *subtextVerticalLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[subtextLabel]-20-|" options:0 metrics:nil views:viewDictionary];
    NSArray *subtextHorizontalLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subtextLabel]|" options:0 metrics:nil views:viewDictionary];
    
    // MAIL
    self.mailButton.hidden = YES;
    self.mailButton.titleLabel.font = [UIFont fontWithName:@"linecons" size:28.0];
    [self.mailButton addTarget:self action:@selector(mail) forControlEvents:UIControlEventTouchDown];
    
    // MOVEMENT
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 0.01;
    self.motionActivityManager = [[CMMotionActivityManager alloc] init];
    
    
    // LOCATION
    self.locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.locationButton setFrame:CGRectMake(0, 0, 50, 50)];
    [self.locationButton setBackgroundImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [self.locationButton addTarget:self action:@selector(detectOrigin) forControlEvents:UIControlEventTouchDown];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    //self.locationSpinner = [[DACircularProgressView alloc] initWithFrame:CGRectMake(225, 5, 40, 40)];
    self.locationSpinner = [[DACircularProgressView alloc] initWithFrame:CGRectMake(7, 6, 37, 37)];
    [self.locationSpinner setProgress:0.00];
    [self.locationSpinner setIndeterminateDuration:0.7];
    [self.locationSpinner setIndeterminate:1];
    [self.locationSpinner setThicknessRatio:0.15];
    [self.locationSpinner setRoundedCorners:1];
    [self.locationSpinner setTrackTintColor:[UIColor clearColor]];
    
    
    
    // SELF
    self.view.backgroundColor = [UIColor darkBlueGrayColor];
    
    // SUBVIEWS
    [self.locationView addSubview:self.locationSpinner];
    [self.locationView addSubview:self.locationButton];
    
    [self.view addSubview:self.originButton];
    [self.view addSubview:self.destinationButton];
    [self.view addSubview:self.swapButton];
    [self.view addSubview:self.locationView];
    [self.clockView addSubview:self.tripProgress];
    //[self.startButton addSubview:self.subtextLabel];
    [self.clockView addSubview:self.startButton];
    [self.startButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.subtextLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.clockView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tripProgress setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.startButton addConstraints:subtextVerticalLayoutConstraints];
    [self.startButton addConstraints:subtextHorizontalLayoutConstraints];
    [self.clockView addConstraints:@[progressCenterXConstraint, progressCenterYConstraint, progressHeightConstraint, progressWidthConstraint]];
    [self.view addSubview:self.clockView];
    
    self.screenName = @"Trip Screen";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.view addSubview:_bannerView];
    [self layoutAnimated:NO];
}

- (void)didFinishCreatingTrip {
    // Only save trip if it is new, otherwise this will be called every time the alarm is set (like after a pause/resume)
    if (self.tripSaved == NO && [self.trip save] < FCModelSaveSucceeded) {
        NSLog(@"Save trip failed");
    } else {
        self.tripSaved = YES;
    }
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - iAds

- (void)layoutAnimated:(BOOL)animated
{
    CGRect contentFrame = self.view.bounds;
    CGRect bannerFrame = _bannerView.frame;
    
    // Position the banner on the y axis
    bannerFrame.origin.y = contentFrame.size.height - bannerFrame.size.height;
    
    [UIView animateWithDuration:animated ? 0.25 : 0.0 animations:^{
        _bannerView.frame = bannerFrame;
    }];
}

#pragma mark - StopTableViewController Delegate

- (void) setStopViewController:(id)controller didFinishSelectingStop:(NSString *)stop which:(BOOL)isOrigin {
    id tracker = [[GAI sharedInstance] defaultTracker];
    self.tripSaved = NO;
    if(isOrigin) {
        self.trip.origin = stop;
        [self.originButton setTitle:[NSString stringWithFormat:@"%@", stop] forState:UIControlStateNormal];
        if(self.trip.destination != nil) { // destination chosen
            self.stationsAreChosen = YES;
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"userAction"
                                                              action:@"originChosen"
                                                               label:stop
                                                               value:nil] build]];
    } else { // is destination
        self.trip.destination = stop;
        [self.destinationButton setTitle:[NSString stringWithFormat:@"%@", stop] forState:UIControlStateNormal];
        if(self.trip.origin != nil) { // origin chosen
            self.stationsAreChosen = YES;
            if(self.hasStarted && !self.isFinished) { // trip is in progress
                [[UIApplication sharedApplication] cancelAllLocalNotifications];
                [self.timer invalidate];
                self.timer = nil;
            }
        }
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"userAction"
                                                              action:@"destinationChosen"
                                                               label:stop
                                                               value:nil] build]];
    }
    if(self.stationsAreChosen) {
        [self calculateTime];
    }
}

#pragma mark - Time

- (void) calculateTime {
    int i;
    for (i = 0; i < self.durations.count; i++) {
        NSString *name = self.durations[i][@"name"];
        
        if(name == self.trip.origin)
            self.origin = i;
        if(name == self.trip.destination)
            self.destination = i;
    }
    double originalTimeRemaining = 0.0;
    if(self.hasStarted && self.stationsAreChosen) {
        originalTimeRemaining = self.timeRemaining;
        if(self.isPaused) {
            //how much time is left for the current trip
            //the total duration for the current trip
            self.timeRemaining = -1 * ((double)self.trip.duration - originalTimeRemaining);
        } else {
            self.timeRemaining = self.trip.departureTime.timeIntervalSinceNow;
        }
    } else {
        self.timeRemaining = 0;
    }

    // CALCULATE TIME REMAINING

    int dest = self.destination, orig = self.origin;
    
    if (self.origin < self.destination) { // eastbound
        //NSLog(@"  eastbound:");
        for (i = orig + 1; i <= dest - 1; i++) {
            NSNumber *arrival = self.durations[i][@"eastBoundArrival"];
            NSNumber *doors = self.durations[i][@"eastBoundDoors"];
            self.timeRemaining += arrival.doubleValue + doors.doubleValue;
            //NSLog([NSString stringWithFormat:@"%@ : %d + %d", self.durations[i][@"name"], arrival.intValue, doors.intValue]);
        }
        NSNumber *arrival = self.durations[dest][@"eastBoundArrival"];
        self.timeRemaining += arrival.doubleValue;
        //NSLog([NSString stringWithFormat:@"%@ : %d = %d", self.durations[dest][@"name"], arrival.intValue, self.timeRemaining]);
    } else { // westbound
        for (i = orig - 1; i >= dest + 1; i--) {
            NSNumber *arrival = self.durations[i][@"westBoundArrival"];
            NSNumber *doors = self.durations[i][@"westBoundDoors"];
            self.timeRemaining += arrival.doubleValue + doors.doubleValue;
        }
        NSNumber *arrival = self.durations[dest][@"westBoundArrival"];
        self.timeRemaining += arrival.doubleValue;
    }
    
    if(self.hasStarted && self.stationsAreChosen) {
        if(!self.isPaused) {
            [self setAlarm];
            self.trip.duration = self.timeRemaining - self.trip.departureTime.timeIntervalSinceNow; // set new total duration
        } else {
            self.trip.duration = self.timeRemaining + (self.trip.duration - originalTimeRemaining); // set new total duration
        }
    } else {
        self.trip.duration = self.timeRemaining;
        [self.tripProgress setProgress:1.0 animated:YES];
    }
    //id tracker = [[GAI sharedInstance] defaultTracker];
    //[tracker setSessionTimeout:(self.timeRemaining + 30)];
}

- (void) startClock {
    self.trip.departureTime = [NSDate dateWithTimeIntervalSinceNow:0];
    
    // START
    [self.startButton removeTarget:self action:@selector(startClock) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    self.startButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    // SUBTEXT
    [self spinWithTitle:@"O" subtext:@"pause" titleFont:[UIFont fontWithName:@"Sosa-Regular" size:100.0] backgroundColor:[UIColor darkBlueGrayColor]];
    
    [self.swapButton setTitle:@"ã" forState:UIControlStateNormal];
    [self.swapButton removeTarget:self action:@selector(swap) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self.swapButton addTarget:self action:@selector(cancel) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    [self.locationView setHidden:YES];
    
    // MOVEMENT
    [self.locationManager startUpdatingLocation];
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        Acceleration *acceleration = [[Acceleration alloc] initWithTrip:self.trip.uniqueID andVector:motion.userAcceleration];
        
        self.movementSum += acceleration.magnitude;
        [acceleration save];
    }];
    if ([CMMotionActivityManager isActivityAvailable]) {
        [self.motionActivityManager startActivityUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMotionActivity *activity) {
            if (activity.stationary) {
                [self.tripProgress setTrackTintColor:[UIColor colorWithRed:0.95 green:0.37 blue:0.3 alpha:1.0]];
                [self.subtextLabel setText:@"stopped"];
            } else {
                [self.tripProgress setTrackTintColor:[UIColor clearColor]];
                
                if(activity.walking) {
                    [self.subtextLabel setText:@"walking"];
                } else if (activity.running) {
                    [self.subtextLabel setText:@"running"];
                } else if (activity.automotive) {
                    [self.subtextLabel setText:@"car"];
                } else if (activity.unknown) {
                    [self.subtextLabel setText:@"unknown"];
                } else {
                    [self.subtextLabel setText:@"nil motion"];
                }
            }
        }];
    }
    
    self.hasStarted = YES;
    
    if(!self.stationsAreChosen) {
        [self.tripProgress setProgress:0.95 animated:NO];
        [self.tripProgress setIndeterminate:1];
        if(self.trip.origin != nil)
            [self pickDestination];
        else
            [self pickOrigin];
    } else {
        [self setAlarm];
    }
}

- (void) setAlarm {
    [self didFinishCreatingTrip];
    if(self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
        [self.tripProgress setIndeterminate:0];
    }
    self.arrivalTime = [NSDate dateWithTimeIntervalSinceNow:self.timeRemaining];
    NSDate *alarmTime = [NSDate dateWithTimeIntervalSinceNow:(self.timeRemaining - EARLY_WARNING_BUFFER)];
    UILocalNotification *arrivalAlarm = [[UILocalNotification alloc] init];
    
    // ARRIVAL ALARM
    arrivalAlarm.fireDate = alarmTime;
    arrivalAlarm.alertBody = [NSString stringWithFormat:@"%@ is coming soon.", self.durations[(int)self.destination][@"name"]];
    arrivalAlarm.alertAction = @"Tune In";
    arrivalAlarm.soundName = @"subwayAlarm.m4a";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:arrivalAlarm];
}

- (void) updateClock {
    if (self.motionManager.deviceMotionAvailable) [self resetMovementLoop];
    
    double seconds = self.arrivalTime.timeIntervalSinceNow;
    float progress = 0.96 * (self.arrivalTime.timeIntervalSinceNow / (float)self.trip.duration);
    int minutes = seconds / 60;
    // int remainderSeconds = fmod(seconds, 60);
    NSString *mins = @"mins";
    
    if(minutes == 1) mins = @"min";
    [self.tripProgress setProgress:progress animated:YES];
    //self.subtextLabel.text = [NSString stringWithFormat:@"%d %@", minutes, mins];
    if (seconds <= 0) {
        [self finishClock];
    }
    
}

- (void) finishClock {
    self.isFinished = YES;
    [self.tripProgress setProgress:0 animated:YES];
    [self spinWithTitle:@"" subtext:@"end trip" titleFont:[UIFont fontWithName:@"Linecons" size:90.0] backgroundColor:[UIColor darkAquaColor]];
    [self.startButton removeTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(endTrip) forControlEvents:UIControlEventTouchUpInside];
    [self.swapButton setTitle:@"U" forState:UIControlStateNormal];
    [self.swapButton removeTarget:self action:@selector(cancel) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self.swapButton addTarget:self action:@selector(swap) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self.locationView setHidden:NO];
    [self.locationSpinner setProgress:0 animated:YES];
    [self.locationManager stopUpdatingLocation];
    [self.motionManager stopDeviceMotionUpdates];
    [self.motionActivityManager stopActivityUpdates];
    self.stoppedTime = self.movingTime = 0.0;
    if ([MFMailComposeViewController canSendMail]) {
        [self showMailButton];
    }
    [self.timer invalidate];
}

# pragma mark - UI Actions/Transitions

- (void) showMailButton {
    self.mailButton.layer.transform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(0, 100));
    [self.mailButton setHidden:NO];
    [self.mailButton setTitle:@"" forState:UIControlStateNormal];
    self.mailButton.titleLabel.font = [UIFont fontWithName:@"linecons" size:28];
    [UIView animateWithDuration:0.5 animations:^{
        self.mailButton.layer.transform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(0, -15));
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            self.mailButton.layer.transform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(0, 0));
        }];
    }];
}

- (void) spinWithTitle:(NSString *)aTitle subtext:(NSString *)aSubtext titleFont:(UIFont *)aTitleFont backgroundColor:(UIColor *)aBackgroundColor {
    [self.view layoutIfNeeded];
    self.clockView.layer.transform = CATransform3DMakeRotation(M_PI_2 * 0.5, 0, 1, 0);
    [UIView animateWithDuration:0.18 animations:^{
        self.clockView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0); //CATransform3DScale(CATransform3DMakeRotation(M_PI_2, 0, 1, 0), 1.25, 1.25, 1.25);
    } completion:^(BOOL finished) {
        [self.startButton setTitle:aTitle forState:UIControlStateNormal];
        [self.startButton setImage:nil forState:UIControlStateNormal];
        if([aSubtext isEqual: @"resume"]) {
            self.tripProgress.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0);
        } else {
            self.tripProgress.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        }
        self.subtextLabel.text = aSubtext;
        self.startButton.titleLabel.font = aTitleFont;
        self.view.backgroundColor = aBackgroundColor;
        [UIView animateWithDuration:0.25 animations:^{
            self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(0, 0, 1, 0), 1.0, 1.0, 1.0);
        }];
    }];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"transition"
                                                          action:@"spinButton"
                                                           label:aSubtext
                                                           value:nil] build]];
}

- (void) handleFlipFrom:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:recognizer.view];
    //CGPoint velocity = [recognizer velocityInView:recognizer.view];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        //NSLog([NSString stringWithFormat:@"velocity-x: %f", velocity.x]);
        if (translation.x < 160.0 && translation.x > -160.0) {
            self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(M_PI_2 * (translation.x / 320), 0, 1, 0), 1.0, 1.0, 1.0);
        } else {
            self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(M_PI_2 * 0.5, 0, 1, 0), 1.0, 1.0, 1.0);
        }
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (translation.x > 50.0 || translation.x < -50.0) {
            self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(M_PI_2 * 0.5, 0, 1, 0), 1.0, 1.0, 1.0);
            NSArray *actions = [self.startButton actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
            //SEL action = NSSelectorFromString(actions[0]);
            //[self performSelector:action];
            // In the interest of avoiding a potential memory leak, I'll do this manually for now
            if([actions[0] isEqual: @"startClock"])
                [self startClock];
            else if ([actions[0] isEqual: @"pause"])
                [self pause];
            else if ([actions[0] isEqual: @"resume"])
                [self resume];
            else if ([actions[0] isEqual: @"endTrip"])
                [self endTrip];
            id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"uiAction"
                                                                  action:@"flipGesture"
                                                                   label:actions[0]
                                                                   value:nil] build]];
        } else {
            self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(0, 0, 1, 0), 1.0, 1.0, 1.0);
        }
        
    }
}

- (void) detectOrigin {
    [self.locationManager startUpdatingLocation];
    self.detectingOrigin = YES;
    [self.locationSpinner setProgressTintColor:[UIColor whiteColor]];
    [self.locationSpinner setIndeterminate:1];
    [self.locationSpinner setProgress:0.9 animated:YES];
    if (![CLLocationManager locationServicesEnabled]) {
        [self locationManager:self.locationManager didFailWithError:[NSError errorWithDomain:@"LocationDisabled" code:0 userInfo:0]];
    }
    
}

- (void) pickOrigin {
    if(self.isFinished) [self endTrip];
    if(!self.hasStarted || self.isFinished || !self.stationsAreChosen) {
        OriginTableViewController *originTableViewController = [[OriginTableViewController alloc] initWithStyle:UITableViewStylePlain];
        originTableViewController.delegate = self;
    
        [self.navigationController pushViewController:originTableViewController animated:YES];
    }
}

- (void) pickDestination {
    if(self.isFinished) [self endTrip];
    DestinationTableViewController *destinationTableViewController = [[DestinationTableViewController alloc] initWithStyle:UITableViewStylePlain origin:self.trip.origin];
    destinationTableViewController.delegate = self;
    [self.navigationController pushViewController:destinationTableViewController animated:YES];
}

- (void) swap {
    NSString *newDestination = self.trip.origin;
    self.trip.origin = self.trip.destination;
    self.trip.destination = newDestination;
    if (self.trip.origin != nil) [self.originButton setTitle:[NSString stringWithFormat:@"%@", self.trip.origin] forState:UIControlStateNormal];
    else [self.originButton setTitle:@"FROM " forState:UIControlStateNormal];
    if (self.trip.destination != nil) [self.destinationButton setTitle:[NSString stringWithFormat:@"%@", self.trip.destination] forState:UIControlStateNormal];
    else [self.destinationButton setTitle:@"TO " forState:UIControlStateNormal];
    if(self.hasStarted && self.stationsAreChosen) { // and trip is already in progress
        [self endTrip];
    }
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"uiAction"
                                                          action:@"buttonPressed"
                                                           label:@"swap"
                                                           value:nil] build]];
}

- (void) pause {
    [self spinWithTitle:@"N" subtext:@"resume" titleFont:[UIFont fontWithName:@"Sosa-Regular" size:100.0] backgroundColor:[UIColor darkBlueGrayColor]];
    [self.startButton removeTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    self.isPaused = YES;
    
    if(self.hasStarted && self.stationsAreChosen) {
        self.timeRemaining = self.arrivalTime.timeIntervalSinceNow;
        [self.timer invalidate];
        self.timer = nil;
        self.stoppedTime = self.movingTime = 0.0;
    }
}

- (void) resume {
    [self spinWithTitle:@"O" subtext:@"pause" titleFont:[UIFont fontWithName:@"Sosa-Regular" size:100.0] backgroundColor:[UIColor darkBlueGrayColor]];
    [self.startButton removeTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    
    self.isPaused = NO;
    
    if(self.hasStarted && self.stationsAreChosen) {
        [self setAlarm];
    }
}

- (void) endTrip {
    [self spinWithTitle:@"" subtext:@"start" titleFont:[UIFont fontWithName:@"Linecons" size:90.0] backgroundColor:[UIColor darkBlueGrayColor]];
    [self.startButton removeTarget:self action:@selector(endTrip) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(startClock) forControlEvents:UIControlEventTouchUpInside];
    [self.mailButton setHidden:YES];
    
    Trip *newTrip = [[Trip alloc] init];
    
    newTrip.origin = self.trip.origin;
    newTrip.destination = self.trip.destination;
    self.trip = newTrip;
    self.tripSaved = NO;
    
    [self.tripProgress setProgress:0 animated:YES];
    
    self.hasStarted = NO;
    self.isPaused = NO;
    self.isFinished = NO;
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    if(self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
        [self calculateTime];
    }
}

- (void) cancel {
    self.trip.origin = self.trip.destination = nil;
    self.trip.departureTime = nil;
    self.trip.duration = 0;
    [self.timer invalidate];
    self.timer = nil;
    [self.locationView setHidden:NO];
    [self.locationSpinner setProgress:0 animated:YES];
    [self.locationManager stopUpdatingLocation];
    [self.motionManager stopDeviceMotionUpdates];
    self.stoppedTime = self.movingTime = 0.0;
    self.stationsAreChosen = NO;
    [self.originButton setTitle:[NSString stringWithFormat:@"FROM"] forState:UIControlStateNormal];
    [self.destinationButton setTitle:[NSString stringWithFormat:@"TO"] forState:UIControlStateNormal];
    [self.swapButton setTitle:@"U" forState:UIControlStateNormal];
    [self.swapButton removeTarget:self action:@selector(cancel) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self.swapButton addTarget:self action:@selector(swap) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self endTrip];
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"uiAction"
                                                          action:@"buttonPressed"
                                                           label:@"cancel"
                                                           value:nil] build]];
}

- (void) mail {
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller.navigationBar setTintColor:[UIColor colorWithRed:0.85 green:0.27 blue:0.2 alpha:1.0]];
    [controller setToRecipients:@[@"david@tuneoutapp.com"]];
    [controller setSubject:@"Dear Sir"];
    [controller setMessageBody:[NSString stringWithFormat:@"I was aboard the L train from %@ to %@ and this app: \n\n\n [  ] Was about    seconds late \n\n [  ] Didn't ring at all \n\n [  ] Other Bug/Comment/Suggestion: \n\n\n\n\n", self.trip.origin, self.trip.destination] isHTML:NO];
    if (controller) [self presentViewController:controller animated:YES completion:^{
        
    }];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"uiAction"
                                                          action:@"buttonPressed"
                                                           label:@"mail"
                                                           value:nil] build]];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        [self.mailButton setTitle:@"THANKS" forState:UIControlStateNormal];
        self.mailButton.titleLabel.font = [UIFont fontWithName:@"Quicksand-Regular" size:12];
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"userAction"
                                                              action:@"emailSent"
                                                               label:@""
                                                               value:nil] build]];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Motion Manager

- (void)movementLoop
{
    CMAcceleration vector = self.motionManager.deviceMotion.userAcceleration;
    
    double currentTotal = vector.x + vector.y + vector.z;
    self.movementSum += currentTotal;
}

- (void)resetMovementLoop
{
    double currentDiff = fabs(self.movementSum - self.lastMovementSum);
    
    if(currentDiff < MOVEMENT_THRESHOLD) {
        self.stoppedTime += 0.5;
        if (self.stoppedTime > EXPECTED_DOOR_TIME)
            self.accumulatedPauseTime += 0.5;
        if(self.movingTime <= ERROR_THRESHOLD) {
            self.stoppedTime += self.movingTime;
            if (self.stoppedTime > EXPECTED_DOOR_TIME)
                self.accumulatedPauseTime += self.movingTime;
        }
        if(self.accumulatedPauseTime > 0 && self.hasStarted && self.stationsAreChosen) {
            self.timeRemaining = self.arrivalTime.timeIntervalSinceNow;
            [self.timer invalidate];
            self.timer = nil;
            [[UIApplication sharedApplication] cancelAllLocalNotifications];
            self.timeRemaining += self.accumulatedPauseTime;
            self.accumulatedPauseTime = 0;
            [self setAlarm];
        }
        self.movingTime = 0;
    }
    else {
        self.movingTime += 0.5;
        if(self.movingTime > ERROR_THRESHOLD) {
            if (self.stoppedTime > EXPECTED_DOOR_TIME) {
//                UIPasteboard *pb = [UIPasteboard generalPasteboard];
//                [pb setString:[NSString stringWithFormat:@"%f", self.stoppedTime]];
            }
            self.stoppedTime = 0;
        }
    }
    
    
    //[self.originButton setTitle:[NSString stringWithFormat:@"%f", self.stoppedTime] forState:UIControlStateNormal];
    //[self.destinationButton setTitle:[NSString stringWithFormat:@"%f", self.movingTime] forState:UIControlStateNormal];
    
    self.lastMovementSum = self.movementSum;
    self.movementSum = 0;
}

#pragma mark - Geolocation

- (NSString *) findNearestStationToLocation:(CLLocation *)location {
    NSString *nearestStation;
    double nearestDistance = MAXFLOAT;
    for(int i = 0; i < self.durations.count - 1; i++) {
        double distance = [location distanceFromLocation:self.durations[i][@"location"]];
        if (distance < nearestDistance) {
            nearestStation = self.durations[i][@"name"];
            nearestDistance = distance;
        }
    }
    return nearestStation;
}

#pragma mark - CLLocationManager Delegate

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *currentLocation = locations.lastObject;
    double lastUpdated = [currentLocation.timestamp timeIntervalSinceNow];
    NSString *nearestStation = [self findNearestStationToLocation:currentLocation];
    if (self.detectingOrigin && lastUpdated > -30.0) {
        //NSLog([NSString stringWithFormat:@"%f", lastUpdated]);
        self.trip.origin = nearestStation;
        [self.locationSpinner setProgress:1 animated:YES];
        self.detectingOrigin = NO;
        [self.originButton setTitle:nearestStation forState:UIControlStateNormal];
        [self.locationManager stopUpdatingLocation];
        if(self.trip.destination != nil) { // destination chosen
            self.stationsAreChosen = YES;
            [self calculateTime];
        }
    } else if ([nearestStation isEqualToString:self.trip.destination]) {
        self.timeRemaining = EARLY_WARNING_BUFFER + 1.0;
        [self.timer invalidate];
        self.timer = nil;
        [self.locationManager stopUpdatingLocation];
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        [self setAlarm];
    }
    
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.detectingOrigin) {
        [self.locationSpinner setProgress:1 animated:YES];
        [self.locationSpinner setProgressTintColor:[UIColor algaeColor]];
        [self.locationManager stopUpdatingLocation];
        self.detectingOrigin = NO;
    }
    
    //NSLog(@"Failed");
//    [self.originButton setBackgroundColor:[UIColor flatRedColor]];
//    UIPasteboard *pb = [UIPasteboard generalPasteboard];
//    
//    [pb setString:[error localizedDescription]];
}

- (void) locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager {
    //NSLog(@"PAUSE LOCATION");
//    UIPasteboard *pb = [UIPasteboard generalPasteboard];
//    [pb setString:@"location paused"];
}

- (void) locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager {
    //NSLog(@"RESUME LOCATION");
//    UIPasteboard *pb = [UIPasteboard generalPasteboard];
//    [pb setString:@"location resumed"];
}

@end
