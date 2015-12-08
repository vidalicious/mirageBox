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

static NSString *tableViewCellIdentifier = @"tableViewCells";

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITableView *pTableView;
@property (nonatomic, strong) BezierViewController *bezierViewControlller;
@property (nonatomic, strong) PopMaskViewController *popMaskViewController;

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

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
            
        case 0:
            
            return 1;
            break;
        
        case 1:
            
            return 0;
            break;
            
        case 2:
            
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
    label.text = [NSString stringWithFormat:@"example %d", (int)indexPath.row];
    
    NSInteger indexPathCode = indexPath.section * 100 + indexPath.row;
    
    switch (indexPathCode) {
        
        case 0: {
        
            label.text = @"Bezier";
        }
            break;
            
        case 200: {
        
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
    titleLabel.backgroundColor = colorHex(0xfc8230);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    switch (section) {
            
        case 0:
            
            titleLabel.text = @"STILL LIFE";
            break;
            
        case 1:
            
            titleLabel.text = @"ANIMATION";
            break;
            
        case 2:
            
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
            
            if (!self.bezierViewControlller) {
                
                self.bezierViewControlller = [BezierViewController new];
            }
            
            [self.navigationController pushViewController:self.bezierViewControlller animated:YES];
        }
            break;
        
        case 200: {
        
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
