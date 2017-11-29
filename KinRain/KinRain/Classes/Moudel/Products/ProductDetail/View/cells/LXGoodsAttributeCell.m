//
//  LXGoodsAttributeCell.m
//  Yml
//
//  Created by LX on 2017/11/27.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXGoodsAttributeCell.h"

#define CellHeight 25

@interface LXGoodsAttributeCell ()

@property (nonatomic, strong) UILabel *attrLabel;

@end

@implementation LXGoodsAttributeCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.clipsToBounds = YES;
//        self.layer.cornerRadius = CellHeight / 2;
        self.backgroundColor = [UIColor grayColor];
        _attrLabel = [UILabel labelWithText:@"" textColor:[UIColor whiteColor] fontSize:14];
        [self addSubview:_attrLabel];
        [_attrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    return self;
}

- (void)setAttrText:(NSString *)attrText {
    _attrText = attrText;
    _attrLabel.text = attrText;
    [self layoutIfNeeded];
}

- (CGSize)sizeForCell {
    return CGSizeMake([_attrLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)].width + 20, CellHeight);
}
@end
