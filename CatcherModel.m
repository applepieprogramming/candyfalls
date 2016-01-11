//
//  CatcherModel.m
//  Blocker
//
//  Created by 15CMiner on 4/1/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import "CatcherModel.h"

@implementation CatcherModel
@synthesize ballRect,paddleRect, velocity, progress, rollRect, broccoliRect, meatRect, caneRect, superCandyRect, ballVelocity, carrotRect, gummyBearRect, fishRect, blueCandyRect, candyCornRect, lollipopRect, turntRect, rollRect2, rollRect3, rollRect4, rollRect5, rollRect6, pressCandyRect, pressCandy;


- (id)init {

    
    // ______________add sound-------------------------
    NSURL * doughnutSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"eating" ofType:@"mp3"]];
    doughnutPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:doughnutSoundURL error:Nil];
    
    NSURL * doughnutSoundURL2 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"magic" ofType:@"mp3"]];
    doughnutPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:doughnutSoundURL2 error:Nil];
    
    self = [super init];
 
    if(self) {
        
        
        
        //UIImage* paddleImage = [UIImage imageNamed:@"paddle.png"];
 
        //CGSize paddleSize = [paddleImage size];
        paddleRect = CGRectMake(0, 350, 60, 30);
        
        UIImage * superCandyImage = [UIImage imageNamed:@"superCandy3.png"];
        CGSize superCandySize = [superCandyImage size];
        superCandyRect = CGRectMake(150, -7000, superCandySize.width, superCandySize.height);
        
        UIImage * turntImage = [UIImage imageNamed:@"turntUp.png"];
        CGSize turntSize = [turntImage size];
        turntRect = CGRectMake(150, -4000, turntSize.width, turntSize.height);
        
     
        
      
         rollRect = [self makeRect:@"roll.png" andStartPoint:0];     //just building rects and placing them on the screen
         ballRect = [self makeRect:@"ball.png" andStartPoint:100];
         caneRect = [self makeRect:@"cane.png" andStartPoint:375];
         broccoliRect = [self makeRect:@"broccoli.png" andStartPoint:170];
         meatRect = [self makeRect:@"meaty.png" andStartPoint:300];
        
        
        candyCornRect = [self makeRect:@"candycorn.gif" andStartPoint:500];
        fishRect = [self makeRect:@"fish.gif" andStartPoint:1400];
        gummyBearRect = [self makeRect:@"greenbear.gif" andStartPoint:7000];
        // appleRect = [self makeRect:@"greenapple.gif" andStartPoint:10000];
        lollipopRect = [self makeRect:@"greenpurplelolli.gif" andStartPoint:15000];
        carrotRect = [self makeRect:@"carrot.gif" andStartPoint:20000];
        blueCandyRect = [self makeRect:@"bluecandy.gif" andStartPoint:25000];
        
        rollRect2 = [self makeRect:@"roll2.png" andStartPoint:200000];
        rollRect3 = [self makeRect:@"roll3.png" andStartPoint:200000];
        rollRect4 = [self makeRect:@"roll4.png" andStartPoint:200000];
        rollRect5 = [self makeRect:@"roll5.png" andStartPoint:200000];
        rollRect6 = [self makeRect:@"roll6.png" andStartPoint:200000];
        
        pressCandyRect = [self makeRect:@"pressCandy" andStartPoint:8000];
        
      /*  ballVelocity = CGPointMake(0, velocity);
        caneVelocity = CGPointMake(0, velocity);
        rollVelocity = CGPointMake(0, velocity);
        meatVelocity = CGPointMake(0, velocity);
        superCandyVelocity = CGPointMake(0, velocity);
        broccoliVelocity = CGPointMake(0, velocity);
        gummyBearVelocity = CGPointMake(0, velocity);
        candyCornVelocity = CGPointMake(0, velocity);
        lollipopVelocity = CGPointMake(0, velocity);
        blueCandyVelocity = CGPointMake(0, velocity);
        _fishVelocity = CGPointMake(0, velocity);
        appleVelocity = CGPointMake(0, velocity);
        carrotVelocity = CGPointMake(0, velocity);
        turntVelocity = CGPointMake(0, velocity);
        
        rollVelocity2 = CGPointMake(0, velocity);
        rollVelocity3 = CGPointMake(0, velocity);
        rollVelocity4 = CGPointMake(0, velocity);
        rollVelocity5 = CGPointMake(0, velocity);
        rollVelocity6 = CGPointMake(0, velocity);
        */
        lastTime= 0;
        
        lives = 3;
        score = 0;
        velocity = 75;
        _velocity2 = 0;
        pressCandy = 0;
        startPosition = 0;
        laterY1 = 20;
        laterY2 = 45;
        laterX1 = 13;
        laterX2 = 20;
        laterX3 = 20;

        
    }
          return self;
    
}

