//
//  ViewController.m
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize curveView, sequence;

-(Sequence *)dragonCurve
{
    sequence = [[Sequence alloc] init];
    [sequence addStep:45 distance:1 mirror:1 reverse:0 visible:1];
    [sequence addStep:-90 distance:1 mirror:-1 reverse:0 visible:1];
    float length = [sequence computeLength];
    NSLog(@"Length is %f", length);
    [sequence setSequence_scale:1.0/length];
    
    return sequence;
}


-(Sequence *)kochCurve
{
    sequence = [[Sequence alloc] init];
    [sequence addStep:0 distance:1 mirror:1 reverse:0 visible:1];
    [sequence addStep:60 distance:1 mirror:1 reverse:0 visible:1];
    [sequence addStep:-120 distance:1 mirror:1 reverse:0 visible:1];
    [sequence addStep:60 distance:1 mirror:1 reverse:0 visible:1];

    float length = [sequence computeLength];
    NSLog(@"Length is %f", length);
    [sequence setSequence_scale:1.0/length];
    
    return sequence;
}

-(Sequence *)peanoCurve
{
    sequence = [[Sequence alloc] init];
    [sequence addStep:0 distance:2 mirror:1 reverse:0 visible:1];
    [sequence addStep:90 distance:1 mirror:1 reverse:0 visible:1];
    [sequence addStep:90 distance:2 mirror:1 reverse:0 visible:1];
    [sequence addStep:-90 distance:1 mirror:1 reverse:0 visible:1];
    [sequence addStep:-90 distance:2 mirror:1 reverse:0 visible:1];
    
    float length = [sequence computeLength];
    NSLog(@"Length is %f, intial angle %f", length, [sequence initial_angle]);
    [sequence setSequence_scale:1.0/length];
    
    return sequence;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    sequence = [self kochCurve];
    
    [curveView setSequence:sequence];
    [curveView setNeedsDisplay];
}

-(IBAction)deltaDisplay:(id)sender
{
    int displayDepth = [curveView displayDepth];
    displayDepth += (int)[sender tag];
    [curveView setDisplayDepth:displayDepth];
    [curveView setNeedsDisplay];
}

-(IBAction)selectCurve:(id)sender
{
    switch ((int)[sender tag])
    {
        case 0:
            sequence = [self dragonCurve];
            break;
        default:
            sequence = [self peanoCurve];
    }
    [curveView setSequence:sequence];
    [curveView setNeedsDisplay];
}

@end
