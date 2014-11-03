//
//  HistoryTableViewController.m
//  Tune Out
//
//  Created by David Mazza on 11/2/14.
//  Copyright (c) 2014 Peaking. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "Trip.h"

@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Trip numberOfInstances];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tripHistoryCell" forIndexPath:indexPath];
  Trip *trip = (Trip *)[self.trips objectAtIndex:indexPath.row];
  
  cell.textLabel.text = [NSString stringWithFormat:@"%@ -> %@", trip.origin, trip.destination];
  cell.detailTextLabel.text = [trip.departureTime description];
  
  return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - FCModel

- (NSArray *)trips {
  if (_trips == nil) {
    _trips = [Trip instancesOrderedBy:@"departureTime DESC"];
  }
  
  return _trips;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Trip *trip = [self.trips objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    [(UITableViewController *)[segue destinationViewController] setTitle:[NSString stringWithFormat:@"%.2f mins", trip.duration/60.0]];
    [[(UITableViewController *)[segue destinationViewController] navigationItem] setPrompt:[NSString stringWithFormat:@"%@ > %@", trip.origin, trip.destination]];
    // Pass the selected object to the new view controller.
}

@end
