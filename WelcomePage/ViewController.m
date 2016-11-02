//
//  ViewController.m
//  WelcomePage
//
//  Created by roycms on 2016/11/2.
//  Copyright © 2016年 roycms. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
static NSString * const cellName = @"cell";
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger pageCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
- (void)setupUI {
    
    [self.view addSubview:self.collectionView];
    self.collectionView.frame =  self.view.frame;
    
    UICollectionViewFlowLayout *collectionViewflowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    collectionViewflowLayout.itemSize = self.view.bounds.size;
    collectionViewflowLayout.minimumInteritemSpacing = 0;
    collectionViewflowLayout.minimumLineSpacing = 0;
    collectionViewflowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellName];
    self.pageCount = 4;
}

#pragma mark - collection view data sorce
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.pageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellName forIndexPath:indexPath];
    cell.imageIndex = indexPath.item;
    return cell;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
@end
