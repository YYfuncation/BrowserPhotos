//
//  RepairBrowserPhotosViewController.m
//  BPMS
//
//  Created by lianditech on 2017/10/17.
//  Copyright © 2017年 啾三万. All rights reserved.
//

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kStatusH [UIApplication sharedApplication].statusBarFrame.size.height

#import "RepairBrowserPhotosViewController.h"
#import "RepairBrowserPhotoCollectionViewCell.h"

@interface RepairBrowserPhotosViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLab;

@property (copy, nonatomic) NSArray *imageArray;
@property (assign, nonatomic) NSInteger currentIndex;

@end

@implementation RepairBrowserPhotosViewController

static NSString *const browserPhotoCollectionCellIdf = @"browserPhotoCollectionCellIdf";

- (instancetype)initWithImageArray:(NSArray *)imageArray currentIndex:(NSInteger)currentIndex {
    self = [super init];
    if (self) {
        self.imageArray = imageArray;
        self.currentIndex = currentIndex;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        });
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RepairBrowserPhotoCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:browserPhotoCollectionCellIdf];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - set
- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    self.bottomLab.text = [NSString stringWithFormat:@"%li/%lu", _currentIndex + 1, (unsigned long)self.imageArray.count];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RepairBrowserPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:browserPhotoCollectionCellIdf forIndexPath:indexPath];
    cell.image = self.imageArray[indexPath.item];
    cell.scrollView.zoomScale = 1;
    self.bottomLab.text = [NSString stringWithFormat:@"%li/%lu", _currentIndex + 1, (unsigned long)self.imageArray.count];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kScreenW, kScreenH);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat collectionViewWidth = self.collectionView.bounds.size.width;
    NSUInteger page = (scrollView.contentOffset.x - collectionViewWidth / 2) / collectionViewWidth + 1;
    self.currentIndex = page;
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
