//
//  ViewController.m
//  Tipster
//
//  Created by Ernest Omondi on 6/26/18.
//  Copyright © 2018 Ernest Omondi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet
UITextField *billField;

@property (weak, nonatomic) IBOutlet
UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet
UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *tipTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTextLabel;
@property (weak, nonatomic) IBOutlet UIView *greyBar;
@property (weak, nonatomic) IBOutlet UILabel *billTextLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Tip Calculator";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    // self.view.endEditing(YES);
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    NSArray *percentages = @ [@(0.15), @(0.2), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double bill = [self.billField.text  doubleValue];
    double tip = tipPercentage * bill;
    double total = tip + bill;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 70,
            self.billField.frame.size.width,
            self.billField.frame.size.height + 70);
        
    }];
    
    [UIView animateWithDuration:0.1 animations:^{
        self.tipLabel.alpha = 0;
        self.billTextLabel.alpha = 0;
        self.totalTextLabel.alpha = 0;
        self.tipTextLabel.alpha = 0;
        self.greyBar.alpha = 0;
        self.tipControl.alpha = 0;
        self.totalLabel.alpha = 0;

    }];
    
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 70;
    newFrame.size.height -= 70;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        self.billField.borderStyle = UITextBorderStyleBezel;

    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.billField.layer.borderColor = UIColor.clearColor.CGColor;
        
        [self.billField setNeedsLayout];
        [self.billField layoutIfNeeded];
        self.tipLabel.alpha = 1;
        self.billTextLabel.alpha = 1;
        self.totalTextLabel.alpha = 1;
        self.tipTextLabel.alpha = 1;
        self.greyBar.alpha = 1;
        self.tipControl.alpha = 1;
        self.totalLabel.alpha = 1;
        

    }];
    
}


@end
