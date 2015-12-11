//
//  ViewController.m
//  ControlsTest
//
//  Created by Nikolay Berlioz on 02.12.15.
//  Copyright © 2015 Nikolay Berlioz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef enum
{
    ColorSchemeTypeRGB,
    ColorSchemeTypeHSV
    
}ColorSchemeType;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self refreshScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void) refreshScreen
{
    CGFloat red = self.redComponentSlider.value;
    CGFloat green = self.greenComponentSlider.value;
    CGFloat blue = self.blueComponentSlider.value;
    
    
    
    UIColor *color = nil;
    
    if (self.colorSchemeControl.selectedSegmentIndex == ColorSchemeTypeRGB)
    {
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
    }
    else
    {
        color = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1.f];
    }
    
    CGFloat hue, saturation, brightness, alpha;
    
    NSString *result = @"";
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha])
    {
        result = [result stringByAppendingFormat:@"RGB:{%.2f, %.2f, %.2f}", red, green, blue];
    }
    else
    {
        result = [result stringByAppendingFormat:@"RGB:{NO DATA}"];
    }
    
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha])
    {
        result = [result stringByAppendingFormat:@"\tHSV:{%.2f, %.2f, %.2f}", hue, saturation, brightness];
    }
    else
    {
        result = [result stringByAppendingFormat:@"\tHSV:{NO DATA}"];
    }
    
    self.infoLabel.text = result;
    
    self.view.backgroundColor = color;
}


#pragma mark - Actions

- (IBAction)actionSlider:(UISlider *)sender
{
    [self refreshScreen];
}
- (IBAction)actionEnabled:(UISwitch *)sender
{
    self.redComponentSlider.enabled = sender.isOn;
    self.greenComponentSlider.enabled = sender.isOn;
    self.blueComponentSlider.enabled = sender.isOn;
}

@end


























