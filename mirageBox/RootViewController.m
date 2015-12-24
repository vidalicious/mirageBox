//
//  RootViewController.m
//  mirageBox
//
//  Created by vidalicious on 12/7/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "RootViewController.h"
#import "BezierViewController.h"
#import "PopMaskViewController.h"
#import "NotificationViewController.h"
#import "CollectionViewController.h"

static NSString *tableViewCellIdentifier = @"tableViewCells";

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITableView *pTableView;
@property (nonatomic, strong) BezierViewController *bezierViewControlller;
@property (nonatomic, strong) PopMaskViewController *popMaskViewController;
@property (nonatomic, strong) RCTRootView *reactViewController;
@property (nonatomic, strong) NotificationViewController *notificationViewController;
@property (nonatomic, strong) CollectionViewController *collectionViewController;

@end

@implementation RootViewController

#pragma mark - INIT

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"~";
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {

    self.pTableView.delegate = self;
    self.pTableView.dataSource = self;
    [self.pTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellIdentifier];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
            
        case 0:
            
            return 1;
            break;
        
        case 1:
            
            return 3;
            break;
            
        case 2:
            
            return 1;
            break;
            
        case 3:
            
            return 1;
            break;
            
        case 4:
            
            return 1;
            break;
        
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, cell.bounds.size.width - 30, cell.bounds.size.height)];
    label.textColor = [UIColor whiteColor];
    
    NSInteger indexPathCode = indexPath.section * 100 + indexPath.row;
    
    switch (indexPathCode) {
        
        case 0: {
        
            label.text = @"notification";
        }
            break;
            
        case 100: {
        
            label.text = @"kvo & kvc";
        }
            break;
            
        case 101: {
        
            label.text = @"runtime";
        }
            break;
            
        case 102: {
        
            label.text = @"block";
        }
            break;
            
        case 200: {
        
            label.text = @"collectionView";
        }
            break;
        
        case 300: {
        
            label.text = @"go React-Native";
        }
            break;
            
        case 400: {
        
            label.text = @"Pop & Mask";
        }
            break;
        
        default:
            break;
    }
    [cell.contentView addSubview:label];
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UILabel* titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = colorHex(0x099fde);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    switch (section) {
            
        case 0:
            
            titleLabel.text = @"FOUNDATION";
            break;
            
        case 1:
            
            titleLabel.text = @"BLACK TECH";
            break;
        
        case 2:
            
            titleLabel.text = @"VISION";
            break;
            
        case 3:
            
            titleLabel.text = @"REACT-NATIVE";
            break;
        
        case 4:
            
            titleLabel.text = @"RECYCLE FRAME";
            break;
            
        default:
            break;
    }
    
    return titleLabel;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger indexPathCode = indexPath.section * 100 + indexPath.row;
    
    switch (indexPathCode) {
            
        case 0: {
            
            if (!self.notificationViewController) {
                
                self.notificationViewController = [NotificationViewController new];
            }
            
            [self.navigationController pushViewController:self.notificationViewController animated:YES];
        }
            break;
        
        case 200: {
                
            if (!self.collectionViewController) {
                
                self.collectionViewController = [CollectionViewController new];
            }
            
            [self.navigationController pushViewController:self.collectionViewController animated:YES];
        }
            break;
            
        case 300: {
        
            NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/mirageBox/reactNative/js/index.ios.bundle?platform=ios&dev=true"];
            RCTRootView *reactView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                                 moduleName:@"testReactNative"
                                                          initialProperties:nil
                                                              launchOptions:nil];
            UIViewController *viewController = [UIViewController new];
            viewController.view = reactView;
            
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
            
        case 400: {
        
            if (!self.popMaskViewController) {
                
                self.popMaskViewController = [PopMaskViewController new];
            }
            
            [self.navigationController pushViewController:self.popMaskViewController animated:YES];

        }
            break;
            
        default:
            break;
    }

}

@end
