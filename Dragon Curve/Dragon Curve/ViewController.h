//
//  ViewController.h
//  Dragon Curve
//
//  Created by Patrick Madden on 2/21/19.
//  Copyright © 2019 Binghamton University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurveView.h"
#import "Sequence.h"
@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet CurveView *curveView;
@property (nonatomic, strong) Sequence *sequence;


@end

