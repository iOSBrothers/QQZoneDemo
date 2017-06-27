//
//  FriendModel.m
//  QQZoneDemo
//
//  Created by qianfeng on 15/3/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel

- (void)setPhotoArr:(NSMutableArray *)photoArr
{
    _photoArr = photoArr;
    switch (_photoArr.count) {
        case 0:
            _photoHeight = 0;
            break;
        case 1:
        case 2:
        case 3:
            _photoHeight = 90;
            break;
        case 4:
        case 5:
        case 6:
            _photoHeight = 170;
            break;
        default:
            _photoHeight = 240;
            break;
    }
}

- (void)setPraise:(NSString *)praise
{
    _praise = praise;
    
    _priseHeight = [_praise sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(284, 10000)].height;
}

- (void)setDiscuss:(NSString *)discuss
{
    _discuss = discuss;
    
    _discussHeight = [_discuss sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(284, 10000)].height;
}

@end
