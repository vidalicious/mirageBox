//
//  TransitionViewController.m
//  mirageBox
//
//  Created by vidalicious on 1/4/16.
//  Copyright © 2016 vidalicious. All rights reserved.
//

#import "TransitionViewController.h"

@implementation AppearAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {

    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectMake(-screenBounds.size.width, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}

@end

/////////////////////////////////////////////////////////////////////////////////////////

@implementation DisappearAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect finalRect = CGRectMake(screenRect.size.width, screenRect.size.height, screenRect.size.width, screenRect.size.height);
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        fromView.frame = finalRect;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////

@interface TransitionViewController ()

@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> appearAnimation;
@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> disappearAnimation;
@property (nonatomic, strong) ModalViewController *modalVC;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appearAnimation = [AppearAnimation new];
    self.disappearAnimation = [DisappearAnimation new];
    self.modalVC = [ModalViewController new];
    self.modalVC.delegate = self;
    self.modalVC.transitioningDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popButtonClicked:(id)sender {
    
    [self presentViewController:self.modalVC animated:YES completion:nil];
}

- (void)modalViewControllerDidClickedHideButton:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.appearAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.disappearAnimation;
}

@end
