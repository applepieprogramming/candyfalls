//
//  Level2.m
//  Blocker
//
//  Created by 15CMiner on 4/30/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import "Level2.h"

@interface Level2 ()

@end

@implementation Level2

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





//- (id)gameModel.init {
//    self = [super init];
//    if(self) {
 //       blocks = [[NSMutableArray alloc] initWithCapacity:15];
   //    BlockView* bv;
      //  for (int row = 0; row<=3; row++)
     //   {
//            if (random() == 0) {
//                row--;
//            }

 //           for (int col = 0; col<5; col++)
  //          {
   //             bv = [[BlockView alloc] initWithFrame:CGRectMake(col * BLOCK_WIDTH, row * BLOCK_HEIGHT, BLOCK_WIDTH, BLOCK_HEIGHT) color:row];
    //            [blocks addObject:bv];
  //          }
  //      }
@end
