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
#import "UIColor+CustomColors.h"
#import "UIImage+withColor.h"
#import "DACircularProgressView.h"


@interface TripViewController ()

@end

@implementation TripViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super initWithNibName:@"TripViewController" bundle:nil];
    if (self) {
        self.durations = [NSArray arrayWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"8 Av", @"name",
                           [NSNumber numberWithInt:60], @"westBoundArrival", //huge delays here usually
                           [NSNumber numberWithInt:0], @"westBoundDoors",
                           [NSNumber numberWithInt:0], @"eastBoundArrival",
                           [NSNumber numberWithInt:0], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"6 Av", @"name",
                           [NSNumber numberWithInt:60], @"westBoundArrival",
                           [NSNumber numberWithInt:15], @"westBoundDoors",
                           [NSNumber numberWithInt:58], @"eastBoundArrival",
                           [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Union Sq - 14 St", @"name",
                           [NSNumber numberWithInt:53], @"westBoundArrival",
                           [NSNumber numberWithInt:16], @"westBoundDoors",
                           [NSNumber numberWithInt:60], @"eastBoundArrival",
                           [NSNumber numberWithInt:16], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"3 Av", @"name",
                           [NSNumber numberWithInt:51], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:56], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"1 Av", @"name",
                           [NSNumber numberWithInt:150], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:53], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Bedford Av", @"name",
                           [NSNumber numberWithInt:71], @"westBoundArrival",
                           [NSNumber numberWithInt:15], @"westBoundDoors",
                           [NSNumber numberWithInt:150], @"eastBoundArrival",
                           [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Lorimer St", @"name",
                           [NSNumber numberWithInt:55], @"westBoundArrival",
                           [NSNumber numberWithInt:15], @"westBoundDoors",
                           [NSNumber numberWithInt:71], @"eastBoundArrival",
                           [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Graham Av", @"name",
                           [NSNumber numberWithInt:69], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:55], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Grand St", @"name",
                           [NSNumber numberWithInt:53], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:63], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Montrose St", @"name",
                           [NSNumber numberWithInt:79], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:53], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Morgan Av", @"name",
                           [NSNumber numberWithInt:80], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:80], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Jefferson St", @"name",
                           [NSNumber numberWithInt:55], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:80], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"DeKalb Av", @"name",
                           [NSNumber numberWithInt:71], @"westBoundArrival",
                           [NSNumber numberWithInt:13], @"westBoundDoors",
                           [NSNumber numberWithInt:55], @"eastBoundArrival",
                           [NSNumber numberWithInt:13], @"eastBoundDoors", nil
                           ],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"Myrtle-Wyckoff Avs", @"name",
                           [NSNumber numberWithInt:71], @"westBoundArrival",
                           [NSNumber numberWithInt:15], @"westBoundDoors",
                           [NSNumber numberWithInt:71], @"eastBoundArrival",
                           [NSNumber numberWithInt:15], @"eastBoundDoors", nil
                           ],
                          
                          nil];
        self.title = @"TUNE OUT";
        self.hasStarted = NO;
        self.isPaused = NO;
        self.isFinished = NO;
        self.stationsAreChosen = NO;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.95 green:0.37 blue:0.3 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
    
    UIImage *backButtonBackground = [UIImage imageWithColor:[UIColor darkerBlueGrayColor]];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStyleDone target:nil action:nil];
    [backButton setBackButtonBackgroundImage:backButtonBackground forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Quicksand-Bold" size:20.0], UITextAttributeFont, nil] forState:UIControlStateNormal];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    self.originButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    self.destinationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    self.swapButton = [[UIButton alloc] initWithFrame:CGRectMake(245, 25, 100, 50)];
    self.tripProgress = [[DACircularProgressView alloc] init];
    self.subtextLabel = [[UILabel alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    // ORIGIN/DEST/SWAP
    [self.originButton setTitle:[NSString stringWithFormat:@"FROM"] forState:UIControlStateNormal];
    [self.destinationButton setTitle:[NSString stringWithFormat:@"TO"] forState:UIControlStateNormal];
    self.originButton.titleEdgeInsets = self.destinationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    self.originButton.contentHorizontalAlignment = self.destinationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.originButton.titleLabel.textColor = self.destinationButton.titleLabel.textColor = [UIColor whiteColor];
    //NSLog(@"font names: %@", [UIFont fontNamesForFamilyName:@"Quicksand"]);
    self.originButton.titleLabel.font = self.destinationButton.titleLabel.font = [UIFont fontWithName:@"Quicksand-Regular" size:17.0];
    self.originButton.backgroundColor = [UIColor lightAlgaeColor];
    self.destinationButton.backgroundColor = [UIColor algaeColor];
    
    self.swapButton.titleLabel.font = [UIFont fontWithName:@"Sosa-Regular" size:30.0];
    self.swapButton.transform = CGAffineTransformMakeRotation(M_PI_2);
    [self.swapButton setTitle:@"U" forState:UIControlStateNormal];
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
                                                                                  toItem:self.clockView
                                                                               attribute:NSLayoutAttributeWidth
                                                                              multiplier:1.0
                                                                                constant:0.0];
    
    NSLayoutConstraint *progressHeightConstraint = [NSLayoutConstraint constraintWithItem:self.tripProgress
                                                                                attribute:NSLayoutAttributeHeight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.clockView
                                                                                attribute:NSLayoutAttributeWidth
                                                                               multiplier:1.0
                                                                                 constant:0.0];
    
    
    
    // START
    self.startButton.titleLabel.font = [UIFont fontWithName:@"Linecons" size:90.0]; //[UIFont fontWithName:@"Avenir" size:18];
    [self.startButton setFrame:CGRectMake(10, 10, 208, 208)];
    self.startButton.backgroundColor = [UIColor clearColor];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"startClock"] forState:UIControlStateNormal];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"startClock"] forState:UIControlStateHighlighted];
    [self.startButton setTitle:@"" forState:UIControlStateNormal];
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
    
    // SELF
    self.view.backgroundColor = [UIColor darkBlueGrayColor];
    
    // SUBVIEWS
    [self.view addSubview:self.originButton];
    [self.view addSubview:self.destinationButton];
    [self.view addSubview:self.swapButton];
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
    
    
}

