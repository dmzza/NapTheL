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
	
    UILabel *originLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
    UILabel *destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 280, 40)];
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 280, 40)];
    UILabel *secondsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, 280, 40)];
//    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 380, 280, 40)];
    
    int timeRemaining = 0, dest = self.destination, orig = self.origin;
    int i;
    NSString *originName = self.durations[orig][@"name"], *destinationName = self.durations[dest][@"name"];
    
    if (self.origin < self.destination) { // eastbound
        for (i = orig + 1; i <= dest - 1; i++) {
            NSNumber *arrival = self.durations[i][@"eastBoundArrival"];
            NSNumber *doors = self.durations[i][@"eastBoundDoors"];
            timeRemaining += arrival.intValue + doors.intValue;
        }
        NSNumber *arrival = self.durations[dest][@"eastBoundArrival"];
        timeRemaining += arrival.intValue;
    } else { // westbound
        for (i = orig - 1; i >= dest + 1; i--) {
            NSNumber *arrival = self.durations[i][@"westBoundArrival"];
            NSNumber *doors = self.durations[i][@"westBoundDoors"];
            timeRemaining += arrival.intValue + doors.intValue;
        }
        NSNumber *arrival = self.durations[dest][@"westBoundArrival"];
        timeRemaining += arrival.intValue;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    NSDate *arrivalTime = [NSDate dateWithTimeIntervalSinceNow:timeRemaining];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:arrivalTime];
    
    originLabel.text = originName;
    destinationLabel.text = destinationName;
    timeLabel.text = formattedDateString;
    secondsLabel.text = [NSString stringWithFormat:@"Seconds: %d", timeRemaining];
    
    [self.view addSubview:originLabel];
    [self.view addSubview:destinationLabel];
    [self.view addSubview:timeLabel];
    [self.view addSubview:secondsLabel];
    
    UILocalNotification *arrivalAlarm = [[UILocalNotification alloc] init];
    arrivalAlarm.fireDate = arrivalTime;
    arrivalAlarm.alertBody = [NSString stringWithFormat:@"Approaching %@", self.durations[dest][@"name"]];
    arrivalAlarm.alertAction = @"Alarm";
    arrivalAlarm.soundName = @"subwayAlarm.m4a";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:arrivalAlarm];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
