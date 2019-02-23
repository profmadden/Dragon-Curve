//
//  CurveView.m
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView
@synthesize sequence;
@synthesize displayDepth;
@synthesize offsetx, offsety, imageScale;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        offsetx = offsety = 0;
        imageScale = 1;
    }
    return self;
}

-(void)recurseDraw:(CGContextRef)context depth:(int)depth x:(float)x y:(float) y angle:(float)angle scale:(float)scale mirror:(int)mirror reverse:(int) reverse
{
    float px, py;
    char indent[100];
    for (int i = 0; i < depth; ++i)
        indent[i] = ' ';
    indent[depth] = '\0';
    CGPoint points[2];
    NSLog(@"Depth %d incoming angle %f", depth, angle * M_PI/180.0);
    
    for (SequenceStep *s in [sequence steps])
    {
        angle += [s angle] * mirror;
        px = x;
        py = y;
        
        x += DCOS(angle) * [s distance] * scale;
        y += DSIN(angle) * [s distance] * scale;
        // NSLog(@"%s     %f %f angle %f", indent, x, y, angle);
        points[0].x = px;
        points[0].y = py;
        points[1].x = x;
        points[1].y = y;

        if (depth == 1)
        {
            [[UIColor blueColor] setStroke];
            CGContextStrokeLineSegments(context, points, 2);
        }
        else
        {
            if (depth == 2)
            {
                [[UIColor redColor] setStroke];
                CGContextStrokeLineSegments(context, points, 2);
            }
            [self recurseDraw:context depth:depth - 1 x:px y:py angle:angle + [sequence initial_angle] scale:scale*[sequence sequence_scale]*[s distance] mirror:[s mirror] reverse:reverse*[s reverse]];
        }
        
    }
    
    // NSLog(@"%s End angle %f", indent, angle);
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGRect r = [self bounds];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blueColor] setStroke];
    CGPoint points[2];
    
    points[0].x = 0;
    points[0].y = 0;
#if 0
    for (int i = 0; i < r.size.height; i += 5)
    {
        points[1].x = r.size.width;
        points[1].y = i;

        CGContextStrokeLineSegments(context, points, 2);
    }
#endif
    
    float x, y, angle;
    angle = 0;

    float scale = r.size.height / 3;
    x = r.size.width / 3;
    y = r.size.height / 2;
    
    x -= offsetx;
    y -= offsety;
    scale = scale * imageScale;
    
    [[UIColor blueColor] setStroke];
    if (displayDepth <= 1)
        displayDepth = 1;
    if (displayDepth > 12)
        displayDepth = 12;
    [self recurseDraw:context depth:displayDepth x:x y:y angle:0 scale:scale mirror:1 reverse:0];
}

CGPoint startTouch;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (UITouch *t in touches)
    {
        startTouch = [t locationInView:self];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (UITouch *t in touches)
    {
        CGPoint here = [t locationInView:self];
        
        offsetx += startTouch.x - here.x;
        offsety += startTouch.y - here.y;
        
        startTouch = here;
    }
    [self setNeedsDisplay];
}

-(IBAction)zoom:(id)sender
{
    if ([sender tag] > 0)
        imageScale *= 1.2;
    else
        imageScale = imageScale/1.2;
    [self setNeedsDisplay];
}

-(IBAction)reset:(id)sender
{
    imageScale = 1;
    offsetx = offsety = 0;
    [self setNeedsDisplay];
}

@end
