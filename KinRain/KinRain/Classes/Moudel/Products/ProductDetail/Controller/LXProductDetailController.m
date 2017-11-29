//
//  LXProductDetailController.m
//  Yml
//
//  Created by LX on 2017/11/17.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXProductDetailController.h"
#import "LXProductDetailView.h"
#import "LXGoodsSelectAttributesView.h"
#import "UIViewController+KNSemiModal.h"

@interface LXProductDetailController ()
// 选择商品规格
@property (nonatomic, strong) LXGoodsSelectAttributesView *selectAttributesView;

@end

@implementation LXProductDetailController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    LXProductDetailView *productDetailView = [[LXProductDetailView alloc] initWithFrame:self.view.bounds];
    __weak typeof(self) weakself = self;
    productDetailView.productDetailBackBlock = ^{
        [weakself.navigationController popViewControllerAnimated:YES];
    };
    
    productDetailView.productClickBlock = ^{
        [weakself test];
    };
    
    [self.view addSubview:productDetailView];
    

}

- (void)test {
    [self presentSemiView:self.selectAttributesView withOptions:@{
                                             KNSemiModalOptionKeys.parentAlpha : @0.8,
//                                             KNSemiModalOptionKeys.parentScale : @0.9,
                                             KNSemiModalOptionKeys.backgroundView : [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_01"]]
                                             }];
    NSArray *arrtArray = @[
                           @{@"title":@"颜色",@"attr":@[@"红色",@"蓝色",@"白色",@"黑色",@"一一色",@"一二色",@"三五色"]},
                           @{@"title":@"尺寸",@"attr":@[@"1000",@"2000",@"2",@"60",@"1321213",@"1212",@"test"]},
                           ];
    self.selectAttributesView.attrArray = arrtArray;
}

#pragma mark - Setter/Getter
- (LXGoodsSelectAttributesView *)selectAttributesView {
    if (!_selectAttributesView) {
        _selectAttributesView = [[LXGoodsSelectAttributesView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.65)];
    }
    return _selectAttributesView;
}

@end
