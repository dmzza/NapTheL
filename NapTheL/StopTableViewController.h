//
//  StopTableViewController.h
//  NapTheL
//
//  Created by David Mazza on 4/7/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAI.h"

@class StopTableViewController;

@protocol StopTableViewControllerDelegate <NSObject>
- (void)setStopViewController:(StopTableViewController *)controller didFinishSelectingStop:(NSString *)stop which:(BOOL)isOrigin;

@end

@interface StopTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *neighborhoods;
@property (nonatomic, weak) id <StopTableViewControllerDelegate> delegate;

@end

