//
//  UIView+Util.m
//  mirageBox
//
//  Created by vidalicious on 12/8/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)

+ (instancetype)loadFromNib {

    NSString* viewName = NSStringFromClass([self class]);
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:viewName owner:nil options:nil];
    Class targetClass = NSClassFromString(viewName);
    
    for (UIView *view in views) {
        if ([view isMemberOfClass:targetClass]) {
            return view;
        }
    }
    
    return nil;
}

@end
