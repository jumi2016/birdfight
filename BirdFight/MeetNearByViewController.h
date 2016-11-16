//
//  MeetNearByViewController.h
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSwipeableView.h"
typedef NS_ENUM(NSInteger, HandleDirectionType) {
    HandleDirectionLeft        = 0,
    HandleFlowers              = 1,
    HandleDirectionRight       = 2,
};


@interface MeetNearByViewController : UIViewController

@property (nonatomic, strong) ZLSwipeableView *swipeableView;
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView;

@end
