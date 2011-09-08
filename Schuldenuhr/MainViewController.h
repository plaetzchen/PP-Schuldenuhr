//
//  MainViewController.h
//  Schuldenuhr
//
//  Created by Philip Brechler on 08.09.11.
//  Copyright 2011 Hoccer. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    
    IBOutlet UILabel *schuldenLabel;
    IBOutlet UILabel *kopfLabel;
    IBOutlet UILabel *zuwachsLabel;
    IBOutlet UIImageView *startImage;

    NSTimer *schuldenTimer;
    NSTimer *startImageTimer;
    
    double currentSchulden;
    double currentProKopf;

}

@property (nonatomic,retain) IBOutlet UILabel *schuldenLabel;
@property (nonatomic,retain) IBOutlet UILabel *kopfLabel;
@property (nonatomic,retain) IBOutlet UILabel *zuwachsLabel;
@property (nonatomic,retain) IBOutlet UIImageView *startImage;

- (IBAction)showInfo:(id)sender;

- (void)changeSchuldenLabel;
- (NSString *)formatSchulden:(double)schulden;
- (void)hideStartImage;
@end
