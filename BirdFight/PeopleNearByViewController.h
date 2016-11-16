//
//  PeopleNearByViewController.h
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"

typedef void(^TapButtonBlock)();

typedef void(^TapHeadImageBlock)(UserInfo * info);

@interface PeopleNearByViewController : UIViewController

@property (nonatomic, strong) TapButtonBlock block;

@property (nonatomic, strong) TapHeadImageBlock headBlock;

@end
