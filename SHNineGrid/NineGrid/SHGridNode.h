//
//  SHGridNode.h
//  SHNineGrid
//
//  Created by HaoSun on 2018/4/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHGridNodeModel.h"

@protocol SHGridNodeDelegate <NSObject>
@optional
/**
 点击这个图片

 @param nodeModel 获取图片信息
 */
- (void)gridNodeModelDidClickWithModel:(SHGridNodeModel *)nodeModel;

@end


@interface SHGridNode : UIView

@property (nonatomic, strong) SHGridNodeModel *nodeModel;

@end
