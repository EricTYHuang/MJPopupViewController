//
//  UIViewController+MJPopupViewController.h
//  MJModalViewController
//
//  Created by Martin Juhasz on 11.05.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NYPopupEffectObject;

typedef enum {
    MJPopupViewAnimationFade = 0,
    MJPopupViewAnimationSlideBottomTop = 1,
    MJPopupViewAnimationSlideBottomBottom,
    MJPopupViewAnimationSlideTopTop,
    MJPopupViewAnimationSlideTopBottom,
    MJPopupViewAnimationSlideLeftLeft,
    MJPopupViewAnimationSlideLeftRight,
    MJPopupViewAnimationSlideRightLeft,
    MJPopupViewAnimationSlideRightRight,
} MJPopupViewAnimation;

@protocol NYPopupAndDismissProtocol <NSObject>

- (void)popupViewController;
- (void)dismissViewController;

@end

@interface UIViewController (MJPopupViewController)

@property (nonatomic, retain) UIViewController *mj_popupViewController;
@property (nonatomic, retain) UIView *customPopupBackgroundView;
@property (nonatomic, retain) NYPopupEffectObject *popupEffectObject;

- (void)presentPopupViewController: (UIViewController*)popupViewController animationType: (MJPopupViewAnimation)animationType;
- (void)presentPopupViewController: (UIViewController*)popupViewController animationType: (MJPopupViewAnimation)animationType dismissed:(void(^)(void))dismissed;
- (void)dismissPopupViewControllerWithanimationType:(MJPopupViewAnimation)animationType;

@end
