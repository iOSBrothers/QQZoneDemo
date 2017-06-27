//
//  FriendCell.h
//  QQZoneDemo
//
//  Created by qianfeng on 15/3/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendModel.h"

typedef void (^sendMsg)(NSString * msg,NSInteger row);

@interface FriendCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic,strong) FriendModel * model;
@property (nonatomic,copy) sendMsg callbk;
// 当前被用户点击的行号
@property (nonatomic,assign) NSUInteger row;

@end
