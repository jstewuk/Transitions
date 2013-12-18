//
//  MasterViewController.m
//  Transitions
//
//  Created by Jim on 12/18/13.
//  Copyright (c) 2013 Jim. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "AnimationController.h"

@interface MasterViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic, copy) NSArray *objects;
@property (nonatomic, strong) AnimationController *animationController;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    self.objects = @[
                     @"Transition"
                     ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AnimationController *)animationController {
    if (_animationController == nil) {
        _animationController = [[AnimationController alloc] init];
    }
    return _animationController;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *object = self.objects[indexPath.row];
    cell.textLabel.text = object;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    self.animationController.reverse = (operation == UINavigationControllerOperationPop);
    return self.animationController;
}

@end
