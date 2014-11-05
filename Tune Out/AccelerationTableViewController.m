//
//  AccelerationTableViewController.m
//  Tune Out
//
//  Created by David Mazza on 11/5/14.
//  Copyright (c) 2014 Peaking. All rights reserved.
//

#import "AccelerationTableViewController.h"
#import "Acceleration.h"
#import "JBChartView/JBChartView.h"
#import "JBChartView/JBLineChartView.h"

@interface AccelerationTableViewController ()<JBLineChartViewDataSource, JBLineChartViewDelegate>

@end

@implementation AccelerationTableViewController

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
    return self.accelerations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accelerationCell" forIndexPath:indexPath];
    Acceleration *acceleration = (Acceleration *)[self.accelerations objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%.2f", acceleration.magnitude]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"x: %.2f y: %.2f z: %.2f", acceleration.x, acceleration.y, acceleration.z]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 320;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    JBLineChartView *lineChart = [[JBLineChartView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320)];
    
    [lineChart setDataSource:self];
    [lineChart setDelegate:self];
    [lineChart reloadData];
    
    return lineChart;
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

#pragma mark - JBLineChartView DataSource

- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView
{
    return 1;
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex
{
    return self.accelerations.count;
}

#pragma mark - JBLineChartView Delegate

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    Acceleration *acceleration = (Acceleration *)[self.accelerations objectAtIndex:horizontalIndex];
    
    switch (lineIndex) {
        case 0:
            return MIN(acceleration.magnitude, 0.3);
            break;
            
        default:
            return 0;
            break;
    }
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex
{
    return 1;
}

#pragma mark - FCModel

- (NSArray *)accelerations {
    if (_accelerations == nil) {
        _accelerations = [Acceleration instancesWhere:@"tripID = ? ORDER BY timestamp ASC", self.tripID];
    }
    
    return _accelerations;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
