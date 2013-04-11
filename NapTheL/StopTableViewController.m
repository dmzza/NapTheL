//
//  StopTableViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/7/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "StopTableViewController.h"

@interface StopTableViewController ()

@end

@implementation StopTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.neighborhoods = [NSArray arrayWithObjects:
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"Manhattan", @"name",
                               [UIImage imageNamed:@"manhattan"], @"image",
                               @[@"8 Av", @"6 Av", @"Union Sq - 14 St", @"3 Av", @"1 Av"], @"stops",
                               nil],
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"Williamsburg", @"name",
                               [UIImage imageNamed:@"williamsburg"], @"image",
                               @[@"Bedford Av", @"Lorimer St"], @"stops",
                               nil],
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"East Williamsburg", @"name",
                               [UIImage imageNamed:@"eastwilliamsburg"], @"image",
                               @[@"Graham Av", @"Grand St", @"Montrose Av", @"Morgan Av"], @"stops",
                               nil],
                              [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"Bushwick", @"name",
                               [UIImage imageNamed:@"bushwick"], @"image",
                               @[@"Jefferson St", @"DeKalb Av", @"Myrtle-Wyckoff Avs"], @"stops",
                               nil],
                              nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setSeparatorColor:[UIColor colorWithHue:0.6472 saturation:0.35 brightness:0.30 alpha:1.0]];
    self.tableView.backgroundColor = [UIColor colorWithHue:0.6472 saturation:0.36 brightness:0.18 alpha:1.0];
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
    UITableViewCell *neighborhood = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320.0, 80.0)];
    
    neighborhood.textLabel.text = self.neighborhoods[section][@"name"];
    neighborhood.textLabel.textColor = [UIColor whiteColor];
    neighborhood.textLabel.backgroundColor = [UIColor clearColor];
    neighborhood.textLabel.textAlignment = NSTextAlignmentLeft;
    neighborhood.textLabel.shadowColor = [UIColor blackColor];
    neighborhood.textLabel.shadowOffset = CGSizeMake(1.0, 1.5);
    neighborhood.textLabel.font = [UIFont boldSystemFontOfSize:24.0];
    neighborhood.backgroundView = [[UIImageView alloc] initWithImage:self.neighborhoods[section][@"image"]];
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
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor colorWithHue:0.6472 saturation:0.36 brightness:0.18 alpha:1.0];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
