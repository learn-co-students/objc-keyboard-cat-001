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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBottomConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *catImage = [UIImage animatedImageNamed:@"keyboard-cat-" duration:3];
    self.imageView.image = catImage;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangePosition:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangePosition:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillChangePosition:(NSNotification *)notification
{
    CGRect keyboardFrame;
    if([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
        // Going away. Final frame will be the zero frame
        keyboardFrame = CGRectZero;
    }
    else {
        // Coming up. Grab the expanded keyboard frame
        keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    }

    UIViewAnimationCurve curve = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:curve];
        self.textViewBottomConstraint.constant = keyboardFrame.size.height + 20;
        self.imageBottomConstraint.constant = keyboardFrame.size.height;

        [self.view layoutIfNeeded];
    }];
}

@end
