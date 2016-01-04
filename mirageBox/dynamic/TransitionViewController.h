//
//  TransitionViewController.h
//  mirageBox
//
//  Created by vidalicious on 1/4/16.
//  Copyright © 2016 vidalicious. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@interface AppearAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@end

@interface DisappearAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@end

@interface TransitionViewController : UIViewController<UIViewControllerTransitioningDelegate, ModalViewControllerDelegate>

@end
