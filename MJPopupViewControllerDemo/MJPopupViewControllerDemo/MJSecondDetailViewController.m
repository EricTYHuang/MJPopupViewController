//
//  MJSecondDetailViewController.m
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import "MJSecondDetailViewController.h"

@interface MJSecondDetailViewController ()

@end

@implementation MJSecondDetailViewController

@synthesize delegate;


- (IBAction)closePopup:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dismissViewController)]) {
        [self.delegate dismissViewController];
    }
}

@end
