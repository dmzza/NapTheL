//
//  DestinationTableViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "DestinationTableViewController.h"
#import "TripViewController.h"
#import "UIColor+CustomColors.h"
#import "UIImage+withColor.h"

@interface DestinationTableViewController ()

@end

@implementation DestinationTableViewController

- (id)initWithStyle:(UITableViewStyle)style
             origin:(NSString *)anOrigin
{
    self = [super initWithStyle:style];
    if (self) {
        self.origin = anOrigin;
        self.title = @"TO";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor darkBlueGrayColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor flatRedColor]] forBarMetrics:UIBarMetricsDefault];
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
    
    if([cell.textLabel.text isEqualToString:self.origin]) {
        cell.contentView.backgroundColor = self.tableView.separatorColor;
        cell.userInteractionEnabled = NO;
    } else {
        cell.userInteractionEnabled = YES;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *stop = self.neighborhoods[indexPath.section][@"stops"][indexPath.row];
    
    [self.delegate setStopViewController:self didFinishSelectingStop:stop which:NO];
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}

@end
