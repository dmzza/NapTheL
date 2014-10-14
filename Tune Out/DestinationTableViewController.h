//
//  DestinationTableViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopTableViewController.h"

@interface DestinationTableViewController : StopTableViewController

@property (strong, nonatomic) NSString *origin;
-(id)initWithStyle:(UITableViewStyle)style origin:(NSString *)anOrigin;

@end