-(CGRect) makeRect:(NSString*) inString andStartPoint: (int) SP {
    int start3 = ((arc4random()%14)*20)+20;
    int start4 = (arc4random()%5)*10;

    UIImage* tmpImage = [UIImage imageNamed:inString];
    CGSize tmpSize = [tmpImage size];
    return CGRectMake(start3, (-start4 - SP), tmpSize.width, tmpSize.height);
}


-(void) checkCollisionWithScreenEdges {
    

    if (superCandyRect.origin.y >= paddleRect.origin.y + SIZE)
    {
        
        [self getRandomNumbers];
        superCandyRect.origin.x = start;
        superCandyRect.origin.y = startPosition - (7000 + (start2));
    }
    
    if (turntRect.origin.y >= paddleRect.origin.y + SIZE)
    {
        [self getRandomNumbers];
        turntRect.origin.x = start;
        turntRect.origin.y = startPosition - (7000 + (start2));
        score = score + 1000;
        
        
    }
    
    ballRect = [self checkBottomCandy:ballRect];
    blueCandyRect = [self checkBottomCandy:blueCandyRect];
    rollRect = [self checkBottomCandy:rollRect];
    caneRect = [self checkBottomCandy:caneRect];
    gummyBearRect = [self checkBottomCandy:gummyBearRect];
    candyCornRect = [self checkBottomCandy:candyCornRect];
    lollipopRect = [self checkBottomCandy:lollipopRect];
    
    meatRect=[self checkBottomOther:meatRect];
    broccoliRect=[self checkBottomOther:broccoliRect];
  //  appleRect=[self checkBottomOther:appleRect];
    carrotRect=[self checkBottomOther:carrotRect];
    fishRect=[self checkBottomOther:fishRect];
    
    rollRect6=[self rolls:rollRect6];
    rollRect5=[self rolls:rollRect5];
    rollRect4=[self rolls:rollRect4];
    rollRect3=[self rolls:rollRect3];
    rollRect2=[self rolls:rollRect2];
    
    food = @[];
  /*
    for ( CGRect thing1 in food)
    {
        for (CGRect thing2 in food) {
            [self checkTwoObjects:thing1 andObj:thing2];
        }
    }
   */
   }

