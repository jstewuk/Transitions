//
//  AnimationController.m
//  Transitions
//
//  Created by Jim on 12/18/13.
//  Copyright (c) 2013 Jim. All rights reserved.
//

#import "AnimationController.h"

@implementation AnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // state
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    CGRect pushedFrame = [transitionContext finalFrameForViewController:toViewController];
        
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect poppedFrame = CGRectOffset(pushedFrame, 0, screenBounds.size.height);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (self.reverse) {
        toViewController.view.frame = pushedFrame;
        [container insertSubview:toViewController.view atIndex:0];
        
        [UIView
         animateWithDuration:duration
         animations:^{
             fromViewController.view.frame = poppedFrame;
         }
         completion:^(BOOL finished) {
             [transitionContext completeTransition:! [transitionContext transitionWasCancelled]];
         }];
    } else {
        toViewController.view.frame = poppedFrame;
        [container addSubview:toViewController.view];
        
        [UIView
         animateWithDuration:duration
         animations:^{
             toViewController.view.frame = pushedFrame;
         }
         completion:^(BOOL finished) {
             [transitionContext completeTransition:! [transitionContext transitionWasCancelled]];
         }];
    }
}

@end
