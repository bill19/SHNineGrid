//
//  SHGridNode.m
//  SHNineGrid
//
//  Created by HaoSun on 2018/4/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHGridNode.h"
#import "UIImageView+WebCache.h"
#import "SHGridConfig.h"

@interface SHGridNode ()

@property (nonatomic, weak) UIImageView *nodeImageView;

@end

@implementation SHGridNode

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *nodeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kGridNodePadding, kGridNodePadding, frame.size.width - kGridNodePadding * 2, frame.size.height - kGridNodePadding * 2)];
        nodeImageView.backgroundColor = [UIColor whiteColor];
        _nodeImageView = nodeImageView;
        [self addSubview:_nodeImageView];
    }
    return self;
}


- (void)setNodeModel:(SHGridNodeModel *)nodeModel {
    _nodeModel = nodeModel;
    [_nodeImageView sd_setImageWithURL:[NSURL URLWithString:_nodeModel.imageUrl] placeholderImage:_nodeModel.placeholderImage];
}

@end