- (void) setStopViewController:(id)controller didFinishSelectingStop:(NSString *)stop which:(BOOL)isOrigin {
    if(isOrigin) {
        self.trip.origin = stop;
        [self.originButton setTitle:[NSString stringWithFormat:@"%@", stop] forState:UIControlStateNormal];
        if(self.trip.destination == nil) { // no destination chosen yet
            [self pickDestination];
        } else { // destination chosen
            [self.navigationController popToRootViewControllerAnimated:NO];
            if(self.hasStarted && self.stationsAreChosen) { // and trip is already in progress
                [self endTrip];
            } else {
                self.stationsAreChosen = YES;
                [self calculateTime];
            }
        }
    } else { // is destination
        self.trip.destination = stop;
        [self.destinationButton setTitle:[NSString stringWithFormat:@"%@", stop] forState:UIControlStateNormal];
        if(self.trip.origin != nil) {
            self.stationsAreChosen = YES;
            if(self.hasStarted && !self.isFinished) { // trip is in progress
                [[UIApplication sharedApplication] cancelAllLocalNotifications];
                self.timer = nil;
                [self calculateTime];
            }
        }
    }
    if(self.trip.origin != nil && self.trip.destination != nil) {
        [self calculateTime];
    }
}

- (void) calculateTime {
    int i;
    for (i = 0; i < self.durations.count; i++) {
        NSString *name = self.durations[i][@"name"];
        
        if(name == self.trip.origin)
            self.origin = i;
        if(name == self.trip.destination)
            self.destination = i;
    }
    int originalTimeRemaining = 0;
    if(self.hasStarted && self.stationsAreChosen) {
        originalTimeRemaining = self.timeRemaining;
        if(self.isPaused) {
            //how much time is left for the current trip
            //the total duration for the current trip
            self.timeRemaining = -1 * (self.trip.duration - originalTimeRemaining);
        } else {
            self.timeRemaining = self.trip.departureTime.timeIntervalSinceNow;
        }
    } else {
        self.timeRemaining = 0;
    }

    // CALCULATE TIME REMAINING

    int dest = self.destination, orig = self.origin;
    
    if (self.origin < self.destination) { // eastbound
        for (i = orig + 1; i <= dest - 1; i++) {
            NSNumber *arrival = self.durations[i][@"eastBoundArrival"];
            NSNumber *doors = self.durations[i][@"eastBoundDoors"];
            self.timeRemaining += arrival.intValue + doors.intValue;
        }
        NSNumber *arrival = self.durations[dest][@"eastBoundArrival"];
        self.timeRemaining += arrival.intValue;
    } else { // westbound
        for (i = orig - 1; i >= dest + 1; i--) {
            NSNumber *arrival = self.durations[i][@"westBoundArrival"];
            NSNumber *doors = self.durations[i][@"westBoundDoors"];
            self.timeRemaining += arrival.intValue + doors.intValue;
        }
        NSNumber *arrival = self.durations[dest][@"westBoundArrival"];
        self.timeRemaining += arrival.intValue;
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
}

- (void) startClock {
    self.trip.departureTime = [NSDate dateWithTimeIntervalSinceNow:0];
    
    // START
    [self.startButton removeTarget:self action:@selector(startClock) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    self.startButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    // SUBTEXT
    //[self spinWithTitle:[NSString stringWithFormat:@"%d", (int)(self.arrivalTime.timeIntervalSinceNow / 60.0)] subtext:@"minutes"];
    [self spinWithTitle:@"O" subtext:@"pause" titleFont:[UIFont fontWithName:@"Sosa-Regular" size:100.0] backgroundColor:[UIColor darkBlueGrayColor]];
    
    self.hasStarted = YES;
    
    if(!self.stationsAreChosen) {
        [self.tripProgress setProgress:0.95 animated:NO];
        [self.tripProgress setIndeterminate:1];
        [self pickOrigin];
    } else {
        [self setAlarm];
    }
}

- (void) setAlarm {
    if(self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
        [self.tripProgress setIndeterminate:0];
    }
    self.arrivalTime = [NSDate dateWithTimeIntervalSinceNow:self.timeRemaining];
    UILocalNotification *arrivalAlarm = [[UILocalNotification alloc] init];
    
    // ARRIVAL ALARM
    arrivalAlarm.fireDate = self.arrivalTime;
    arrivalAlarm.alertBody = [NSString stringWithFormat:@"%@ is coming soon.", self.durations[(int)self.destination][@"name"]];
    arrivalAlarm.alertAction = @"Tune In";
    arrivalAlarm.soundName = @"subwayAlarm.m4a";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:arrivalAlarm];
}

- (void) updateClock {
    int seconds = (int)self.arrivalTime.timeIntervalSinceNow;
    //int minutes = (seconds / 60);
    float progress = (self.arrivalTime.timeIntervalSinceNow / (float)self.trip.duration);
    
    [self.tripProgress setProgress:progress animated:YES];
//    if(minutes >= 2) {
//        self.subtextLabel.text = [NSString stringWithFormat:@"%f", self.arrivalTime.timeIntervalSinceNow];
//    } else if (seconds > 0) {
//        self.view.backgroundColor = [UIColor arrivingSoonColor];
//        self.subtextLabel.text = @"arriving soon";
//    } else {
    if (seconds <= 0) {
        self.isFinished = YES;
        [self.tripProgress setProgress:0 animated:YES];
        [self spinWithTitle:@"" subtext:@"end trip" titleFont:[UIFont fontWithName:@"Linecons" size:90.0] backgroundColor:[UIColor darkAquaColor]];
        [self.startButton removeTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
        [self.startButton addTarget:self action:@selector(endTrip) forControlEvents:UIControlEventTouchUpInside];
        [self.timer invalidate];
    }
    
}

- (void) spin {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1.0;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.clockView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void) spinWithTitle:(NSString *)aTitle subtext:(NSString *)aSubtext titleFont:(UIFont *)aTitleFont backgroundColor:(UIColor *)aBackgroundColor {
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
            SEL action = NSSelectorFromString(actions[0]);
            [self performSelector:action];
        } else {
            self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(0, 0, 1, 0), 1.0, 1.0, 1.0);
        }
        
    }
}

- (void) pickOrigin {
    if(!self.hasStarted || !self.stationsAreChosen) {
        OriginTableViewController *originTableViewController = [[OriginTableViewController alloc] initWithStyle:UITableViewStylePlain];
        originTableViewController.delegate = self;
    
        [self.navigationController pushViewController:originTableViewController animated:YES];
    }
}

- (void) pickDestination {
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
    
    self.trip.departureTime = nil;
    self.trip.duration = 0;
    [self.tripProgress setProgress:0 animated:YES];
    
    self.hasStarted = NO;
    self.isPaused = NO;
    self.isFinished = NO;
    
    if(self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
        [self calculateTime];
    }
}

- (void) cancel {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    if(self.hasStarted && !self.stationsAreChosen) {
        [self.tripProgress setIndeterminate:1];
    }
}

- (void) viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
