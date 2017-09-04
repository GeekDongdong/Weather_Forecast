//
//  CellTwo.m
//  weather forecast
//
//  Created by JACK on 2017/8/9.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "CellTwo.h"

@implementation CellTwo

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
        [self.contentView addSubview:self.label];
        self.selectionStyle = UITableViewCellEditingStyleNone;
    }
    return self;
}
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.frame = CGRectMake(10, 10, 100, 20);
        _label.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:15];
    }
    return _label;
}

@end
