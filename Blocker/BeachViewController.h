//
//  BeachViewController.h
//  Blocker
//
//  Created by 15CMiner on 4/30/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BlockView.h"
#import "BlockerModel.h"






@interface ViewController : UIViewController {
    BlockerModel* gameModel;
    CADisplayLink* gameTimer;
    UIImageView* ball;
    UIImageView* paddle;
    
}
-(void) updateDisplay: (CADisplayLink*) sender;
-(void) endGameWithMessage:(NSString*) message;
@property (weak, nonatomic) IBOutlet UILabel *Counter;

@end
