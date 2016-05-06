//
//  UINavigationBar+BottonLine.m
//  BlurTest
//
//  Created by syfh on 16/1/6.
//  Copyright © 2016年 syfh. All rights reserved.
//

#import "UINavigationBar+BottomLine.h"
#import <objc/runtime.h>

@implementation UINavigationBar (BottomLine)

static char overlayKey;

- (UIView *)overlay {
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)NavBackgroundColor:(UIColor *)backgroundColor {
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:1];
    }
    self.overlay.backgroundColor = backgroundColor;
}

- (void)NavReset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}

- (void)bottomLineHidden:(BOOL)isBottomLineHidden {
    if (isBottomLineHidden) {
        [self findBottomLineUnder:self].hidden = isBottomLineHidden;
    } else {
        [self findBottomLineUnder:self].hidden = isBottomLineHidden;
    }
}

- (void)bottomLineAlpha:(CGFloat)alpha {
    [self findBottomLineUnder:self].alpha = alpha;
}

- (void)effectViewCustom:(effectViewCustomStyle)effectViewCustom {
    if (effectViewCustom == effectViewCustomDefault) {
        return;
    }
    
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            for (UIView *backdropView in subview.subviews) {
                if ([backdropView isKindOfClass:NSClassFromString(@"_UIBackdropView")]) {
                    
                    if (effectViewCustom == effectViewCustomClear) {
                        [self deleteBackdropEffectViewWithView:backdropView];
                    } else {
                        [self deleteBackdropEffectViewWithView:backdropView];
                        
                        UIVisualEffectView *visualEffectView = [self customVisualEffectViewWithStyle:effectViewCustom];
                        [backdropView addSubview:visualEffectView];
                    }
                }
            }
        }
    }
}

- (void)deleteBackdropEffectViewWithView:(UIView *)view {
    for (UIView *backdropEffectView in view.subviews) {
        if ([backdropEffectView isKindOfClass:NSClassFromString(@"_UIBackdropEffectView")]) {
            [backdropEffectView removeFromSuperview];
        }
        if ([backdropEffectView isKindOfClass:NSClassFromString(@"UIVisualEffectView")]) {
            [backdropEffectView removeFromSuperview];
        }
    }
}

- (UIVisualEffectView *)customVisualEffectViewWithStyle:(effectViewCustomStyle)effectViewCustom {
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyle)effectViewCustom];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView *contentVisualEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    contentVisualEffectView.frame = visualEffectView.bounds;
    [visualEffectView.contentView addSubview:contentVisualEffectView];
    
    return visualEffectView;
}

- (UIImageView *)findBottomLineUnder:(UIView *)view {
    
    for (UIView *subviwe in view.subviews) {
        if ([subviwe isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            for (UIView *imageView in subviwe.subviews) {
                if ([imageView isKindOfClass:NSClassFromString(@"UIImageView")] && imageView.bounds.size.height <= 1.0) {
                    return (UIImageView *)imageView;
                }
            }
        }
    }
    return nil;
}

@end
