//
//  Sequence.m
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import "Sequence.h"

@implementation Sequence
@synthesize steps, initial_angle, recover_angle, sequence_scale;

-(id)init
{
    self = [super init];
    if (self)
    {
        steps = [[NSMutableArray alloc] init];
        initial_angle = 0;
        recover_angle = 0;
        sequence_scale = 1;
    }
    
    return self;
}

-(void)addStep:(float)angle distance:(float)distance mirror:(int)mirror reverse:(int)reverse visible:(int)visible
{
    SequenceStep *s = [[SequenceStep alloc] init];
    [s setAngle:angle];
    [s setDistance:distance];
    [s setMirror:mirror];
    [s setReverse:reverse];
    [s setVisible:visible];
    
    [steps addObject:s];
}

-(float)computeLength
{
    float x, y;
    
    x = y = 0;
    float angle = 0;
    for (SequenceStep *s in steps)
    {
        angle += [s angle];
        x += DCOS(angle);
        y += DSIN(angle);
    }
    
    return sqrt(x * x + y * y);
}

-(void)walkCurve:(int)depth angle:(float)angle x:(float)x y:(float)y scale:(float)scale mirror:(int)mirror reverse:(int)reverse
{
    if (depth < 0)
        return;
    
    char indent[100];
    for (int i = 0; i < depth; ++i)
        indent[i] = ' ';
    indent[depth] = '\0';
    
    NSLog(@"%s Start %f %f angle %f", indent, x, y, angle);
    for (SequenceStep *s in steps)
    {
        angle += [s angle] * mirror;
        
        x += DCOS(angle) * [s distance] * scale;
        y += DSIN(angle) * [s distance] * scale;
        NSLog(@"%s     %f %f angle %f", indent, x, y, angle);
    }

    NSLog(@"%s End angle %f", indent, angle);
    
}

@end
