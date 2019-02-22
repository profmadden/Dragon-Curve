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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    sequence = [[Sequence alloc] init];
    [sequence addStep:45 distance:1 mirror:1 reverse:0 visible:1];
    [sequence addStep:-90 distance:1 mirror:-1 reverse:0 visible:1];
    float length = [sequence computeLength];
    NSLog(@"Length is %f", length);
    [sequence setSequence_scale:1.0/length];
    
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

@end
