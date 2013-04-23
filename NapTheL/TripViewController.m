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
    self = [super initWithNibName:nil bundle:nil];
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
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor tripInProgressColor]] forBarMetrics:UIBarMetricsDefault];
	
    UIButton *summaryBar = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    self.originButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 270, 50)];
    self.destinationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 270, 50)];
    self.swapButton = [[UIButton alloc] initWithFrame:CGRectMake(245, 25, 100, 50)];
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clockView = [[UIView alloc] initWithFrame:CGRectMake(51, 135, 218, 218)];
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 380, 320, 40)];
    self.subtextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, 218, 40)];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    // SUMMARY/ORIGIN/DEST/SWAP
    [self.originButton setTitle:[NSString stringWithFormat:@"FROM"] forState:UIControlStateNormal];
    [self.destinationButton setTitle:[NSString stringWithFormat:@"TO"] forState:UIControlStateNormal];
    self.originButton.titleEdgeInsets = self.destinationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    self.originButton.contentHorizontalAlignment = self.destinationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.originButton.titleLabel.textColor = self.destinationButton.titleLabel.textColor = [UIColor whiteColor];
    //NSLog(@"font names: %@", [UIFont fontNamesForFamilyName:@"Quicksand"]);
    self.originButton.titleLabel.font = self.destinationButton.titleLabel.font = [UIFont fontWithName:@"Quicksand-Regular" size:17.0];
    self.originButton.backgroundColor = self.destinationButton.backgroundColor = [UIColor darkAquaColor];
    [self.originButton addTarget:self action:@selector(pickOrigin) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [self.destinationButton addTarget:self action:@selector(pickDestination) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    self.swapButton.titleLabel.font = [UIFont fontWithName:@"Sosa-Regular" size:30.0];
    self.swapButton.transform = CGAffineTransformMakeRotation(M_PI_2);
    [self.swapButton setTitle:@"U" forState:UIControlStateNormal];
    self.swapButton.backgroundColor = [UIColor darkerBlueGrayColor];
    resetButton.frame = CGRectMake(260, 0, 60, 60);
    [resetButton setTitle:@"x" forState:UIControlStateNormal];
    resetButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:36];
    resetButton.backgroundColor = [UIColor blackColor];
    summaryBar.backgroundColor = [UIColor colorWithHue:0.6472 saturation:0.36 brightness:0.18 alpha:1.0];
    
    
    // START
    self.startButton.titleLabel.font = [UIFont fontWithName:@"Linecons" size:90.0]; //[UIFont fontWithName:@"Avenir" size:18];
    [self.startButton setFrame:self.clockView.bounds];
    self.startButton.backgroundColor = [UIColor clearColor];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"startClock"] forState:UIControlStateNormal];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"startClock"] forState:UIControlStateHighlighted];
    [self.startButton setTitle:@"" forState:UIControlStateNormal];
    //[self.startButton setImage:[UIImage imageNamed:@"glyphicons_053_alarm"] forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startClock) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    // SUBTEXT
    self.subtextLabel.text = @"when the doors close";
    self.subtextLabel.textAlignment = NSTextAlignmentCenter;
    self.subtextLabel.backgroundColor = [UIColor clearColor];
    self.subtextLabel.textColor = [UIColor whiteColor];
    self.subtextLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    // CANCEL
    [self.cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    self.cancelButton.backgroundColor = [UIColor flatRedColor];
    self.cancelButton.titleLabel.textColor = [UIColor whiteColor];
    self.cancelButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    [self.cancelButton addTarget:self action:@selector(cancel) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    // SELF
    self.view.backgroundColor = [UIColor darkBlueGrayColor];
    
    // SUBVIEWS
    [self.view addSubview:self.originButton];
    [self.view addSubview:self.destinationButton];
    [self.view addSubview:self.swapButton];
    [summaryBar addSubview:resetButton];
    [self.clockView addSubview:self.startButton];
    [self.clockView addSubview:self.subtextLabel];
    //[self.view addSubview:summaryBar];
    [self.view addSubview:self.clockView];
    //[self.view addSubview:self.cancelButton];
    
    
}

- (void) setStopViewController:(id)controller didFinishSelectingStop:(NSString *)stop which:(BOOL)isOrigin {
    if(isOrigin) {
        self.trip.origin = stop;
        [self.originButton setTitle:[NSString stringWithFormat:@"FROM %@", stop] forState:UIControlStateNormal];
        if(self.trip.destination == nil) { // no destination chosen yet
            [self pickDestination];
        } else { // destination chosen
            [self.navigationController popToRootViewControllerAnimated:YES];
            if(self.trip.departureTime != nil) { // and trip is already in progress
                [self endTrip];
            }
        }
    } else { // is destination
        self.trip.destination = stop;
        [self.destinationButton setTitle:[NSString stringWithFormat:@"TO %@", stop] forState:UIControlStateNormal];
        if(self.trip.departureTime != nil) { // trip is in progress
            [[UIApplication sharedApplication] cancelAllLocalNotifications];
            self.timer = nil;
            [self calculateTime];
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
    
    // CALCULATE TIME REMAINING
    self.timeRemaining = 0;
    if(self.trip.departureTime != nil) {
        self.timeRemaining = self.trip.departureTime.timeIntervalSinceNow;
    }
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
    
    if(self.trip.departureTime != nil) {
        [self setAlarm];
    }
}

- (void) startClock {
    self.trip.departureTime = [NSDate dateWithTimeIntervalSinceNow:0];
    
    // START
    [self.startButton removeTarget:self action:@selector(startClock) forControlEvents:UIControlEventTouchDown];
    [self.startButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchDown];
    self.startButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    // SUBTEXT
    //[self spinWithTitle:[NSString stringWithFormat:@"%d", (int)(self.arrivalTime.timeIntervalSinceNow / 60.0)] subtext:@"minutes"];
    [self spinWithTitle:@"O" subtext:@"" titleFont:[UIFont fontWithName:@"Sosa-Regular" size:100.0] backgroundColor:[UIColor tripInProgressColor]];
    
    if(self.timeRemaining <= 0) {
        [self pickOrigin];
    } else {
        [self setAlarm];
    }
}

- (void) setAlarm {
    if(self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
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
    int minutes = (int)(self.arrivalTime.timeIntervalSinceNow / 60.0);
    if(minutes >= 2) {
        //[self.startButton setTitle: [NSString stringWithFormat:@"%d", minutes] forState:UIControlStateNormal];
        self.subtextLabel.text = [NSString stringWithFormat:@"%f", self.arrivalTime.timeIntervalSinceNow];
    } else if (minutes > 0) {
        self.view.backgroundColor = [UIColor arrivingSoonColor];
        self.subtextLabel.text = @"arriving soon";
    } else {
        [self spinWithTitle:@"" subtext:@"end trip" titleFont:[UIFont fontWithName:@"Linecons" size:90.0] backgroundColor:[UIColor darkAquaColor]];
        [self.startButton removeTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchDown];
        [self.startButton addTarget:self action:@selector(endTrip) forControlEvents:UIControlEventTouchDown];
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
    [UIView animateWithDuration:0.25 animations:^{
        self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(M_PI_2, 0, 1, 0), 1.25, 1.25, 1.25);
    } completion:^(BOOL finished) {
        [self.startButton setTitle:aTitle forState:UIControlStateNormal];
        [self.startButton setImage:nil forState:UIControlStateNormal];
        self.subtextLabel.text = aSubtext;
        self.startButton.titleLabel.font = aTitleFont;
        [self.subtextLabel setFrame:CGRectMake(0, 170, 218, 40)];
        self.view.backgroundColor = aBackgroundColor;
        [UIView animateWithDuration:0.25 animations:^{
            self.clockView.layer.transform = CATransform3DScale(CATransform3DMakeRotation(0, 0, 1, 0), 1.0, 1.0, 1.0);
        }];
    }];
}

- (void) pickOrigin {
    OriginTableViewController *originTableViewController = [[OriginTableViewController alloc] initWithStyle:UITableViewStylePlain];
    originTableViewController.delegate = self;
    [self.navigationController pushViewController:originTableViewController animated:YES];
}

- (void) pickDestination {
    DestinationTableViewController *destinationTableViewController = [[DestinationTableViewController alloc] initWithStyle:UITableViewStylePlain origin:self.trip.origin];
    destinationTableViewController.delegate = self;
    [self.navigationController pushViewController:destinationTableViewController animated:YES];
}

- (void) pause {
    [self spinWithTitle:@"N" subtext:@"resume" titleFont:[UIFont fontWithName:@"Sosa-Regular" size:100.0] backgroundColor:[UIColor tripInProgressColor]];
    [self.startButton removeTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchDown];
    [self.startButton addTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchDown];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    self.timeRemaining = self.arrivalTime.timeIntervalSinceNow;
    [self.timer invalidate];
    self.timer = nil;
}

- (void) resume {
    [self spinWithTitle:@"O" subtext:@"" titleFont:[UIFont fontWithName:@"Sosa-Regular" size:100.0] backgroundColor:[UIColor tripInProgressColor]];
    [self.startButton removeTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchDown];
    [self.startButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchDown];
    
    [self setAlarm];
}

- (void) endTrip {
    [self spinWithTitle:@"" subtext:@"" titleFont:[UIFont fontWithName:@"Linecons" size:90.0] backgroundColor:[UIColor darkBlueGrayColor]];
    [self.startButton removeTarget:self action:@selector(endTrip) forControlEvents:UIControlEventTouchDown];
    [self.startButton addTarget:self action:@selector(startClock) forControlEvents:UIControlEventTouchDown];
    
    self.trip.departureTime = nil;
    self.timer = nil;
    [self calculateTime];
}

- (void) cancel {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
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
