//
//  NYPopupEffectObject.h
//  MJPopupViewControllerDemo
//
//  Created by erichuang on 2015/2/5.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    NYPopupViewVerticalCenter,
    NYPopupViewVerticalTopShift,
    NYPopupViewVerticalBottomShift,
    NYPopupViewVerticalCustom,
} NYPopupViewVerticalPosition;

typedef enum {
    NYPopupViewHorizontalCenter,
    NYPopupViewHorizontalLeftShift,
    NYPopupViewHorizontalRightShift,
    NYPopupViewHorizontalCustom,
} NYPopupViewHorizontalPosition;

//typedef enum {
//    temp00
//} NYSlideInHorizontalPosition;
//
//typedef enum {
//    temp01
//} NYSlideOutHorizontalPosition;

@interface NYPopupEffectObject : NSObject

@property (nonatomic, assign) NYPopupViewVerticalPosition popupVertical;
@property (nonatomic, assign) NYPopupViewHorizontalPosition popupHorizontal;

@property (nonatomic, assign) UIEdgeInsets borderShift;
@property (nonatomic, assign) CGPoint customPopupPosition;
@property (nonatomic, assign) CGPoint popupViewShift;

@property (nonatomic, assign) float popInAnimationTime;
@property (nonatomic, assign) float popOutAnimationTime;

@property (nonatomic, assign) BOOL isClipPopupView;

- (CGRect)adjustBorderShiftWithFrame: (CGRect)sourceFrame;
- (CGPoint)setPopupViewPositionWithSourceSize: (CGSize)sourceSize andPopupSize: (CGSize)popupSize;

@end
