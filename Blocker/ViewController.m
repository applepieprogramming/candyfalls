//
//  ViewController.m/Users/15cminer/Desktop/Xcode programs/Blocker Iphone/Blocker/ViewController.h
//  Blocker
//
//  Created by 15CMiner on 3/28/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//









#import "ViewController.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@end

@implementation ViewController
@synthesize Counter;
@synthesize fast;

- (void)viewDidLoad
{
    NSURL * doughnutSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"candyFallsMusic" ofType:@"mp3"]];
    doughnutPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:doughnutSoundURL error:Nil];
    
    NSURL * doughnutSoundURL2 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"blop" ofType:@"mp3"]];
    doughnutPlayer3 = [[AVAudioPlayer alloc] initWithContentsOfURL:doughnutSoundURL2 error:Nil];
    
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, -50);
    adView.requiredContentSizeIdentifiers = [NSSet
    setWithObject: ADBannerContentSizeIdentifierPortrait];
    adView.currentContentSizeIdentifier =
    ADBannerContentSizeIdentifierPortrait;
    [self.view addSubview:adView];
    adView.delegate=self;
    self.bannerIsVisible=NO;
    
    
    [super viewDidLoad];

   // [self.scoreBar setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90))];
    gameModel = [[CatcherModel alloc] init];
    gameModel = [[CatcherModel alloc] init];
   [self.scoreBar setTransform:CGAffineTransformMakeScale(1.0, 5.0)];
    
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Mr. Doughnut.png" ]];
    [paddle setFrame:gameModel.paddleRect];
    [self.view addSubview:paddle];
    
    superCandy = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"superCandy3.png" ]];
    [superCandy setFrame:gameModel.superCandyRect];
    [self.view addSubview:superCandy];
    
    //[self makeRect:@"Cball.png" andName:ball andAlsoRect:gameModel.ballRect];
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cball.png"]];   //stuffing image in to the rect built in other method
    [ball setFrame:gameModel.ballRect];
    [self.view addSubview:ball];
    
    cane = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cane.png"]];
    [cane setFrame:gameModel.caneRect];
    [self.view addSubview:cane];
    
    roll = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roll.png"]];
    [roll setFrame:gameModel.rollRect];
    [self.view addSubview:roll];
    
    roll2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roll2.png"]];
    [roll2 setFrame:gameModel.rollRect2];
    [self.view addSubview:roll2];
    
    roll3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roll3.png"]];
    [roll3 setFrame:gameModel.rollRect3];
    [self.view addSubview:roll3];
    
    roll4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roll4.png"]];
    [roll4 setFrame:gameModel.rollRect4];
    [self.view addSubview:roll4];
    
    roll5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roll5.png"]];
    [roll5 setFrame:gameModel.rollRect5];
    [self.view addSubview:roll5];
    
    roll6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roll6.png"]];
    [roll6 setFrame:gameModel.rollRect6];
    [self.view addSubview:roll6];
    
    blueCandy = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bluecandy.gif"]];
    [blueCandy setFrame:gameModel.blueCandyRect];
    [self.view addSubview:blueCandy];
    
    gummyBear = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greenbear.gif"]];
    [gummyBear setFrame:gameModel.gummyBearRect];
    [self.view addSubview:gummyBear];

    candyCorn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"candycorn.gif"]];
    [candyCorn setFrame:gameModel.candyCornRect];
    [self.view addSubview:candyCorn];
    
    lollipop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greenpurplelolli.gif"]];
    [lollipop setFrame:gameModel.lollipopRect];
    [self.view addSubview:lollipop];
    
    meat = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meaty.png"]];
    [meat setFrame:gameModel.meatRect];
    [self.view addSubview:meat];
    
    broccoli = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"broccoli.png"]];
    [broccoli setFrame:gameModel.broccoliRect];
    [self.view addSubview:broccoli];
    
   /* apple = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greenapple.gif"]];
    [apple setFrame:gameModel.appleRect];
    [self.view addSubview:apple];
    */
    carrot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"carrot.gif"]];
    [carrot setFrame:gameModel.carrotRect];
    [self.view addSubview:carrot];
    
    fish = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fish.gif"]];
    [fish setFrame:gameModel.fishRect];
    [self.view addSubview:fish];
    
    turnt = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"turntUp.png"]];
    [turnt setFrame:gameModel.turntRect];
    [self.view addSubview:turnt];
    
    pressCandy = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pressCandy.png"]];
    [pressCandy setFrame:gameModel.pressCandyRect];
    [self.view addSubview:pressCandy];
    
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    _scoreBar.progress = 0;
   
  
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // not needed os will do   [self createFileWithName : @"pbdata.txt"];
    
    // http://mobile.antonio081014.com/2013/06/create-rename-delete-read-and-write.html
    
    
    
    dataFile = @"score2.txt";
    
   
    
    [self listAllLocalFiles];
    
    
    
   
    
    highScore = [[self readFileWithName:dataFile ] intValue];
    
    NSLog(@"hi! %i", highScore);
   

    gameData = [self readFileWithName:dataFile];
    
    //NSLog(gameData);
    
    
    
    [self listAllLocalFiles];

}

