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

@interface Sequence : NSObject
@property (nonatomic, strong) NSMutableArray *steps;
@property (nonatomic) float initial_angle;
@property (nonatomic) float recover_angle;
@property (nonatomic) float sequence_scale;
@end

NS_ASSUME_NONNULL_END
