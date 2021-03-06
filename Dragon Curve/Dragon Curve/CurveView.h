//
//  CurveView.h
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sequence.h"

NS_ASSUME_NONNULL_BEGIN

@interface CurveView : UIView
@property (nonatomic) int displayDepth;
@property (nonatomic, strong) Sequence *sequence;
@property (nonatomic) float imageScale;
@property (nonatomic) float offsetx, offsety;

@end

NS_ASSUME_NONNULL_END
