//
//  BallsAndPaddles.h
//  Blocker
//
//  Created by 15CMiner on 4/24/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BallsAndPaddles : ViewController.h {
    UIImageView* ball;
    UIImageView* paddle;
}
- (IBAction)SnowMountain:(id)sender;
- (IBAction)CandyLand:(id)sender;
- (IBAction)Beach:(id)sender;
- (IBAction)Regular:(id)sender;

@end
