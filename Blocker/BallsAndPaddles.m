//
//  BallsAndPaddles.m
//  Blocker
//
//  Created by 15CMiner on 4/24/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import "BallsAndPaddles.h"

@interface BallsAndPaddles ()

@end

@implementation BallsAndPaddles

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)SnowMountain:(id)sender {
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Spaddle.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sball.png"]];
    [ball setFrame:gameModel.ballRect];
    [self.view addSubview:ball];
    
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (IBAction)CandyLand:(id)sender {
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cpaddle.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cball.png"]];
    [ball setFrame:gameModel.ballRect];
    [self.view addSubview:ball];
    
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (IBAction)Beach:(id)sender {
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bpaddle.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bball.png"]];
    [ball setFrame:gameModel.ballRect];
    [self.view addSubview:ball];
    
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (IBAction)Regular:(id)sender {
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddle.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    [ball setFrame:gameModel.ballRect];
    [self.view addSubview:ball];
    
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}


    
                                            
@end
