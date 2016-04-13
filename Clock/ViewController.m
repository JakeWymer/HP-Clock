//
//  ViewController.m
//  Clock
//
//  Created by Jakey on 4/4/16.
//  Copyright © 2016 Jakey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize nameTxt;
NSString *firstName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    if (savedName != nil) {
        [self performSegueWithIdentifier:@"toButtons" sender:self];
    }
    
}

- (IBAction)login:(id)sender {
    firstName = self.nameTxt.text;
    NSLog(@"%@", firstName);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:firstName forKey:@"clockname"];
    [defaults synchronize];
}
@end
