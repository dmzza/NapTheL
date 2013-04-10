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
                           @"Union St - 14 St", @"name",
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
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 320, 300)];
    self.startButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 380, 300, 30)];
    
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
    
    
    
    //NSString *formattedDateString = [dateFormatter stringFromDate:self.arrivalTime];
    
    
    
    originLabel.text = originName;
    destinationLabel.text = destinationName;
    destinationLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.text = [NSString stringWithFormat:@"%d", (int)(self.timeRemaining / 60)];
    originLabel.backgroundColor = destinationLabel.backgroundColor = [UIColor clearColor];
    summaryBar.backgroundColor = [UIColor colorWithRed:0.055 green:0.788 blue:0.573 alpha:1.0];
    originLabel.font = destinationLabel.font = self.startButton.font = [UIFont fontWithName:@"Avenir" size:12];
    self.timeLabel.font = [UIFont fontWithName:@"Avenir-Black" size:320];
    self.timeLabel.textColor = [UIColor colorWithWhite:0.9 alpha:1.0]; //[UIColor colorWithRed:0.553 green:0.945 blue:0.831 alpha:1.0];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.adjustsFontSizeToFitWidth = YES;
    self.startButton.backgroundColor = [UIColor blackColor];
    
    [self.startButton setTitle:@"Start the clock on 'Stand Clear...'" forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startClock) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    [summaryBar addSubview:originLabel];
    [summaryBar addSubview:destinationLabel];
    [self.view addSubview:summaryBar];
    [self.view addSubview:self.timeLabel];
    
    [self.view addSubview:self.startButton];
    
    
}

- (void) startClock {
    UILabel *minutesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 380, 320, 40)];
    
    minutesLabel.text = @"minutes";
    minutesLabel.textAlignment = NSTextAlignmentCenter;
    minutesLabel.backgroundColor = [UIColor blackColor];
    minutesLabel.textColor = [UIColor whiteColor];
    minutesLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(updateClock)
                                                    userInfo:nil
                                                     repeats:YES];
    
    self.arrivalTime = [NSDate dateWithTimeIntervalSinceNow:self.timeRemaining];
    
    UILocalNotification *arrivalAlarm = [[UILocalNotification alloc] init];
    arrivalAlarm.fireDate = self.arrivalTime;
    arrivalAlarm.alertBody = [NSString stringWithFormat:@"Arriving in under 2 mins at %@", self.durations[(int)self.destination][@"name"]];
    arrivalAlarm.alertAction = @"Silence";
    arrivalAlarm.soundName = @"subwayAlarm.m4a";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:arrivalAlarm];
    
    self.timeLabel.textColor = [UIColor blackColor];
    
    [self.startButton removeFromSuperview];
    [self.view addSubview:minutesLabel];
}

- (void) updateClock {
    int minutes = (int)(self.arrivalTime.timeIntervalSinceNow / 60.0);
    if(minutes >= 2) {
        self.timeLabel.text = [NSString stringWithFormat:@"%d", minutes];
    }  else if (minutes > 0) {
        self.timeLabel.text = @"<2";
        [self.timer invalidate];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
