//
//  NotificationViewController.m
//  mirageBox
//
//  Created by vidalicious on 12/17/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIView *touchView;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTapGesture];
}

- (void)viewWillAppear:(BOOL)animated {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotification:) name:@"testNotification" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addTapGesture {

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(testPost)];
    [self.touchView addGestureRecognizer:tapGesture];
}

- (void)testPost {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"testNotification" object:self];
}

- (void)testNotification:(id)sender {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    self.myLabel.text = [NSString stringWithFormat:@"touch at %@", date];
    [UIView animateWithDuration:.8 animations:^{
        
        self.myLabel.alpha = 0;
    } completion:^(BOOL finished) {
        
        self.myLabel.alpha = 1;
        self.myLabel.text = @"";
    }];
}

@end
