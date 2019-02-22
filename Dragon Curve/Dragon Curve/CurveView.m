//
//  CurveView.m
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView


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

    for (int i = 0; i < r.size.height; i += 5)
    {
        points[1].x = r.size.width;
        points[1].y = i;

        CGContextStrokeLineSegments(context, points, 2);
    }
}


@end
