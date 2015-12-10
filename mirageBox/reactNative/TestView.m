//
//  TestView.m
//  mirageBox
//
//  Created by vidalicious on 12/10/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "TestView.h"

@interface TestView ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIButton *myButton;

@end

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)clickButton:(id)sender {
    
    self.myLabel.text = self.myTextField.text;
}

@end
