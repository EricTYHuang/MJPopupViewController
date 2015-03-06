//
//  MJViewController.m
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import "MJViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "MJDetailViewController.h"
#import "MJSecondDetailViewController.h"

#import "NYPopupEffectObject.h"

@interface MJViewController () <NYPopupAndDismissProtocol>{
    NSArray *actions;
    NSArray *animations;
}
@end

@implementation MJViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        animations = [NSArray arrayWithObjects:
                      @"fade in",
                      @"slide - bottom to top",
                      @"slide - bottom to bottom",
                      @"slide - top to top",
                      @"slide - top to bottom",
                      @"slide - left to left",
                      @"slide - left to right",
                      @"slide - right to left",
                      @"slide - right to right",
                      nil];
        actions = [NSArray arrayWithObjects:
                   @"popup with user interaction",
                   nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown) || (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

- (void)dismissViewController:(id)data {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [animations count];
            break;
            
        default:
            return [actions count];
            break;
    };
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [animations objectAtIndex:indexPath.row];
            break;
            
        default:
            cell.textLabel.text = [actions objectAtIndex:indexPath.row];
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Animations";
            break;
            
        default:
            return @"Actions";
            break;
    };
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: {
            MJDetailViewController *detailViewController = [[MJDetailViewController alloc] initWithNibName:@"MJDetailViewController" bundle:nil];
            
            //custom background, use UIView
//            detailViewController.customPopupBackgroundView = [[UIView alloc] initWithFrame:self.view.frame];
//            detailViewController.customPopupBackgroundView.backgroundColor = [UIColor greenColor];
            detailViewController.popupEffectObject = [[NYPopupEffectObject alloc] init];
            detailViewController.popupEffectObject.borderShift = UIEdgeInsetsMake(0, 0, 44, 0);
            detailViewController.popupEffectObject.popupVertical = NYPopupViewVerticalBottomShift;
            detailViewController.popupEffectObject.popupViewShift = CGPointMake(0, -44);
            [self presentPopupViewController:detailViewController animationType:indexPath.row];
        }
            break;
            
        default: {
            MJSecondDetailViewController *secondDetailViewController = [[MJSecondDetailViewController alloc] initWithNibName:@"MJSecondDetailViewController" bundle:nil];
            secondDetailViewController.delegate = self;
            [self presentPopupViewController:secondDetailViewController animationType:MJPopupViewAnimationFade];
            
        }
            break;
    }
    [tableView deselectRowAtIndexPath:tableView.indexPathForSelectedRow animated:YES];
}

@end
