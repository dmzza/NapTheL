//
//  HomeViewController.m
//  NapTheL
//
//  Created by David Mazza on 4/22/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "HomeViewController.h"
#import "IPInsetLabel.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vintage_L_train.jpg"]];
    IPInsetLabel *introLabel = [[IPInsetLabel alloc] initWithFrame:CGRectMake(0, 250, 320, 100)];
    
    introLabel.text = @"Tune out while you ride the L. Never miss your stop again.";
    [introLabel setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
    introLabel.textColor = [UIColor whiteColor];
    [introLabel setLineBreakMode:NSLineBreakByWordWrapping];
    introLabel.numberOfLines = 3;
    [introLabel setTextAlignment:NSTextAlignmentCenter];
    introLabel.insets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    [background setCenter:CGPointMake(500, 250)];
    
    //CABasicAnimation *panningAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //panningAnimation.toValue =
    [UIView beginAnimations:@"translate" context:nil];
    [UIView setAnimationDuration:42.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    background.transform = CGAffineTransformMakeTranslation(-500, 0);
    
    [UIView commitAnimations];
    
    
    [self.view addSubview:background];
    [self.view addSubview:introLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
