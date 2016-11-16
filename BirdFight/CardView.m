//
//  CardView.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "CardView.h"

@implementation CardView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // Shadow
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.33;
    self.layer.shadowOffset = CGSizeMake(0, 1.5);
    self.layer.shadowRadius = 4.0;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    // Corner Radius
    self.layer.cornerRadius = 10.0;
    
    
    // Custom view
    [self addSubview:self.imageView];
    _imageView.frame = CGRectMake(5, 5, self.frame.size.width - 10, (self.frame.size.height/3)*2);
    _imageView.backgroundColor = [UIColor redColor];
    
    
    [self addSubview:self.nameLabel];
    _nameLabel.frame = CGRectMake(20, _imageView.frame.size.height + 15, 120, 30);
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    
    
    [self addSubview:self.distanceLabel];
    _distanceLabel.frame = CGRectMake(self.frame.size.width-60, _imageView.frame.size.height + 15, 50, 20);
    _distanceLabel.backgroundColor = [UIColor clearColor];
    _distanceLabel.textColor = [UIColor lightGrayColor];
    _distanceLabel.font = [UIFont systemFontOfSize:13];
    _distanceLabel.textAlignment = NSTextAlignmentRight;
    
    
    [self addSubview:self.sexImageView];
    _sexImageView.frame = CGRectMake(20, _imageView.frame.size.height + 55, 7, 10);
    _sexImageView.backgroundColor = [UIColor whiteColor];

    
    [self addSubview:self.ageLabel];
    _ageLabel.frame = CGRectMake(32, _imageView.frame.size.height + 55, 30, 10);
    _ageLabel.backgroundColor = [UIColor clearColor];
    _ageLabel.textColor = [UIColor lightGrayColor];
    _ageLabel.font = [UIFont systemFontOfSize:13];
    _ageLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self addSubview:self.signLabel];
    _signLabel.frame = CGRectMake(20, _imageView.frame.size.height + 75, self.frame.size.width-40, 30);
    _signLabel.backgroundColor = [UIColor clearColor];
    _signLabel.textColor = [UIColor darkGrayColor];
    _signLabel.font = [UIFont systemFontOfSize:15];
    _signLabel.textAlignment = NSTextAlignmentLeft;
    
    
}
- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}
- (UILabel *)distanceLabel
{
    if (_distanceLabel == nil) {
        _distanceLabel = [[UILabel alloc] init];
    }
    return _distanceLabel;
}
- (UILabel *)ageLabel
{
    if (_ageLabel == nil) {
        _ageLabel = [[UILabel alloc] init];
    }
    return _ageLabel;
}
- (UILabel *)signLabel
{
    if (_signLabel == nil) {
        _signLabel = [[UILabel alloc] init];
    }
    return _signLabel;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
- (UIImageView *)sexImageView
{
    if (_sexImageView == nil) {
        _sexImageView = [[UIImageView alloc] init];
    }
    return _sexImageView;
}

@end
