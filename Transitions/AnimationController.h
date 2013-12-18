//
//  AnimationController.h
//  Transitions
//
//  Created by Jim on 12/18/13.
//  Copyright (c) 2013 Jim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationController : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL reverse;

@end
