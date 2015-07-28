//
//  ViewController.m
//  TipCalculator
//
//  Created by Richard Lee on 7/26/15.
//  Copyright (c) 2015 lifuzu. All rights reserved.
//
@import Foundation;
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *tip10Label;
@property (weak, nonatomic) IBOutlet UILabel *tip12Label;
@property (weak, nonatomic) IBOutlet UILabel *tip15Label;
@property (weak, nonatomic) IBOutlet UILabel *tip18Label;
@property (weak, nonatomic) IBOutlet UILabel *tip20Label;

- (IBAction)calculate;
@end

@implementation ViewController

NSNumberFormatter *formatter;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Formatter initialization
    formatter = [NSNumberFormatter new];
    [formatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [formatter setLenient:YES];
    [formatter setGeneratesDecimalNumbers:YES];
    
    // Set the editor as the first focus
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate {
//    float num = [[self.textField.text componentsSeparatedByString:@"$"][1] floatValue];
    float num = [[formatter numberFromString:self.textField.text] floatValue];

    NSString *tip10Prefix = [self.tip10Label.text componentsSeparatedByString:@":"][0];
    self.tip10Label.text = [NSString stringWithFormat:@"%@: $%0.2f", tip10Prefix, 0.10*num+num];
    
    NSString *tip12Prefix = [self.tip12Label.text componentsSeparatedByString:@":"][0];
    self.tip12Label.text = [NSString stringWithFormat:@"%@: $%0.2f", tip12Prefix, 0.12*num+num];
    
    NSString *tip15Prefix = [self.tip15Label.text componentsSeparatedByString:@":"][0];
    self.tip15Label.text = [NSString stringWithFormat:@"%@: $%0.2f", tip15Prefix, 0.15*num+num];
    
    NSString *tip18Prefix = [self.tip18Label.text componentsSeparatedByString:@":"][0];
    self.tip18Label.text = [NSString stringWithFormat:@"%@: $%0.2f", tip18Prefix, 0.18*num+num];
    
    NSString *tip20Prefix = [self.tip20Label.text componentsSeparatedByString:@":"][0];
    self.tip20Label.text = [NSString stringWithFormat:@"%@: $%0.2f", tip20Prefix, 0.20*num+num];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *replaced = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSDecimalNumber *amount = (NSDecimalNumber*) [formatter numberFromString:replaced];
    if (amount == nil) {
        // Something screwed up the parsing. Probably an alpha character.
        return NO;
    }
    // If the field is empty (the inital case) the number should be shifted to
    // start in the right most decimal place.
    short powerOf10 = 0;
    if ([textField.text isEqualToString:@""]) {
        powerOf10 = -formatter.maximumFractionDigits;
    }
    // If the edit point is to the right of the decimal point we need to do
    // some shifting.
    else if (range.location + formatter.maximumFractionDigits >= textField.text.length) {
        // If there's a range of text selected, it'll delete part of the number
        // so shift it back to the right.
        if (range.length) {
            powerOf10 = -range.length;
        }
        // Otherwise they're adding this many characters so shift left.
        else {
            powerOf10 = [string length];
        }
    }
    amount = [amount decimalNumberByMultiplyingByPowerOf10:powerOf10];
    
    // Replace the value and then cancel this change.
    textField.text = [formatter stringFromNumber:amount];
    return NO;
}

@end
