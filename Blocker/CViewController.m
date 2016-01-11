//
//  CViewController.m
//  Blocker
//
//  Created by 15CMiner on 5/6/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController
@synthesize Counter;


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
	
    gameModel = [[CatcherModel alloc] init];
    
    
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cpaddle.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cball.png"]];
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
    

    if ([gameModel getCounter] == 0) {
        [self endGameWithMessage:@"You are out of lives! You Lose!"];
    }
}

-(void) endGameWithMessage:(NSString *)message
{
    [gameTimer invalidate];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"game over" message:message delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles: @"Next Level", nil];
    [alert show];
}

- (void)viewDidUnload
{
    [self setCounter:nil];
    [self setCounter:nil];
    [super viewDidUnload];
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

-(void) restart
{
    gameModel = [[CatcherModel alloc] init];
    
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cpaddle.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cball.png"]];
    [ball setFrame:gameModel.ballRect];
    [self.view addSubview:ball];
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)alertView:(UIAlertView *)alertView

clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0){
        
        [self loadView];
        [self restart];
        
    }
    
    else if (buttonIndex == 1){
        
        
        
        [self loadView];
        
        [self restart];
        
        [gameModel changeCounter:1];
        
        
        
    }
    
}

@end
