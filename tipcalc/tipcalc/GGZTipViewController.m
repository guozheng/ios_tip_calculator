//
//  GGZTipViewController.m
//  tipcalc
//
//  Created by Guozheng Ge on 6/4/14.
//  Copyright (c) 2014 gzge. All rights reserved.
//

#import "GGZTipViewController.h"

@interface GGZTipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation GGZTipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"$$$ Tip Calculator $$$";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    double billAmount = [self.billTextField.text doubleValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    double tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] doubleValue];
    double totalAmount = billAmount + tipAmount;
    
    NSLog(@"billAmount=%.2f, tipAmount=%.2f, totalAmount=%.2f", billAmount, tipAmount, totalAmount);
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}

// actions to happen when pressing enter in the billTextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.billTextField resignFirstResponder];
    [self.view endEditing:YES];
    [self updateValues];
    return YES;
}

// clear tip and total labels
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.tipLabel.text = @"$0.00";
    self.totalLabel.text = @"$0.00";
    return YES;
}

@end