-(void) checkCollisionWithCandy {
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:carrotRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:meatRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:caneRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:rollRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:ballRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:gummyBearRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:superCandyRect];
   // broccoliRect = [self checkTwoObjects:broccoliRect andObj:appleRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:fishRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:blueCandyRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:lollipopRect];
    broccoliRect = [self checkTwoObjects:broccoliRect andObj:candyCornRect];
    
    meatRect = [self checkTwoObjects:meatRect andObj:candyCornRect];
    meatRect = [self checkTwoObjects:meatRect andObj:caneRect];
    meatRect = [self checkTwoObjects:meatRect andObj:rollRect];
    meatRect = [self checkTwoObjects:meatRect andObj:ballRect];
    meatRect = [self checkTwoObjects:meatRect andObj:gummyBearRect];
  //  meatRect = [self checkTwoObjects:meatRect andObj:appleRect];
    meatRect = [self checkTwoObjects:meatRect andObj:superCandyRect];
    meatRect = [self checkTwoObjects:meatRect andObj:fishRect];
    meatRect = [self checkTwoObjects:meatRect andObj:carrotRect];
    meatRect = [self checkTwoObjects:meatRect andObj:lollipopRect];
    meatRect = [self checkTwoObjects:meatRect andObj:blueCandyRect];
    
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:caneRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:rollRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:ballRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:gummyBearRect];
   // candyCornRect = [self checkTwoObjects:candyCornRect andObj:appleRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:superCandyRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:fishRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:carrotRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:lollipopRect];
    candyCornRect = [self checkTwoObjects:candyCornRect andObj:blueCandyRect];
    
    caneRect = [self checkTwoObjects:caneRect andObj:rollRect];
    caneRect = [self checkTwoObjects:caneRect andObj:ballRect];
    caneRect = [self checkTwoObjects:caneRect andObj:gummyBearRect];
  //  caneRect = [self checkTwoObjects:caneRect andObj:appleRect];
    caneRect = [self checkTwoObjects:caneRect andObj:superCandyRect];
    caneRect = [self checkTwoObjects:caneRect andObj:fishRect];
    caneRect = [self checkTwoObjects:caneRect andObj:carrotRect];
    caneRect = [self checkTwoObjects:caneRect andObj:lollipopRect];
    caneRect = [self checkTwoObjects:caneRect andObj:blueCandyRect];
    
    rollRect = [self checkTwoObjects:rollRect andObj:ballRect];
    rollRect = [self checkTwoObjects:rollRect andObj:gummyBearRect];
   // rollRect = [self checkTwoObjects:rollRect andObj:appleRect];
    rollRect = [self checkTwoObjects:rollRect andObj:superCandyRect];
    rollRect = [self checkTwoObjects:rollRect andObj:fishRect];
    rollRect = [self checkTwoObjects:rollRect andObj:carrotRect];
    rollRect = [self checkTwoObjects:rollRect andObj:lollipopRect];
    rollRect = [self checkTwoObjects:rollRect andObj:blueCandyRect];
    
    ballRect = [self checkTwoObjects:ballRect andObj:gummyBearRect];
   // ballRect = [self checkTwoObjects:ballRect andObj:appleRect];
    ballRect = [self checkTwoObjects:ballRect andObj:superCandyRect];
    ballRect = [self checkTwoObjects:ballRect andObj:fishRect];
    ballRect = [self checkTwoObjects:ballRect andObj:carrotRect];
    ballRect = [self checkTwoObjects:ballRect andObj:lollipopRect];
    ballRect = [self checkTwoObjects:ballRect andObj:blueCandyRect];
    
    //gummyBearRect = [self checkTwoObjects:gummyBearRect andObj:appleRect];
    gummyBearRect = [self checkTwoObjects:gummyBearRect andObj:superCandyRect];
    gummyBearRect = [self checkTwoObjects:gummyBearRect andObj:fishRect];
    gummyBearRect = [self checkTwoObjects:gummyBearRect andObj:carrotRect];
    gummyBearRect = [self checkTwoObjects:gummyBearRect andObj:lollipopRect];
    gummyBearRect = [self checkTwoObjects:gummyBearRect andObj:blueCandyRect];
    /*
    appleRect = [self checkTwoObjects:appleRect andObj:superCandyRect];
    appleRect = [self checkTwoObjects:appleRect andObj:fishRect];
    appleRect = [self checkTwoObjects:appleRect andObj:carrotRect];
    appleRect = [self checkTwoObjects:appleRect andObj:lollipopRect];
    appleRect = [self checkTwoObjects:appleRect andObj:blueCandyRect];
    */
    superCandyRect = [self checkTwoObjects:superCandyRect andObj:fishRect];
    superCandyRect = [self checkTwoObjects:superCandyRect andObj:carrotRect];
    superCandyRect = [self checkTwoObjects:superCandyRect andObj:lollipopRect];
    superCandyRect = [self checkTwoObjects:superCandyRect andObj:blueCandyRect];
    
    carrotRect = [self checkTwoObjects:carrotRect andObj:fishRect];
    carrotRect = [self checkTwoObjects:carrotRect andObj:lollipopRect];
    carrotRect = [self checkTwoObjects:carrotRect andObj:blueCandyRect];
    
    fishRect = [self checkTwoObjects:fishRect andObj:lollipopRect];
    fishRect = [self checkTwoObjects:fishRect andObj:blueCandyRect];
    
    lollipopRect = [self checkTwoObjects:lollipopRect andObj:blueCandyRect];

}

