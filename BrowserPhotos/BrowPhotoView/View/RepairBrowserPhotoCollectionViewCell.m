//
//  RepairBrowserPhotoCollectionViewCell.m
//  BPMS
//
//  Created by lianditech on 2017/10/17.
//  Copyright © 2017年 啾三万. All rights reserved.
//

#import "RepairBrowserPhotoCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface RepairBrowserPhotoCollectionViewCell ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation RepairBrowserPhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.scrollView.minimumZoomScale = 1;
    self.scrollView.maximumZoomScale = 3;
    self.scrollView.userInteractionEnabled = NO;
    [self.contentView addGestureRecognizer:self.scrollView.panGestureRecognizer];
    [self.contentView addGestureRecognizer:self.scrollView.pinchGestureRecognizer];
}

#pragma mark - set
- (void)setImage:(id)image {
    _image = image;
    if ([_image isKindOfClass:[NSString class]]) {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:(NSString *)_image] placeholderImage:[UIImage imageNamed:@"imageLoadFailed"]];
    } else if ([_image isKindOfClass:[UIImage class]]) {
        self.imageView.image = (UIImage *)_image;
    }
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
