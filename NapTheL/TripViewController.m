//
//  TripViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "TripViewController.h"

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

- (id)initWithOrigin:(NSString *)anOrigin
         destination:(NSString *)aDestination
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
        self.title = @"Trip";
        
        int i;
        for (i = 0; i < self.durations.count; i++) {
            NSString *name = self.durations[i][@"name"];
            
            if(name == anOrigin)
                self.origin = i;
            if(name == aDestination)
                self.destination = i;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIView *summaryBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    UILabel *originLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 140, 40)];
    UILabel *destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 20, 140, 40)];
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 380, 320, 40)];
    self.subtextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 320, 40)];
    
    
    // CALCULATE TIME REMAINING
    self.timeRemaining = 0;
    int dest = self.destination, orig = self.origin;
    int i;
    NSString *originName = self.durations[orig][@"name"], *destinationName = self.durations[dest][@"name"];
    
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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    // SUMMARY/ORIGIN/DEST
    originLabel.text = originName;
    destinationLabel.text = destinationName;
    destinationLabel.textAlignment = NSTextAlignmentRight;
    originLabel.textColor = destinationLabel.textColor = [UIColor whiteColor];
    originLabel.font = destinationLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    originLabel.backgroundColor = destinationLabel.backgroundColor = [UIColor clearColor];
    summaryBar.backgroundColor = [UIColor colorWithHue:0.6472 saturation:0.36 brightness:0.18 alpha:1.0];
    
    // START
    self.startButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:18];
    [self.startButton setFrame:CGRectMake(51, 115, 218, 218)];
    self.startButton.backgroundColor = [UIColor clearColor];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"startClock"] forState:UIControlStateNormal];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"startClock"] forState:UIControlStateHighlighted];
    [self.startButton setTitle:@"START THE CLOCK" forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startClock) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    // SUBTEXT
    self.subtextLabel.text = @"when the doors close";
    self.subtextLabel.textAlignment = NSTextAlignmentCenter;
    self.subtextLabel.backgroundColor = [UIColor clearColor];
    self.subtextLabel.textColor = [UIColor whiteColor];
    self.subtextLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    // CANCEL
    [self.cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    self.cancelButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.435 blue:0.404 alpha:1.0];
    self.cancelButton.titleLabel.textColor = [UIColor whiteColor];
    self.cancelButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    [self.cancelButton addTarget:self action:@selector(cancel) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    // SELF
    self.view.backgroundColor = [UIColor colorWithHue:0.6472 saturation:0.35 brightness:0.30 alpha:1.0];
    
    // SUBVIEWS
    [summaryBar addSubview:originLabel];
    [summaryBar addSubview:destinationLabel];
    [self.view addSubview:summaryBar];
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.cancelButton];
    [self.view addSubview:self.subtextLabel];
    
    
}

- (void) startClock {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
    self.arrivalTime = [NSDate dateWithTimeIntervalSinceNow:self.timeRemaining];
    UILocalNotification *arrivalAlarm = [[UILocalNotification alloc] init];
    
    // ARRIVAL ALARM
    arrivalAlarm.fireDate = self.arrivalTime;
    arrivalAlarm.alertBody = [NSString stringWithFormat:@"%@ is coming soon.", self.durations[(int)self.destination][@"name"]];
    arrivalAlarm.alertAction = @"Silence";
    arrivalAlarm.soundName = @"subwayAlarm.m4a";
    
    // START
    //self.startButton.userInteractionEnabled = NO;
    [self.startButton removeTarget:self action:@selector(startClock) forControlEvents:UIControlEventTouchDown];
    [self.startButton addTarget:self action:@selector(spin) forControlEvents:UIControlEventTouchDown];
    self.startButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:130.0];
    self.startButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    // SUBTEXT
    self.subtextLabel.text = @"minutes";
    [self.subtextLabel setFrame:CGRectMake(0, 280, 320, 40)];
    
    [self updateClock];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:arrivalAlarm];
}

- (void) updateClock {
    int minutes = (int)(self.arrivalTime.timeIntervalSinceNow / 60.0);
    if(minutes >= 2) {
        [self.startButton setTitle: [NSString stringWithFormat:@"%d", minutes] forState:UIControlStateNormal];
    } else if (minutes >= 0) {
        [self.startButton setTitle:@"!" forState:UIControlStateNormal];
        self.subtextLabel.text = @"arriving soon";
        [self.timer invalidate];
    }
}

- (void) spin {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1.0;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.startButton.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void) cancel {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) viewWillDisappear:(BOOL)animated {
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
