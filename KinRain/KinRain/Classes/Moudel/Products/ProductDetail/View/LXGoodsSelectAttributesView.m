//
//  LXGoodsSelectAttributesView.m
//  Yml
//
//  Created by LX on 2017/11/20.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXGoodsSelectAttributesView.h"
#import "LXGoodsAttributeCell.h"

@interface LXGoodsSelectAttributesView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *goodsImageView;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UICollectionView *attrSelectCollectionView;

@property (nonatomic, strong) LXGoodsAttributeCell *goodsAttrCell;

@property (nonatomic, strong) UIButton *shoppingCartBtn;

@property (nonatomic, strong) UIButton *buyBtn;


@end

@implementation LXGoodsSelectAttributesView

static NSString *GoodsAttributeCell = @"GoodsAttributeCell";

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {

    UIView *contentView = [[UIView alloc] initWithFrame:self.bounds];
    contentView.backgroundColor = [UIColor whiteColor];
    
    UIView *bottomView = [[UIView alloc] init];
    
    [self addSubview:contentView];
    [contentView addSubview:self.goodsImageView];
    [contentView addSubview:self.priceLabel];
    [contentView addSubview:self.attrSelectCollectionView];
    [contentView addSubview:bottomView];
    [bottomView addSubview:self.shoppingCartBtn];
    [bottomView addSubview:self.buyBtn];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(-30);
        make.left.equalTo(contentView).offset(10);
        make.width.height.equalTo(@120);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(30);
        make.left.equalTo(_goodsImageView.mas_right).offset(10);
    }];
    
    [_attrSelectCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsImageView.mas_bottom).offset(20);
        make.left.equalTo(contentView).offset(10);
        make.trailing.equalTo(contentView).offset(-10);
        make.bottom.equalTo(bottomView.mas_top).offset(10);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.trailing.bottom.equalTo(contentView);
        make.height.equalTo(@50);
    }];
    [_shoppingCartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(bottomView);
        make.right.equalTo(_buyBtn.mas_left);
        make.width.equalTo(_buyBtn);
    }];
    [_buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(bottomView);
        make.width.equalTo(_shoppingCartBtn);
    }];
}

#pragma mark - Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _attrArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *attrs = _attrArray[section][@"attr"];
    return attrs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LXGoodsAttributeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GoodsAttributeCell forIndexPath:indexPath];
    NSDictionary *sectionData = _attrArray[indexPath.section];
    cell.attrText = sectionData[@"attr"][indexPath.row];
    MLog(@"attrText=%@",sectionData[@"attr"][indexPath.row]);
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_goodsAttrCell == nil) {
        _goodsAttrCell = [[LXGoodsAttributeCell alloc] init];
    }
    NSDictionary *sectionData = _attrArray[indexPath.section];
    _goodsAttrCell.attrText = sectionData[@"attr"][indexPath.row];
    return [_goodsAttrCell sizeForCell];
}

#pragma mark - Action

- (void)setAttrArray:(NSArray *)attrArray {
    _attrArray = attrArray;
    [self.attrSelectCollectionView reloadData];
}

- (void)shoppingCartBtnClick {
    MLog(@"shoppingCartBtnClick");
}

- (void)buyBtnClick {
    MLog(@"buyBtnClick");
}

#pragma mark - Setter/Getter

- (UIImageView *)goodsImageView {
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc] init];
        _goodsImageView.backgroundColor = [UIColor redColor];
    }
    return _goodsImageView;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel labelWithText:@"$100" textColor:[UIColor blackColor] fontSize:16];
    }
    return _priceLabel;
}

- (UICollectionView *)attrSelectCollectionView {
    if (!_attrSelectCollectionView) {
//        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
//        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.imageBackgroudView.frame collectionViewLayout:layout];
//        [collectionView registerNib:[UINib nibWithNibName:@"QBBookImageCell" bundle:nil] forCellWithReuseIdentifier:bookImageCell];
//        layout.itemSize = CGSizeMake(self.width, 380);
//        layout.minimumLineSpacing = 0;
//        layout.minimumInteritemSpacing = 0;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        collectionView.backgroundColor = RGB(217, 217, 217);
//        collectionView.delegate = self;
//        collectionView.dataSource = self;
//        collectionView.showsHorizontalScrollIndicator = NO;
//        collectionView.pagingEnabled = YES;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.minimumLineSpacing = 5;
//        layout.minimumInteritemSpacing = 5;
        _attrSelectCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _attrSelectCollectionView.delegate = self;
        _attrSelectCollectionView.dataSource = self;
        _attrSelectCollectionView.backgroundColor = [UIColor whiteColor];
        [_attrSelectCollectionView registerClass:[LXGoodsAttributeCell class] forCellWithReuseIdentifier:GoodsAttributeCell];
        
    }
    return _attrSelectCollectionView;
}

- (UIButton *)shoppingCartBtn {
    if (!_shoppingCartBtn) {
        _shoppingCartBtn = [UIButton buttonWithTitle:@"加入购物车" withFontSize:16 withTitleColor:[UIColor orangeColor] withTarget:self withAction:@selector(shoppingCartBtnClick)];
        _shoppingCartBtn.backgroundColor = [UIColor lightGrayColor];
    }
    return _shoppingCartBtn;
}

- (UIButton *)buyBtn {
    if (!_buyBtn) {
        _buyBtn = [UIButton buttonWithTitle:@"立即购买" withFontSize:16 withTitleColor:[UIColor redColor] withTarget:self withAction:@selector(buyBtnClick)];
    }
    return _buyBtn;
}
@end
