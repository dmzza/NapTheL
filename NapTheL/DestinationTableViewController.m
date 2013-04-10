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
      originSection:(int)anOriginSection
          originRow:(int)anOriginRow
{
    self = [super initWithStyle:style];
    if (self) {
        self.originSection = anOriginSection;
        self.originRow = anOriginRow;
        self.title = @"To";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    if(indexPath.section == self.originSection && indexPath.row == self.originRow) {
        cell.contentView.backgroundColor = self.tableView.separatorColor;
        cell.userInteractionEnabled = NO;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int originRow = self.originRow;
    int originSection = self.originSection;
    NSString *origin = self.neighborhoods[originSection][@"stops"][originRow];
    
    TripViewController *tripViewController = [[TripViewController alloc] initWithOrigin:origin destination:self.neighborhoods[indexPath.section][@"stops"][indexPath.row]];
    
    [self.navigationController pushViewController:tripViewController animated:YES];
}

@end
