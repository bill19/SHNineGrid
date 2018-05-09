//
//  SHGridNodeModel.m
//  SHNineGrid
//
//  Created by HaoSun on 2018/4/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHGridNodeModel.h"

@implementation SHGridNodeModel


- (UIImage *)placeholderImage {
    if (!_placeholderImage) {
        _placeholderImage = [UIImage imageNamed:@"placeHolder"];
    }
    return _placeholderImage;
}

@end
