//
//  TableViewController.m
//  QQZoneDemo
//
//  Created by qianfeng on 15/3/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TableViewController.h"
#import "FriendModel.h"
#import "FriendCell.h"

@interface TableViewController ()
{
    NSMutableArray * _dataArr;
}
@end

@implementation TableViewController

- (void)loadDataFromNetwork
{
    _dataArr = [NSMutableArray array];
    NSArray * arr = @[@"张三",@"李四",@"王五",@"六麻子",@"七"];
    for (int i = 0; i < 20; i++) {
        FriendModel * m = [[FriendModel alloc] init];
        // 随机取arr中的名字
        m.name = arr[arc4random()%5];
        m.time = @"昨天00:00";
        // 照片 0-9随机数
        NSMutableArray * photoArr = [NSMutableArray array];
        int count = arc4random() % 10;
        for (int j = 0; j < count; j++) {
            // 图片是 0.png - 5.png之间 固j%6 将图片名保存与数组中
            [photoArr addObject:[NSString stringWithFormat:@"%d.png",j%6]];
        }
        m.photoArr = photoArr;
        m.say = @"hello world!";
        m.faceURL = @"1.png";
        // 点赞的人
        NSMutableString * praiseStr = [NSMutableString string];
        for (int j = 0; j <= i; j++) {
            // emoji 手机表情
            [praiseStr appendFormat:@"%@👍",arr[arc4random()%5]];
        }
        // 重写praise setter方法 完成计算
        m.praise = praiseStr;
        // 评论
        NSMutableString * dissStr = [NSMutableString string];
        for (int j = 0; j <= i; j++) {
            [dissStr appendString:@"duang duang duang~~~\n"];
        }
        m.discuss = dissStr;
        
        [_dataArr addObject:m];
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDataFromNetwork];
    
    // NibName必须是xib文件的名字  不是类名
    [self.tableView registerNib:[UINib nibWithNibName:@"FriendCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    FriendModel * m = _dataArr[indexPath.row];
    // 重写setter方法 完成所有控件的布局
    cell.model = m;
    // 记录下当前的行号
    cell.row = indexPath.row;
    
    // block实现 发送评论刷新Cell
    cell.callbk = ^(NSString * msg,NSInteger row){
        // 将新的评论追加到旧评论后
        NSString * str = [m.discuss stringByAppendingFormat:@"%@\n",msg];
        // 重新计算新评论的总高度
        m.discuss = str;
        // 刷新指定的Cell
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        // 数据模型中的高度值被刷新 heightForRowAtIndexPath 方法返回当前Cell的新高度
    };
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendModel * m = _dataArr[indexPath.row];
    return m.priseHeight + m.discussHeight + m.photoHeight + 200;
}

@end
