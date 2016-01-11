//
//  Block view.h
//  Blocker
//
//  Created by 15CMiner on 3/28/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RED_COLOR 0
#define GREEN_COLOR 1
#define BLUE_COLOR 2
#define ORANGE_COLOR 3

@interface BlockView : UIView {
    int color;
}
- (id)initWithFrame:(CGRect)frame color:(int) inputColor;
@property int color;

@end