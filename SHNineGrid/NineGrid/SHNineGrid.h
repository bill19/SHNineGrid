//
//  SHNineGrid.h
//  SHNineGrid
//
//  Created by HaoSun on 2018/4/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SHGridNodeModel.h"
#import "SHGridConfig.h"
typedef NS_OPTIONS(NSUInteger, SHNineGridStyle) {
    SHNineGridStyleNormal       = 0, // 多种情况展示 1张图 多张图
    SHNineGridStyleEqual        = 1 << 0,//全是九宫格时候
};

@protocol SHNineGridDelegate <NSObject>

@optional
- (void)sh_nineGridUpdateSize:(CGSize)size;

@end


@interface SHNineGrid : UIView

@property (nonatomic, strong) NSArray <SHGridNodeModel *> *imageModels;

@property (nonatomic, assign) SHNineGridStyle nineGridStyle;

@property (nonatomic, weak) id <SHNineGridDelegate> delegate;

@end
