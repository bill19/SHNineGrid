//
//  ViewController.m
//  SHNineGrid
//
//  Created by HaoSun on 2018/4/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHNineGrid.h"
#import "SHGridNodeModel.h"
@interface ViewController ()<SHNineGridDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SHNineGrid *nineGridView = [[SHNineGrid alloc] initWithFrame:CGRectMake(50, 100, kGridNodeWidth * 3, kGridNodeWidth * 3)];
    nineGridView.delegate = self;
    nineGridView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:nineGridView];

    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < 1; index++) {
        SHGridNodeModel *model = [[SHGridNodeModel alloc] init];
//        model.imageUrl = @"http://img.zcool.cn/community/018d4e554967920000019ae9df1533.jpg@900w_1l_2o_100sh.jpg";
        model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525943352529&di=1dbd026d223ff6d06c9797b87dfb9487&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F8d5494eef01f3a2948cdc7eb9325bc315c607c89.jpg";
        model.nodeIndex = index;
        [mu addObject:model];
    }
    nineGridView.imageModels = mu;
}


- (void)sh_nineGridUpdateSize:(CGSize)size {
    NSLog(@"-- %lf %lf",size.width,size.height);
}

@end
