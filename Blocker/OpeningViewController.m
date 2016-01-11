//
//  OpeningViewController.m
//  Catcher
//
//  Created by Corey Miner on 5/29/14.
//  Copyright (c) 2014 15CMiner. All rights reserved.
//

#import "OpeningViewController.h"

@interface OpeningViewController ()

@end

@implementation OpeningViewController

- (void)viewDidLoad {
    NSURL * doughnutSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"blop" ofType:@"mp3"]];
    doughnutPlayer3 = [[AVAudioPlayer alloc] initWithContentsOfURL:doughnutSoundURL error:Nil];
}

- (IBAction)PlayDat:(id)sender {
    [doughnutPlayer3 play];
}
- (IBAction)Instructions:(id)sender {
    [doughnutPlayer3 play];
}
- (IBAction)continue1:(id)sender {
    [doughnutPlayer3 play];
}
- (IBAction)continue2:(id)sender {
    [doughnutPlayer3 play];
}
- (IBAction)continue3:(id)sender {
    [doughnutPlayer3 play];
}


@end
