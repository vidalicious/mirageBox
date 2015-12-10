//
//  TestViewManager.m
//  mirageBox
//
//  Created by vidalicious on 12/10/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "TestViewManager.h"
#import "TestView.h"

@implementation TestViewManager

RCT_EXPORT_MODULE()
- (UIView *)view
{
    TestView *testView = [TestView loadFromNib];
    testView.frame = CGRectMake(0, 0, 200, 400);
    return testView;
}

@end
