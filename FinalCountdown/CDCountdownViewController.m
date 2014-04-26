//
//  CDViewController.m
//  Countdown
//
//  Created by Spencer Salazar on 3/19/14.
//  Copyright (c) 2014 Spencer Salazar. All rights reserved.
//

#import "CDCountdownViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CDCountdownViewController ()
{
    BOOL _finished;
    BOOL _blink;
}

@property (strong, nonatomic) IBOutlet CDView *countdownView;
@property (weak, nonatomic) IBOutlet NSTimer *timer;
@property (strong, nonatomic) AVAudioPlayer *player;

- (void)updateView;
- (void)timer:(NSTimer *)timer;

@end

@implementation CDCountdownViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    _finished = NO;
    [self updateView];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(timer:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)updateView
{
    NSDate *now = [NSDate date]; // current date
    NSTimeInterval interval = [self.date timeIntervalSinceDate:now];
    if(interval <= 0)
    {
        interval = 0;
        if(!_finished)
        {
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"finalcountdown.mp3" withExtension:@""]
                                                                 error:NULL];
            [self.player play];
            _finished = YES;
        }
    }
    
//    NSLog(@"%lf", interval);
    
    int days = floor(interval/(60*60*24));
    int hours = floor(interval/(60*60)) - days*24;
    int minutes = floor(interval/(60)) - days*24*60 - hours*60;
    int seconds = interval - days*24*60*60 - hours*60*60 - minutes*60;
    
    NSMutableString *text;
    
    if(self.text)
        text = [NSMutableString stringWithFormat:@"\n%@\n", self.text];
    else
        text = [NSMutableString stringWithFormat:@"\n\n"];
    
    if(days > 0)
    {
        [text appendString:[NSString stringWithFormat:@"%02i:", days]];
    }
    
    [text appendString:[NSString stringWithFormat:@"%02i:", hours]];
    [text appendString:[NSString stringWithFormat:@"%02i:", minutes]];
    [text appendString:[NSString stringWithFormat:@"%02i", seconds]];
    
    if(_finished && _blink)
    {
        self.countdownView.text = @"";
        [self.countdownView setNeedsDisplay];
    }
    else
    {
        self.countdownView.text = text;
        [self.countdownView setNeedsDisplay];
    }
}

- (void)timer:(NSTimer *)timer
{
    _blink = !_blink;
    [self updateView];
}

@end
