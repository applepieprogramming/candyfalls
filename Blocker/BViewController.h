//
//  BViewController.h
//  Blocker
//
//  Created by 15CMiner on 5/7/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BlockView.h"
#import "CatcherModel.h"

@interface BViewController : UIViewController{
    CatcherModel* gameModel;
    CADisplayLink* gameTimer;
    UIImageView* ball;
    UIImageView* paddle;
    
}
@property (weak, nonatomic) IBOutlet UILabel *Counter;
-(void) updateDisplay: (CADisplayLink*) sender;
-(void) endGameWithMessage:(NSString*) message;

@end

