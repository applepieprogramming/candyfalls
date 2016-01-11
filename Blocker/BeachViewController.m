//
//  BeachViewController.m
//  Blocker
//
//  Created by 15CMiner on 4/30/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Counter;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    gameModel = [[BlockerModel alloc] init];
    
    
    
    
    for (BlockView* bv in gameModel.blocks) {
        [self.view addSubview:bv];
        
    }
    
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bpaddle.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bball.png"]];
    [ball setFrame:gameModel.ballRect];
    [self.view addSubview:ball];
    
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}

-(void) updateDisplay:(CADisplayLink *)sender
{
    [gameModel updateModelWithTime:sender.timestamp];
    [ball setFrame:gameModel.ballRect];
    [paddle setFrame:gameModel.paddleRect];
    Counter.text = [NSString stringWithFormat:@"%i",[gameModel getCounter]];
    
    if ([gameModel.blocks count] == 0)
    {
        [self endGameWithMessage:@"You destroyed all of the blocks!"];
    }
    
    if ([gameModel getCounter] == 0) {
        [self endGameWithMessage:@"You are out of lives! You Lose!"];
    }
}

-(void) endGameWithMessage:(NSString *)message
{
    [gameTimer invalidate];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"game over" message:message delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
}

- (void)viewDidUnload
{
    [self setCounter:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch* t in touches)
    {
        CGFloat delta = [t locationInView:self.view].x - [t previousLocationInView:self.view].x;
        CGRect newPaddleRect = gameModel.paddleRect;
        newPaddleRect.origin.x += delta;
        gameModel.paddleRect = newPaddleRect;
    }
}




@end
