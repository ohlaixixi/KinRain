//
//  LXGoodsAttributeCell.h
//  Yml
//
//  Created by LX on 2017/11/27.
//  Copyright © 2017年 xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LXGoodsAttributeCellDelegate <NSObject>

- (void)heightForAttributeCell:(CGFloat)cellHeight whiteRow:(NSInteger)index;

@end

@interface LXGoodsAttributeCell : UITableViewCell

// 规格数组
@property (nonatomic, strong) NSDictionary *attrs;

@property (nonatomic, weak) id<LXGoodsAttributeCellDelegate> delegate;

- (CGFloat)heightForCell;

@end