-(void) makeRect:(NSString*) inString andName: (UIImageView*) name andAlsoRect: (CGRect) obj {
    name = [[UIImageView alloc] initWithImage:[UIImage imageNamed:inString]];
    [name setFrame:obj];
    [self.view addSubview:name];
}

-(void) updateDisplay:(CADisplayLink *)sender
{
    [doughnutPlayer2 play];
    [gameModel updateModelWithTime:sender.timestamp];
    [ball setFrame:gameModel.ballRect];      //  this keeps running, changes in the rect get implemented here
    [roll setFrame:gameModel.rollRect];
    [roll2 setFrame:gameModel.rollRect2];
    [roll3 setFrame:gameModel.rollRect3];
    [roll4 setFrame:gameModel.rollRect4];
    [roll5 setFrame:gameModel.rollRect5];
    [roll6 setFrame:gameModel.rollRect6];
    [meat setFrame:gameModel.meatRect];
    [cane setFrame:gameModel.caneRect];
    [turnt setFrame:gameModel.turntRect];
   // [apple setFrame:gameModel.appleRect];
    [carrot setFrame:gameModel.carrotRect];
    [fish setFrame:gameModel.fishRect];
    [gummyBear setFrame:gameModel.gummyBearRect];
    [blueCandy setFrame:gameModel.blueCandyRect];
    [candyCorn setFrame:gameModel.candyCornRect];
    [lollipop setFrame:gameModel.lollipopRect];
    [superCandy setFrame:gameModel.superCandyRect];
    [pressCandy setFrame:gameModel.pressCandyRect];
    [broccoli setFrame:gameModel.broccoliRect];
    [paddle setFrame:gameModel.paddleRect];
    
    _velocity.text = [NSString stringWithFormat:@"%i", [gameModel velocity]];
     Counter.text = [NSString stringWithFormat:@"%i",[gameModel getCounter]];
    [self progressing];
    _scoreBar.progress = .1*gameModel.progress;
    fast.text = [NSString stringWithFormat:@"%i", [gameModel getScore]];
    _Lose.text = [NSString stringWithFormat:@"YOUR SCORE: %i \n HIGH SCORE: %i", [gameModel getScore], highScore];
    _Win.text = [NSString stringWithFormat:@"You are truely a candy master! \n Your score was: %i", [gameModel getScore]];
    
    if ([gameModel getCounter] < 1) {
       
        [self endGameWithMessage: _Lose.text ];
    }
    
    if ([gameModel getScore] > 24999) {
        [self endGameWithMessage: _Win.text ];
    }

    if ([gameModel getPress] == 1) {
        _pressSlow.alpha = 1;
    }
    if ([gameModel getPress] == 0) {
        _pressSlow.alpha = 0;
    }
}

-(void) endGameWithMessage:(NSString *)message
{
    thisGameScore = [gameModel getScore];
    stringScore = [NSString stringWithFormat: @"%i", thisGameScore];
    [doughnutPlayer2 stop];
   if (thisGameScore > highScore) {
        [self writeString:stringScore toFile:dataFile];
   }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GAME OVER" message:message delegate:self cancelButtonTitle:@"Home" otherButtonTitles: @"Play Again", nil];
    [alert show];
    [gameTimer invalidate];
    
   
}

- (void)viewDidUnload
{
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
    - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:touch.view];
        
        if (gameModel.pressCandyRect.origin.y == 465 && gameModel.pressCandyRect.origin.x == 150&& location.x > 140 && location.x < 250 && location.y > 450) {
        
        [super touchesBegan:touches withEvent:event];
        UITouch *touch = [touches anyObject];
        if ([touch.view isKindOfClass: pressCandy.class]) {
            gameModel.velocity = gameModel.velocity - 80;
            CGRect movePressCandy = gameModel.pressCandyRect;
            movePressCandy.origin.y = 7000;
            movePressCandy.origin.x = 500;
            gameModel.pressCandyRect = movePressCandy;
            (gameModel.pressCandy = 0);
            
            
        }
        }
    }


-(void) restart
{
   [self performSegueWithIdentifier:@"playAgain" sender:self];
    

}
    
- (void)alertView:(UIAlertView *)alertView

clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0){
        [self loadView];
        [gameTimer invalidate];
        [self performSegueWithIdentifier:@"home" sender:self];
    }
    
    else if (buttonIndex == 1){
        [self loadView];
        [self restart];
    }
}

-(void) progressing
{
    
    
    if (_scoreBar.progress == 1) {
        sweet = YES;
    }
    if (sweet == YES) {
        gameModel.progress = 0;
        sweet = NO;
        gameModel.velocity = gameModel.velocity - 75 ;
    }
}

- (IBAction)mainMenu:(id)sender {
    [gameTimer invalidate];
    [doughnutPlayer2 stop];
    [doughnutPlayer3 play];
}

