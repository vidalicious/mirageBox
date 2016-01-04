//
//  ModalViewController.m
//  mirageBox
//
//  Created by vidalicious on 1/4/16.
//  Copyright © 2016 vidalicious. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)hideButtonClicked:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedHideButton:)]) {
        
        [self.delegate modalViewControllerDidClickedHideButton:self];
    }
}

@end
