//
//  ViewController.m
//  TipCalculator
//
//  Created by Richard Lee on 7/26/15.
//  Copyright (c) 2015 lifuzu. All rights reserved.
//

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate {
    float num = [self.textField.text floatValue];
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
@end
