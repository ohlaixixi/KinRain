//
//  LXGoodsAttributeCell.h
//  Yml
//
//  Created by LX on 2017/11/27.
//  Copyright © 2017年 xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXGoodsAttributeCell : UICollectionViewCell

@property (nonatomic, copy) NSString *attrText;

- (CGSize)sizeForCell;

@end