-(void) checkCollisionWithPaddle
{
    if (CGRectIntersectsRect(superCandyRect, paddleRect))
    {
        [self getRandomNumbers];
        superCandyRect.origin.x = start;
        superCandyRect.origin.y = startPosition - (7000 + (start2));
        score = score + 500;
        lives++;
        
        pressCandy ++;
        [doughnutPlayer2 play];
        
        pressCandyRect.origin.x = 150;
        pressCandyRect.origin.y = 465;
        pressCandy = 1;
    }
    
    if (CGRectIntersectsRect(turntRect, paddleRect))
    {
        [self getRandomNumbers];
        turntRect.origin.x = start;
        turntRect.origin.y = startPosition - (7000 + (start2));
        [doughnutPlayer2 play];
        
        if (meatRect.origin.y > -1000) {
            [self getRandomNumbers];
            meatRect.origin.x = start;
            meatRect.origin.y = startPosition -  (1000 + start2);
        }
        if (broccoliRect.origin.y > -1000) {
            [self getRandomNumbers];
            broccoliRect.origin.x = start;
            broccoliRect.origin.y = startPosition -  (1000 + start2);
        }
     /*   if (appleRect.origin.y > -700) {
            [self getRandomNumbers];
            appleRect.origin.x = start;
            appleRect.origin.y = startPosition - (700 + start2);
        } */
        if (carrotRect.origin.y > -1000) {
            [self getRandomNumbers];
            carrotRect.origin.x = start;
            carrotRect.origin.y = startPosition - (1000 + start2);
        }
        if (fishRect.origin.y > -1000) {
            [self getRandomNumbers];
            fishRect.origin.x = start;
            fishRect.origin.y = startPosition -  (1000 + start2);
        }
        
        rollRect6.origin.y = -100;
        rollRect5.origin.y = -700;
        rollRect4.origin.y = -300;
        rollRect3.origin.y = -900;
        rollRect2.origin.y = -500;
        
    }
    
    blueCandyRect=[self checkPaddleCandy:blueCandyRect];
    ballRect=[self checkPaddleCandy:ballRect];
    rollRect= [self checkPaddleCandy:rollRect];
    caneRect=[self checkPaddleCandy:caneRect];
    gummyBearRect=[self checkPaddleCandy:gummyBearRect];
    candyCornRect=[self checkPaddleCandy:candyCornRect];
    lollipopRect=[self checkPaddleCandy:lollipopRect];
    
    rollRect2= [self rollsPaddle:rollRect2];
    rollRect3= [self rollsPaddle:rollRect3];
    rollRect4= [self rollsPaddle:rollRect4];
    rollRect5= [self rollsPaddle:rollRect5];
    rollRect6= [self rollsPaddle:rollRect6];
    
    meatRect= [self checkPaddleOther:meatRect];
    broccoliRect=[self checkPaddleOther:broccoliRect];
   // appleRect=[self checkPaddleOther:appleRect];
    carrotRect=[self checkPaddleOther:carrotRect];
    fishRect=[self checkPaddleOther:fishRect];
}

-(CGRect) checkTwoObjects:(CGRect)obj1 andObj: (CGRect)obj2
{
    if (CGRectIntersectsRect(obj1, obj2)) {
        [self getRandomNumbers];
        obj1.origin.x = start;
        obj1.origin.y = startPosition - (start2+50);
        
        
        /*
         obj1.origin.x < obj2.origin.x + 10 && obj1.origin.x > obj2.origin.x - 10 && obj1.origin.y < 0 && obj1.origin.y + 15 > obj2.origin.y && obj1.origin.y - 15 < obj2.origin.y
         */
    }
    return obj1;
}

-(CGRect) checkBottomCandy: (CGRect)theRect {
    
    if (theRect.origin.y >= paddleRect.origin.y + SIZE)
    {
        [self getRandomNumbers];
        theRect.origin.x = start;
        theRect.origin.y = startPosition - (start2+50);
    
        velocity = velocity + 10;
        lives--;
        progress--;
    }
    return theRect;
}

