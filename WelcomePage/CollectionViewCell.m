//
//  CollectionViewCell.m
//  WelcomePage
//
//  Created by roycms on 2016/11/2.
//  Copyright © 2016年 roycms. All rights reserved.
//

#import "CollectionViewCell.h"
@interface CollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.imageView];
    self.imageView.frame =  self.contentView.frame;
}

- (void)setImageIndex:(NSInteger)imageIndex {
    _imageIndex = imageIndex;
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png", imageIndex + 1]];
}
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
@end
