//
//  FriendModel.h
//  QQZoneDemo
//
//  Created by qianfeng on 15/3/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FriendModel : NSObject

@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * time;
@property (nonatomic,copy) NSString * faceURL;
@property (nonatomic,copy) NSString * say;
@property (nonatomic,strong) NSMutableArray * photoArr;
@property (nonatomic,copy) NSString * praise;
@property (nonatomic,copy) NSString * discuss;

// 照片墙的高度 0  1-3   4-6   7-9四种情况
@property (nonatomic,assign,readonly) CGFloat photoHeight;
// 完整显示赞的人需要的控件高度
@property (nonatomic,assign,readonly) CGFloat priseHeight;
// 完整显示评论的人需要的控件高度
@property (nonatomic,assign,readonly) CGFloat discussHeight;

@end