- (IBAction)playAgain:(id)sender {
    [gameTimer invalidate];
    [doughnutPlayer2 stop];
    [doughnutPlayer3 play];
}




// --------------- SCORE FILES---------------------------------

/* This function read content from the file named fileName.
 
 */

- (NSString *)readFileWithName:(NSString *)fileName

{
    
    // Fetch directory path of document for local application.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // Have the absolute path of file named fileName by joining the document path with fileName, separated by path separator.
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    
    
    // NSFileManager is the manager organize all the files on device.
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]) {
        
        // Start to Read.
        
        NSError *error = nil;
        
        content = [NSString stringWithContentsOfFile:filePath encoding:NSStringEncodingConversionAllowLossy error:&error];
        
        NSLog(@"File Content: %@", content);
        
        return content;
        
        
        
        if (error) {
            
            content = @"There is an Error: %@", error;
            
            NSLog(content);
           
            
            return content;
            
        }
        
    } else {
        
        NSString *startLevels = @"0";
        
        NSLog(@"File %@ doesn't exists", fileName);
        
        [self createFileWithName:fileName];
        
        [self writeString: startLevels toFile:fileName];
        
        return startLevels;
        
    }
    
}





- (void)createFileWithName:(NSString *)fileName

{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 1st, This funcion could allow you to create a file with initial contents.
    
    // 2nd, You could specify the attributes of values for the owner, group, and permissions.
    
    // Here we use nil, which means we use default values for these attibutes.
    
    // 3rd, it will return YES if NSFileManager create it successfully or it exists already.
    
    if ([manager createFileAtPath:filePath contents:nil attributes:nil]) {
        
        NSLog(@"Created the File Successfully.");
        
    } else {
        
        NSLog(@"Failed to Create the File");
        
    }
    
}





// This function Write "content" to the file named fileName.
 
 

- (void)writeString:(NSString *)content toFile:(NSString *)fileName

{
    
    // Fetch directory path of document for local application.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // Have the absolute path of file named fileName by joining the document path with fileName, separated by path separator.
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    
    
    // NSFileManager is the manager organize all the files on device.
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // Check if the file named fileName exists.
    
    if ([manager fileExistsAtPath:filePath]) {
        
        NSError *error = nil;
        
        // Since [writeToFile: atomically: encoding: error:] will overwrite all the existing contents in the file, you could keep the content temperatorily, then append content to it, and assign it back to content.
        
        // To use it, simply uncomment it.
        
        //        NSString *tmp = [[NSString alloc] initWithContentsOfFile:fileName usedEncoding:NSStringEncodingConversionAllowLossy error:nil];
        
        //        if (tmp) {
        
        //            content = [tmp stringByAppendingString:content];
        
        //        }
        
        // Write NSString content to the file.
        
        [content writeToFile:filePath atomically:YES encoding:NSStringEncodingConversionAllowLossy error:&error];
        
        // If error happens, log it.
        
        if (error) {
            
            NSLog(@"There is an Error: %@", error);
            
        }
        
    } else {
        
        // If the file doesn't exists, log it.
        
        NSLog(@"File %@ doesn't exists", fileName);
        
    }
    
    
    
    // This function could also be written without NSFileManager checking on the existence of file,
    
    // since the system will atomatically create it for you if it doesn't exist.
    
}

- (void)listAllLocalFiles

{
    
    // Fetch directory path of document for local application.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    
    // NSFileManager is the manager organize all the files on device.
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // This function will return all of the files' Name as an array of NSString.
    
    NSArray *files = [manager contentsOfDirectoryAtPath:documentsDirectory error:nil];
    
    // Log the Path of document directory.
    
    NSLog(@"Directory: %@", documentsDirectory);
    
    // For each file, log the name of it.
    
    for (NSString *file in files) {
        
        NSLog(@"File at: %@", file);
        
    }
    
}


    - (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner
                   willLeaveApplication:(BOOL)willLeave
    
    {
        BOOL shouldExecuteAction = YES;
        if (!willLeave && shouldExecuteAction)
        
        {
            
        }
        return shouldExecuteAction;
    }
    
    
    - (void)bannerViewActionDidFinish:(ADBannerView *)banner
    {
        
    }
    
    
    //no connection to ad server methods
    -(void)bannerViewDidLoadAd:(ADBannerView *)banner
    {
        if (!self.bannerIsVisible)
        {
            [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
            banner.frame = CGRectOffset(banner.frame, 0, 568);
            [UIView commitAnimations];
            self.bannerIsVisible = YES;
        }
    }
    
    
    
    -(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError
                                                                          *)error
    
    {
        if (self.bannerIsVisible)
        {
            [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
            banner.frame = CGRectOffset(banner.frame, 0, -50);
            [UIView commitAnimations];
            self.bannerIsVisible = NO;
        }
    }


/*- (void) authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer authenticateWithCompletionHandler:^(NSError *error) {
        if (localPlayer.isAuthenticated)
        {
            // Player was successfully authenticated.
            // Perform additional tasks for the authenticated player.
        }
    }];
}
*/


@end