-(void) getRandomNumbers {
    start = ((arc4random()%laterX1)*laterX2)+laterX3;
    start2 = (arc4random()%laterY1)*laterY2;
}

-(CGRect) checkBottomOther: (CGRect)theRect {
    

    if (theRect.origin.y >= paddleRect.origin.y + SIZE)
    {
        [self getRandomNumbers];
        theRect.origin.x = start;
        theRect.origin.y = startPosition - (start2+50);
    }
    return theRect;
}


-(CGRect) checkPaddleOther: (CGRect)theRect {
    
    
    if (CGRectIntersectsRect(theRect, paddleRect))
    {
        [self getRandomNumbers];
        theRect.origin.x = start;
        theRect.origin.y = startPosition - (start2+50);
        velocity = velocity + 20;
        score = score - 75;
        progress --;
        [doughnutPlayer play];
    }
    return theRect;
}

-(CGRect) checkPaddleCandy: (CGRect)obj
{
    if (CGRectIntersectsRect(obj, paddleRect))
    {
        [self getRandomNumbers];
        velocity = velocity + 9;
        obj.origin.x = start;
        obj.origin.y = startPosition - (start2+50);
        score = score + 100;
        progress ++;
        [doughnutPlayer play];
    }
    return obj;
}

-(CGRect) rolls: (CGRect)obj
{
    if (obj.origin.y >= paddleRect.origin.y + SIZE)

    {
        [self getRandomNumbers];
        obj.origin.x = start;
        obj.origin.y = startPosition - (start2+100000);
    }
    return obj;
}

-(CGRect) rollsPaddle: (CGRect)obj
    {
        if (CGRectIntersectsRect(obj, paddleRect))
        {
            [self getRandomNumbers];
            velocity = velocity + 9;
            obj.origin.x = start;
            obj.origin.y = startPosition - (start2+50000000);
            score = score + 100;
            progress ++;
            [doughnutPlayer play];
        }
        return obj;
    }

            

-(void) updateModelWithTime:(CFTimeInterval)timestamp {
    if (lastTime == 0)
    {
        lastTime = timestamp;
    }
    else
    {
        timeDelta = timestamp - lastTime;
        lastTime = timestamp;
        ballRect.origin.x += ballVelocity.x * timeDelta;
        ballRect.origin.y += velocity * timeDelta;
        rollRect.origin.y += velocity * timeDelta;
        caneRect.origin.y += velocity * timeDelta;
        meatRect.origin.y += velocity * timeDelta;
        superCandyRect.origin.y += velocity * timeDelta;
        broccoliRect.origin.y += velocity * timeDelta;
    //    appleRect.origin.y += velocity * timeDelta;
        carrotRect.origin.y += velocity * timeDelta;
        fishRect.origin.y += velocity * timeDelta;
        blueCandyRect.origin.y += velocity * timeDelta;
        gummyBearRect.origin.y += velocity * timeDelta;
        turntRect.origin.y += velocity * timeDelta;
        candyCornRect.origin.y += velocity * timeDelta;
         lollipopRect.origin.y += velocity * timeDelta;
        
        rollRect2.origin.y += velocity * timeDelta;
        rollRect3.origin.y += velocity * timeDelta;
        rollRect4.origin.y += velocity * timeDelta;
        rollRect5.origin.y += velocity * timeDelta;
        rollRect6.origin.y += velocity * timeDelta;
        
        [self checkCollisionWithScreenEdges];
        [self checkCollisionWithPaddle];
        [self checkCollisionWithCandy];
   

        if (velocity > 380) {
            velocity = 380;
        }


        }
    }

-(int) getCounter
{
    return lives;
}

-(void) setCounter:(int)value
{
    lives = value;
}

-(void) changeCounter:(int)amount
{
    lives = lives + amount;
    
}

-(void) setScore:(int) value
{
    score = value;
}
-(void) changeScore:(int) amount {
    score = score + amount;
}

-(int) getScore {
    return score;
}

-(int) getTime {
    return lastTime;
}

-(int) getPress {
    return pressCandy;
}



@end
