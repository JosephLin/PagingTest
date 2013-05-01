//
//  ViewController.m
//  PagingTest
//
//  Created by Joseph Lin on 5/1/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    UIView *firstSubview = self.scrollView.subviews[0];
    self.scrollView.contentSize = firstSubview.frame.size;
    self.scrollView.decelerationRate = UIScrollViewDecelerationRateFast;

}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"velocity: %@", NSStringFromCGPoint(velocity));
    
    CGFloat pageWidth = 290.0;

    CGFloat x = targetContentOffset->x;
    NSLog(@"x: %f", x);
    
    if (velocity.x > 0.1)
        x = ceilf(x / pageWidth) * pageWidth;
    else if (velocity.x < -0.1)
        x = floorf(x / pageWidth) * pageWidth;
    else
        x = roundf(x / pageWidth) * pageWidth;
    targetContentOffset->x = x;
    NSLog(@"new x: %f", x);
}

@end
