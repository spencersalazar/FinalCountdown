//
//  CDSettingsViewController.m
//  Countdown
//
//  Created by Spencer Salazar on 3/19/14.
//  Copyright (c) 2014 Spencer Salazar. All rights reserved.
//

#import "CDSettingsViewController.h"
#import "CDCountdownViewController.h"

@interface CDSettingsViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet CDCountdownViewController *countdownViewController;

@end

@implementation CDSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait)
        return YES;
    return NO;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    
    return YES;
}

- (IBAction)startCountdown:(id)sender
{
    self.countdownViewController.text = self.textField.text;
    self.countdownViewController.date = self.datePicker.date;
    [self presentViewController:self.countdownViewController animated:YES completion:^(){ }];
}

@end
