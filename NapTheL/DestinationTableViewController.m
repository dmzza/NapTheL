//
//  DestinationTableViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "DestinationTableViewController.h"
#import "TripViewController.h"

@interface DestinationTableViewController ()

@end

@implementation DestinationTableViewController

- (id)initWithStyle:(UITableViewStyle)style
      originSection:(NSInteger *)anOriginSection
          originRow:(NSInteger *)anOriginRow
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
        self.originSection = anOriginSection;
        self.originRow = anOriginRow;
        self.title = @"To";
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
    if(indexPath.section == self.originSection && indexPath.row == self.originRow) {
        cell.backgroundView.backgroundColor = [UIColor yellowColor];
    } else {
        cell.backgroundView.backgroundColor = [UIColor whiteColor];
    }
    
    
    
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    int originRow = self.originRow;
    int originSection = self.originSection;
    NSString *origin = self.neighborhoods[originSection][@"stops"][originRow];
    
    //TripViewController *tripViewController = [[TripViewController alloc] initWithOrigin:self.neighborhoods[self.originSection][@"stops"][self.originRow] destination:neighborhoods[indexPath.section][@"stops"][indexPath.row]];
    TripViewController *tripViewController = [[TripViewController alloc] initWithOrigin:origin destination:self.neighborhoods[indexPath.section][@"stops"][indexPath.row]];
    
    [self.navigationController pushViewController:tripViewController animated:YES];
}

@end
