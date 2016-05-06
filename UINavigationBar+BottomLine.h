//
//  UINavigationBar+BottonLine.h
//  BlurTest
//
//  Created by syfh on 16/1/6.
//  Copyright © 2016年 syfh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, effectViewCustomStyle) {
    effectViewCustomDefault = UIBlurEffectStyleExtraLight,//系统默认特效
    effectViewCustomLight   = UIBlurEffectStyleLight,//系统白
    effectViewCustomDark    = UIBlurEffectStyleDark,//系统黑
    effectViewCustomClear//自定义, 清除特效, 即全透明
};

@interface UINavigationBar (BottomLine)

/*!
 @author SYFH
 
 @brief 隐藏导航栏的分割线
 
 @param isBottomLineHidden 是否隐藏
 
 @since 1.0
 */
- (void)bottomLineHidden:(BOOL)isBottomLineHidden;

/*!
 @author SYFH
 
 @brief 设置导航栏的分割线的透明度
 
 @param alpha 透明度

 @since 1.0
 */
- (void)bottomLineAlpha:(CGFloat)alpha;

/*!
 @author SYFH
 
 @brief 自定义导航栏的半透明特效
 
 @param effectViewCustom 特效: 系统默认, 系统白, 系统黑, 清除特效(全透明)
 
 @since 1.0
 */
- (void)effectViewCustom:(effectViewCustomStyle)effectViewCustom;

/*!
 @author SYFH
 
 @brief 设置导航栏的背景颜色
 
 @param backgroundColor 背景色, 支持透明度
 
 @since 1.0
 */
- (void)NavBackgroundColor:(UIColor *)backgroundColor;

/*!
 @author SYFH
 
 @brief 还原默认值
 
 @since 1.0
 */
- (void)NavReset;

@end
