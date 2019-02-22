//
//  SequenceStep.h
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

NS_ASSUME_NONNULL_BEGIN

@interface SequenceStep : NSObject
@property (nonatomic) float angle, distance;
@property (nonatomic) int mirror, reverse;
@property (nonatomic) int visible;

@end

NS_ASSUME_NONNULL_END
