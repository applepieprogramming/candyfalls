//
//  CatcherModel.h
//  Blocker
//
//  Created by 15CMiner on 4/1/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Speed.h"
#import <AVFoundation/AVFoundation.h>


#define SIZE 20

#define VIEW_WIDTH 320
#define VIEW_HEIGHT 460



@interface CatcherModel : NSObject {
    AVAudioPlayer * doughnutPlayer;
    AVAudioPlayer * doughnutPlayer2;
    CGRect rollRect2;
    //CGPoint rollVelocity2;
    CGRect rollRect3;
    //CGPoint rollVelocity3;
    CGRect rollRect4;
    //CGPoint rollVelocity4;
    CGRect rollRect5;
    //CGPoint rollVelocity5;
    CGRect rollRect6;
    //CGPoint rollVelocity6;
    CGRect pressCandyRect;
    CGPoint _pressCandyVelocity;
    CGRect paddleRect;
    CGRect ballRect;
    CGRect meatRect;
    CGRect broccoliRect;
    CGRect rollRect;
    CGRect turntRect;
    CGRect caneRect;
    CGRect superCandyRect;
    CGRect gummyBearRect;
    CGRect candyCornRect;
    CGRect lollipopRect;
    CGRect fishRect;
  //  CGRect appleRect;
    CGRect carrotRect;
    CGRect blueCandyRect;
    CGPoint ballVelocity;
    /*CGPoint meatVelocity;
    CGPoint caneVelocity;
    CGPoint rollVelocity;
    CGPoint broccoliVelocity;
    CGPoint superCandyVelocity;
    CGPoint gummyBearVelocity;
    CGPoint candyCornVelocity;
    CGPoint lollipopVelocity;
    CGPoint turntVelocity;
    //CGPoint fishVelocity;
    CGPoint appleVelocity;
    CGPoint carrotVelocity;
    CGPoint blueCandyVelocity;
    */
    CGFloat lastTime;
    CGFloat timeDelta;
    int lives;
    int score;
    int laterY1;
    int laterY2;
    int laterX1;
    int laterX2;
    int laterX3;
    int slow;
    int velocity;
   // int velocity2;
    int pressCandy;
    Speed* speedy;
    int progress;
    int startPosition;
    NSArray *food;
    NSArray *images;
    int start;
    int start2;
    
   
}

@property (readonly) CGRect ballRect;
@property CGRect paddleRect;
@property CGRect meatRect;
@property CGRect broccoliRect;
@property CGRect rollRect;
@property CGRect caneRect;
@property CGRect superCandyRect;
@property CGPoint ballVelocity;
@property CGPoint meatVelocity;
@property CGPoint caneVelocity;
@property CGPoint rollVelocity;
@property CGPoint broccoliVelocity;
@property CGPoint superCandyVelocity;
@property CGPoint turntVelocity;
@property CGRect turntRect;

@property CGRect blueCandyRect;
@property CGPoint blueCandyVelocity;
@property CGRect gummyBearRect;
@property CGPoint gummyBearVelocity;
@property CGRect candyCornRect;
@property CGPoint candyCornVelocity;
@property CGRect lollipopRect;
@property CGPoint lollipopVelocity;
@property CGRect fishRect;
@property CGPoint fishVelocity;
//@property CGRect appleRect;
//@property CGPoint appleVelocity;
@property CGRect carrotRect;
@property CGPoint carrotVelocity;

@property CGRect rollRect2;
@property CGPoint rollVelocity2;
@property CGRect rollRect3;
@property CGPoint rollVelocity3;
@property CGRect rollRect4;
@property CGPoint rollVelocity4;
@property CGRect rollRect5;
@property CGPoint rollVelocity5;
@property CGRect rollRect6;
@property CGPoint rollVelocity6;

@property CGRect pressCandyRect;
@property CGPoint pressCandyVelocity;

@property int velocity;
@property int velocity2;
@property int progress;
@property int pressCandy;

-(void) updateModelWithTime: (CFTimeInterval) timestamp;
-(void) checkCollisionWithScreenEdges;
-(void) checkCollisionWithPaddle;
-(void) setCounter:(int) value;
-(void) changeCounter:(int) amount;
-(int) getCounter;
-(void) setScore:(int) value;
-(int) getTime;
-(void) changeScore:(int) amount;
-(int) getScore;
-(int) getPress;
-(void) checkCollisionWithCandy;
-(void) getRandomNumbers;


@end
