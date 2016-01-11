
//
//  Block view.m
//  Blocker
//
//  Created by 15CMiner on 3/28/13.
//  Copyright (c) 2013 15CMiner. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView
@synthesize color;


- (id)initWithFrame:(CGRect)frame color:(int) inputColor;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = inputColor;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    float viewWidth, viewHeight;
    viewWidth = self.bounds.size.width;
    viewHeight = self.bounds.size.height;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect blockRect = CGRectMake(0, 0, viewWidth, viewHeight);
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:blockRect];
    path.lineWidth = 2;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef myGradient;
    int num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0, 0, 0, 1, .5, .5, 1, 1 };
    switch (self.color) {
        case RED_COLOR:
            components[0] = .5;
            components[1] = 0;
            components[2] = 1;
            break;
        case GREEN_COLOR:
            components[0] = 0;
            components[1] = 1;
            components[2] = 1;
            break;
        case BLUE_COLOR:
            components[0] = 0;
            components[1] = 0;
            components[2] = 1;
            break;
        case ORANGE_COLOR:
            components[0] = 1;
            components[1] = 1;
            components[2] = 1;
        default:
            break;
    }
    myGradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, num_locations);
    CGContextDrawLinearGradient(context, myGradient, CGPointMake(0, 0), CGPointMake(viewWidth, 0), 0);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(myGradient);
}


@end
