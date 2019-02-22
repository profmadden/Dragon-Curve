//
//  Sequence.h
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SequenceStep.h"


NS_ASSUME_NONNULL_BEGIN


#define DCOS(a) (cos(a*M_PI/180.0))
#define DSIN(a) (sin(a*M_PI/180.0))


@interface Sequence : NSObject
@property (nonatomic, strong) NSMutableArray *steps;
@property (nonatomic) float initial_angle;
@property (nonatomic) float recover_angle;
@property (nonatomic) float sequence_scale;

-(void)addStep:(float)angle distance:(float)distance mirror:(int)mirror reverse:(int)reverse visible:(int)visible;
-(float)computeLength;

@end

NS_ASSUME_NONNULL_END
