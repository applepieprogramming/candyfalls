//
//  ViewController.h/Users/15cminer/Desktop/Xcode programs/Blocker Iphone/Blocker/ViewController.m
//  Blocker
//
//  Created by 15CMiner on 3/28/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>//;
#import <QuartzCore/QuartzCore.h>
#import "CatcherModel.h"
#import "Speed.h"
#import <AVFoundation/AVFoundation.h>






@interface ViewController : UIViewController <ADBannerViewDelegate>
{
    AVAudioPlayer * doughnutPlayer2;
    AVAudioPlayer * doughnutPlayer3;
    CatcherModel* gameModel;
    CADisplayLink* gameTimer;
    UIImageView* ball;
    UIImageView* paddle;
    UIImageView* broccoli;
    UIImageView* meat;
   // UIImageView* apple;
    UIImageView* carrot;
    UIImageView* fish;
    UIImageView* blueCandy;
    UIImageView* gummyBear;
    UIImageView* candyCorn;
    UIImageView* lollipop;
    UIImageView* cane;
    UIImageView* turnt;
    UIImageView* roll;
      UIImageView* roll2;
      UIImageView* roll3;
      UIImageView* roll4;
      UIImageView* roll5;
      UIImageView* roll6;
    UIImageView* superCandy;
      UIImageView* pressCandy;
     NSString *gameData;
    NSString *dataFile;
    NSString *stringScore;
    NSString *content;
    int* scores;
    Speed* speedy;
    BOOL sweet;
    int pro;
    int thisGameScore;
    int highScore;
    BOOL sweeter;
    ADBannerView *adView;
    BOOL bannerIsVisible;

}
-(void) updateDisplay: (CADisplayLink*) sender;
-(void) endGameWithMessage:(NSString*) message;
-(void) progressing;
- (NSString *)readFileWithName:(NSString *)fileName;
- (IBAction)mainMenu:(id)sender;

- (IBAction)playAgain:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *velocity;

@property (weak, nonatomic) IBOutlet UILabel *Counter;
@property (weak, nonatomic) IBOutlet UIProgressView *scoreBar;
@property (weak, nonatomic) IBOutlet UILabel *Lose;
@property (weak, nonatomic) IBOutlet UILabel *Win;
@property (weak, nonatomic) IBOutlet UILabel *fast;
@property (weak, nonatomic) IBOutlet UILabel *pressSlow;
@property (nonatomic,assign) BOOL bannerIsVisible;




@end
