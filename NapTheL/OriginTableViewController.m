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
        self.title = @"From";
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
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DestinationTableViewController *destinationTableViewController = [[DestinationTableViewController alloc] initWithStyle:UITableViewStylePlain originSection:indexPath.section originRow:indexPath.row];
    
    [self.navigationController pushViewController:destinationTableViewController animated:YES];
}

@end
