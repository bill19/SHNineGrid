//
//  SHGridNodeModel.h
//  SHNineGrid
//
//  Created by HaoSun on 2018/4/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHGridNodeModel : NSObject

/**
 下标
 */
@property (nonatomic, assign) NSInteger nodeIndex;

/**
 网络的 - 图片url
 */
@property (nonatomic, copy) NSString *imageUrl;

/**
 连接 url
 */
@property (nonatomic, copy) NSString *linkUrl;

/**
 占位图 1- 当你有缩略图的时候，可以直接用这个
 */
@property (nonatomic, strong) UIImage *placeholderImage;

@end
