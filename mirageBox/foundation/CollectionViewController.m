//
//  CollectionViewController.m
//  mirageBox
//
//  Created by vidalicious on 12/18/15.
//  Copyright © 2015 vidalicious. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionLayout.itemSize = CGSizeMake(10, 10);
    self.myCollectionView.collectionViewLayout = collectionLayout;
    self.myCollectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;
    [self.myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [self.myCollectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    
    int seed = arc4random() % 0x1000000;
    
    cell.backgroundColor = colorHex(seed);
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

    return 5;
}

@end
