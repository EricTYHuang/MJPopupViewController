//
//  NYPopupEffectObject.m
//  MJPopupViewControllerDemo
//
//  Created by erichuang on 2015/2/5.
//
//

#import "NYPopupEffectObject.h"

@implementation NYPopupEffectObject

- (id)init
{
    self = [super init];
    if (self) {
        self.popupHorizontal = NYPopupViewHorizontalCenter;
        self.popupVertical = NYPopupViewVerticalCenter;
        
        self.borderShift = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.popInAnimationTime = 0.35;
        self.popOutAnimationTime = 0.35;
        
        self.popupViewShift = CGPointMake(0, 0);
        
        self.isClipPopupView = YES;
    }
    return self;
}

- (CGRect)adjustBorderShiftWithFrame: (CGRect)sourceFrame
{
    CGRect frame = sourceFrame;
    
    frame.origin.y = self.borderShift.top;
    frame.size.height -= self.borderShift.top;
    frame.size.height -= self.borderShift.bottom;
    
    frame.origin.x = self.borderShift.left;
    frame.size.width -= self.borderShift.left;
    frame.size.width -= self.borderShift.right;
    
    return frame;
}
- (CGPoint)setPopupViewPositionWithSourceSize: (CGSize)sourceSize andPopupSize: (CGSize)popupSize
{
    float popupEndX;
    switch (self.popupHorizontal) {
        case NYPopupViewHorizontalLeftShift:
            popupEndX = self.popupViewShift.x;
            break;
        case NYPopupViewHorizontalRightShift:
            popupEndX = sourceSize.width - popupSize.width + self.popupViewShift.x;
            break;
        case NYPopupViewHorizontalCustom:
            popupEndX = self.customPopupPosition.x;
            break;
        case NYPopupViewHorizontalCenter:
        default:
            popupEndX = (sourceSize.width - popupSize.width) / 2;
            break;
    }

    float popupEndY;
    switch (self.popupVertical) {
        case NYPopupViewVerticalTopShift:
            popupEndY = self.popupViewShift.y;
            break;
        case NYPopupViewVerticalBottomShift:
            popupEndY = sourceSize.height - popupSize.height + self.popupViewShift.y;
            break;
        case NYPopupViewVerticalCustom:
            popupEndY = self.customPopupPosition.y;
            break;
        case NYPopupViewVerticalCenter:
        default:
            popupEndY = (sourceSize.height - popupSize.height) / 2;
            break;
    }

    return CGPointMake(popupEndX, popupEndY);
}
@end
