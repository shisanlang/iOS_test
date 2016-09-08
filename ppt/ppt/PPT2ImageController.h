//
//  PPT2ImageController.h
//  ppt
//
//  Created by 十三郎 on 16/9/7.
//  Copyright © 2016年 QianHai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PptImageBlock)(NSArray * pptImageArray);

@interface PPT2ImageController : UIView<UIWebViewDelegate>

@property (nonatomic, strong) PptImageBlock imageBlock;
- (void)pptImageArrayWithBlock:(PptImageBlock)block;


- (void)imageArrayWithPptPath:(NSURL*)fileUrl;
//- (NSArray*)imageArrayWithPptPath:(NSURL*)fileUrl;


@end
