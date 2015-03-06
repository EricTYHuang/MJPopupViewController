//
//  MJSecondDetailViewController.h
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MJPopupViewController.h"

@interface MJSecondDetailViewController : UIViewController

@property (assign, nonatomic) id <NYPopupAndDismissProtocol> delegate;

@end