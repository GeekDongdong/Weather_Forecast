//
//  CellOne.m
//  weather forecast
//
//  Created by JACK on 2017/8/9.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "CellOne.h"

@implementation CellOne

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.advice];
        self.selectionStyle = UITableViewCellEditingStyleNone;
    }
    return self;
}
- (UIImageView *)imageViewe{
    if (!_imageViewe) {
        self.imageViewe = [[UIImageView alloc]init];
        self.imageViewe.frame = CGRectMake(10, 10, 60, 60);
    }
    return self.imageView;
}
- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 120, 20)];
        _title.font = [UIFont systemFontOfSize:17];
    }
    return _title;
}
- (UILabel *)advice{
    if (!_advice) {
        _advice = [[UILabel alloc]initWithFrame:CGRectMake(80, 40, 200, 35)];
        _advice.numberOfLines = 0;
        _advice.font = [UIFont systemFontOfSize:14];
        _advice.textColor = [UIColor lightGrayColor];
    }
    return _advice;
}
@end
