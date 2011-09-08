//
//  MainViewController.m
//  Schuldenuhr
//
//  Created by Philip Brechler on 08.09.11.
//  Copyright 2011 Hoccer. All rights reserved.
//

#import "MainViewController.h"

#define SCHULDEN 63826570269.7
#define SCHULDENKOPF 18552.08
#define ZUWACHS 86.803843226788432267884322678843
#define STARTZEIT 1315305153

@implementation MainViewController

@synthesize zuwachsLabel,kopfLabel,schuldenLabel,startImage;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    zuwachsLabel.text = [self formatSchulden:ZUWACHS];
    currentSchulden = SCHULDEN + (([[NSDate date] timeIntervalSince1970]-STARTZEIT)*ZUWACHS);
    currentProKopf = currentSchulden/3468939;
    schuldenLabel.text = [self formatSchulden:currentSchulden];
    kopfLabel.text = [self formatSchulden:currentProKopf];
    
    schuldenTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeSchuldenLabel) userInfo:nil repeats:YES];
    
    startImageTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hideStartImage) userInfo:nil repeats:NO];
    
    [schuldenTimer fire];
}

- (void)changeSchuldenLabel {
    currentSchulden = currentSchulden + ZUWACHS;
    currentProKopf = currentSchulden/3468939;
    schuldenLabel.text = [self formatSchulden:currentSchulden];
    kopfLabel.text = [self formatSchulden:currentProKopf];
}

- (NSString *)formatSchulden:(double)schulden {
    
    NSNumber *number = [NSNumber numberWithDouble:schulden];
    NSNumberFormatter *frmtr = [[NSNumberFormatter alloc] init];
    [frmtr setGroupingSize:3];
    [frmtr setGroupingSeparator:@"."];
    [frmtr setUsesGroupingSeparator:YES];
    NSString *seperatedString = [frmtr stringFromNumber:number];

    return seperatedString;
}

- (void)hideStartImage {
    
    [startImageTimer invalidate];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [startImage setAlpha:0];
    [UIView commitAnimations];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [schuldenTimer invalidate];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [schuldenTimer invalidate];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [schuldenLabel release];
    [zuwachsLabel release];
    [startImage release];
    [kopfLabel release];
    [super dealloc];
}
@end
