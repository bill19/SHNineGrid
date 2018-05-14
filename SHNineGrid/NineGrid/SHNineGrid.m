//
//  SHNineGrid.m
//  SHNineGrid
//
//  Created by HaoSun on 2018/4/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHNineGrid.h"
#import "SHGridNode.h"
#import "SDWebImageManager.h"
@interface SHNineGrid ()


@end

@implementation SHNineGrid


- (void)setupSubViews {
    if (_imageModels.count > 1 || self.nineGridStyle == SHNineGridStyleEqual) {//假如多张图

        for (NSInteger index = 0; index < _imageModels.count; index ++) {
            NSInteger row = index / kMaxImageForRow;//行号
            NSInteger loc = index % kMaxImageForRow;//列号
            CGFloat nodeX = kGridNodeWidth * loc;
            CGFloat nodeY = kGridNodeWidth * row;
            //增加一个node
            SHGridNode *node = [[SHGridNode alloc] initWithFrame:CGRectMake(nodeX, nodeY, kGridNodeWidth, kGridNodeWidth)];
            node.nodeModel = [_imageModels objectAtIndex:index];
            [self addSubview:node];
        }
        CGFloat nineGridWidth  = kGridNodeWidth * kMaxImageForRow;
        CGFloat nineGridHeight = kGridNodeWidth * (((_imageModels.count - 1) / kMaxImageForRow) + 1);
        CGSize nineGridSize = CGSizeMake(nineGridWidth, nineGridHeight);
        [self.delegate sh_nineGridUpdateSize:nineGridSize];

    }else{
        //增加一个node
        SDWebImageManager *sdManager = [SDWebImageManager sharedManager];
        __weak typeof(self) weakSelf = self;
        [[sdManager imageCache] queryCacheOperationForKey:weakSelf.imageModels.firstObject.imageUrl done:^(UIImage * _Nullable image, NSData * _Nullable data, SDImageCacheType cacheType) {
            if (image) {
                CGRect rect;
                rect.origin = CGPointMake(kGridNodePadding,kGridNodePadding);
                rect.size = [self sizeWithImage:image];
                SHGridNode *node = [[SHGridNode alloc] initWithFrame:rect];
                node.nodeModel = [weakSelf.imageModels firstObject];
                [self addSubview:node];
            }else{
                SHGridNodeModel *model = [self.imageModels firstObject];
                [sdManager.imageDownloader downloadImageWithURL:[NSURL URLWithString:model.imageUrl] options:nil progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
                } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                    CGRect rect;
                    rect.origin = CGPointMake(kGridNodePadding,kGridNodePadding);
                    rect.size = [self sizeWithImage:image];
                    SHGridNode *node = [[SHGridNode alloc] initWithFrame:rect];
                    node.nodeModel = [weakSelf.imageModels firstObject];
                    [self addSubview:node];
                }];
            }
        }];
    }

}

- (CGSize)sizeWithImage:(UIImage *)image {
    CGFloat imageWidth  = image.size.width;
    CGFloat imageHeight = image.size.height;
    if (imageWidth == imageHeight) {
        return CGSizeMake(kGridNodeWidth*2, kGridNodeWidth*2);
    }
    if (imageWidth > imageHeight) {
        return CGSizeMake(kGridNodeWidth*2, kGridNodeWidth*2*(imageHeight/imageWidth));
    }
    if (imageWidth < imageHeight) {
        return CGSizeMake(kGridNodeWidth*2*(imageHeight/imageWidth), kGridNodeWidth*2);
    }
    return CGSizeZero;
}

- (void)setImageModels:(NSArray<SHGridNodeModel *> *)imageModels {
    _imageModels = imageModels;

    [self setupSubViews];
}

@end
