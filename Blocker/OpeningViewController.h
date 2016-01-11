//
//  OpeningViewController.h
//  Catcher
//
//  Created by Corey Miner on 5/29/14.
//  Copyright (c) 2014 15CMiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>//;
#import <QuartzCore/QuartzCore.h>
#import "CatcherModel.h"
#import "Speed.h"
#import <AVFoundation/AVFoundation.h>

@interface OpeningViewController : UIViewController {
     AVAudioPlayer * doughnutPlayer3;
}
- (IBAction)PlayDat:(id)sender;

@end
