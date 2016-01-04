//
//  ModalViewController.h
//  mirageBox
//
//  Created by vidalicious on 1/4/16.
//  Copyright © 2016 vidalicious. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelegate <NSObject>

- (void)modalViewControllerDidClickedHideButton:(id)sender;

@end

@interface ModalViewController : UIViewController

@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;

@end
