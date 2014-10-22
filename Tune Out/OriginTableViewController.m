//
//  OriginTableViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/2/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "OriginTableViewController.h"
#import "DestinationTableViewController.h"
#import "UIColor+CustomColors.h"
#import "UIImage+withColor.h"
#import <GAI.h>
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

@interface OriginTableViewController ()

@end

@implementation OriginTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"FROM";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *backButtonBackground = [UIImage imageWithColor:[UIColor darkerBlueGrayColor]];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStyleDone target:nil action:nil];
    [backButton setBackButtonBackgroundImage:backButtonBackground forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Quicksand-Bold" size:20.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    [[self navigationItem] setBackBarButtonItem:backButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor darkBlueGrayColor]] forBarMetrics:UIBarMetricsDefault];
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    // manual screen tracking
    [tracker set:kGAIScreenName
           value:@"Origin Screen"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
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
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *stop = self.neighborhoods[indexPath.section][@"stops"][indexPath.row];
    
    [self.delegate setStopViewController:self didFinishSelectingStop:stop which:YES];
}

@end
