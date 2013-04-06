//
//  OriginTableViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "OriginTableViewController.h"
#import "DestinationTableViewController.h"

@interface OriginTableViewController ()

@end

@implementation OriginTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.neighborhoods = [NSArray arrayWithObjects:
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"Manhattan", @"name",
                               [UIImage imageNamed:@"manhattan.jpg"], @"image",
                               @[@"8 Av", @"6 Av", @"Union St - 14 St", @"3 Av", @"1 Av"], @"stops",
                               nil],
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"Williamsburg", @"name",
                               [UIImage imageNamed:@"williamsburg"], @"image",
                               @[@"Bedford Av", @"Lorimer St"], @"stops",
                               nil],
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"East Williamsburg", @"name",
                               [UIImage imageNamed:@"williamsburg"], @"image",
                               @[@"Graham Av", @"Grand St", @"Montrose Av", @"Morgan Av"], @"stops",
                               nil],
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"Bushwick", @"name",
                               [UIImage imageNamed:@"williamsburg"], @"image",
                               @[@"Jefferson St", @"DeKalb Av", @"Myrtle-Wyckoff Avs"], @"stops",
                               nil],
                              nil];
        self.title = @"From";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [self.navigationController.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.neighborhoods.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *stops = self.neighborhoods[section][@"stops"];
    return stops.count;
}

/*- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"14", @"WB" ,@"EW", @"BU", @"EN", @"CA"];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.neighborhoods[section][@"name"];
}*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //UILabel *neighborhood = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320.0, 80.0)];
    UITableViewCell *neighborhood = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320.0, 80.0)];
    
    neighborhood.textLabel.text = self.neighborhoods[section][@"name"];
    neighborhood.textLabel.textColor = [UIColor whiteColor];
    neighborhood.textLabel.textAlignment = NSTextAlignmentLeft;
    neighborhood.textLabel.shadowColor = [UIColor blackColor];
    neighborhood.textLabel.shadowOffset = CGSizeMake(1.0, 1.5);
    neighborhood.textLabel.font = [UIFont boldSystemFontOfSize:24.0];
    neighborhood.backgroundColor = [UIColor colorWithPatternImage:self.neighborhoods[section][@"image"]];
    return neighborhood;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSArray *stops = self.neighborhoods[indexPath.section][@"stops"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = stops[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Book" size:14.0];
    cell.backgroundColor = [UIColor blackColor];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DestinationTableViewController *destinationTableViewController = [[DestinationTableViewController alloc] initWithStyle:UITableViewStylePlain originSection:indexPath.section originRow:indexPath.row];
    
    [self.navigationController pushViewController:destinationTableViewController animated:YES];
}

@end
