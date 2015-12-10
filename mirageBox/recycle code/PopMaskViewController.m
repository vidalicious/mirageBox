//
//  PopMaskViewController.m
//  mirageBox
//
//  Created by vidalicious on 12/8/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "PopMaskViewController.h"
#import "PopMaskView.h"

@interface PopMaskViewController ()

@property (nonatomic, strong) PopMaskView *popMaskView;

@end

@implementation PopMaskViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.popMaskView = [PopMaskView loadFromNib];
    self.navigationItem.title = @"Pop & Mask";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickShowPopButton:(id)sender {
    
    [self.popMaskView showPopMaskView];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
