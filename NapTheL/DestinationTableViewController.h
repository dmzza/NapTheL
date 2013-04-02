//
//  DestinationTableViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinationTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *stops;
@property NSInteger *origin;
-(id)initWithStyle:(UITableViewStyle)style origin:(NSInteger *)anOrigin;

@end
