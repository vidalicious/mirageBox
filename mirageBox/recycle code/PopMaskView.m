//
//  PopMaskView.m
//  mirageBox
//
//  Created by vidalicious on 12/8/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "PopMaskView.h"

@interface PopMaskView ()

@property (weak, nonatomic) IBOutlet UIView *maskView;
@property (weak, nonatomic) IBOutlet UIView *popView;
@property (weak, nonatomic) IBOutlet UILabel *maskLabel;

@end

@implementation PopMaskView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self addTapGesture];
}

- (void)showPopMaskView {
    
    self.frame = [UIScreen mainScreen].bounds;
    self.popView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.popView.frame.size.height);
    self.maskView.alpha = 0;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.35f animations:^{
        
        self.popView.frame = CGRectMake(0, self.frame.size.height - self.popView.frame.size.height, self.frame.size.width, self.popView.frame.size.height);
        self.maskView.alpha = .5f;
    }];
}

- (void)hidePopMaskView {
    
    [UIView animateWithDuration:.35f animations:^{
        
        self.popView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.popView.frame.size.height);
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)addTapGesture {
    
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePopMaskView)];
    [self.maskView addGestureRecognizer:tapGestureRecognize];
}
@end
