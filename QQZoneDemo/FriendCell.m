//
//  FriendCell.m
//  QQZoneDemo
//
//  Created by qianfeng on 15/3/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FriendCell.h"

@implementation FriendCell
{
    __weak IBOutlet UIImageView *faceImageView;
    __weak IBOutlet UILabel *nameLb;
    __weak IBOutlet UILabel *timeLb;
    __weak IBOutlet UILabel *sayLb;
    __weak IBOutlet UIView *photoView;
    __weak IBOutlet UIView *bottomView;
    __weak IBOutlet UILabel *praiseLb;
    __weak IBOutlet UILabel *discussLb;
    __weak IBOutlet UITextField *inputField;
    
    
    __weak IBOutlet UIButton *praiseBtn;
    __weak IBOutlet UIButton *discussBtn;
}

// 图文混排原则  遵守控件从上到下布局
- (void)setModel:(FriendModel *)model
{
    _model = model;
    
    faceImageView.image = [UIImage imageNamed:model.faceURL];
    nameLb.text = model.name;
    timeLb.text = model.time;
    sayLb.text = model.say;
    praiseLb.text = model.praise;
    discussLb.text = model.discuss;
    
    [self refreshPhoto];
    
    // 调整所有控件布局
    photoView.frame = CGRectMake(12, 97, 300, _model.photoHeight);
    // 赞  评论 按钮的frame
    praiseBtn.frame = CGRectMake(172, 100+_model.photoHeight, 30, 30);
    discussBtn.frame = CGRectMake(252, 100+_model.photoHeight, 30, 30);
    
    // 赞 与 评论 Label inputField 的高度
    praiseLb.frame = CGRectMake(8, 8, 284, _model.priseHeight);
    discussLb.frame = CGRectMake(8, _model.priseHeight+10, 284, _model.discussHeight);
    inputField.frame = CGRectMake(8, discussLb.frame.origin.y+_model.discussHeight+10, 284, 30);
    // 调整bottomView的frame
    bottomView.frame = CGRectMake(10, praiseBtn.frame.origin.y+40, 300, _model.priseHeight+_model.discussHeight+60);
}

// 隐藏多余的照片
// cell复用：一旦这个cell被复用 那么上面所有子视图包括子视图的所有属性都会被复用
- (void)refreshPhoto
{
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            int temp = 3*i + j;
            UIImageView * imgView = (UIImageView *)[photoView viewWithTag:temp+10];
            // 图片应该显示
            if (_model.photoArr.count > temp) {
                // 必须写复原代码 否则复用问题必现
                imgView.frame = CGRectMake(8+95*j, 8+75*i, 90, 70);
                imgView.image = [UIImage imageNamed:_model.photoArr[temp]];
            }else{
            // 图片应该隐藏
                imgView.frame = CGRectZero;
            }
        }
    }
}

- (void)awakeFromNib {
    // Initialization code
    faceImageView.layer.cornerRadius = 25;
    inputField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 调用block
    if (_callbk) {
        _callbk(textField.text,self.row);
    }
    
    textField.text = @"";
    
    [textField resignFirstResponder];
    return YES;
}

@end
