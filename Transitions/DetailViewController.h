//
//  DetailViewController.h
//  Transitions
//
//  Created by Jim on 12/18/13.
//  Copyright (c) 2013 Jim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
