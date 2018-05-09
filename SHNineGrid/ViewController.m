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

    SHNineGrid *nineGridView = [[SHNineGrid alloc] initWithFrame:CGRectMake(50, 100, kGridNodeWidth * 3, 500)];
    nineGridView.delegate = self;
    nineGridView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:nineGridView];

    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < 1; index++) {
        SHGridNodeModel *model = [[SHGridNodeModel alloc] init];
//        model.imageUrl = @"http://img.zcool.cn/community/018d4e554967920000019ae9df1533.jpg@900w_1l_2o_100sh.jpg";
        model.imageUrl = @"http://img3.3lian.com/2013/c2/78/d/38.jpg";
        model.nodeIndex = index;
        [mu addObject:model];
    }
    nineGridView.imageModels = mu;
}


- (void)sh_nineGridUpdateSize:(CGSize)size {
    NSLog(@"-- %lf %lf",size.width,size.height);
}

@end
