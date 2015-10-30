//
//  ViewController.m
//  KeyboardCat
//
//  Created by Timothy Clem on 10/29/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *catImage = [UIImage animatedImageNamed:@"keyboard-cat-" duration:3];
    self.imageView.image = catImage;
}

@end
