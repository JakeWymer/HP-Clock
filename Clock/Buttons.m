//
//  Buttons.m
//  Clock
//
//  Created by Jakey on 4/4/16.
//  Copyright © 2016 Jakey. All rights reserved.
//

#import "Buttons.h"

@implementation Buttons

NSString *data;
NSString *currentLocation;
NSString *savedLocation;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *savedLocation = [[NSUserDefaults standardUserDefaults]
                               stringForKey:@"clocklocation"].lowercaseString;
    if(savedLocation != nil){
        _currentLocationLabel.text = savedLocation;
    }
    
}

- (IBAction)Home:(id)sender {
    
    data = @"home";
    [self setLocation:data];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
    
}

- (IBAction)School:(id)sender {
    data = @"school";
    [self setLocation:data];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Work:(id)sender {
    data = @"work";
    [self setLocation:data];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Travel:(id)sender {
    data = @"travel";
    [self setLocation:data];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Jail:(id)sender {
    data = @"jail";
    [self setLocation:data];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Pub:(id)sender {
    data = @"pub";
    [self setLocation:data];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Mischief:(id)sender {
    data = @"mischief";
    [self setLocation:data];
    
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (void)sendData:data{
    NSLog(@"%@ sent!", data);
    
    //Login to the cloud
    [[SparkCloud sharedInstance] loginWithUser:@"wymerbaseball14@gmail.com" password:@"Annabe113" completion:^(NSError *error) {
        if (!error)
            NSLog(@"Logged in to cloud");
        else
            NSLog(@"Wrong credentials or no internet connectivity, please try again");
    }];
    
    //Connect to jake_photon and set as myPhoton
    __block SparkDevice *myPhoton;
    NSString *deviceID = @"27002b000a47343432313031";
    [[SparkCloud sharedInstance] getDevice:deviceID completion:^(SparkDevice *device, NSError *error) {
        if (!error){
            myPhoton = device;
            NSLog(@"%@", device.name);
            
            [device callFunction:@"clockControl" withArguments:@[data] completion:^(NSNumber *resultCode, NSError *error) {
                if (!error)
                {
                    NSLog(@"%@ Turned On", data);
                }
            }];
            
        }//END
        
    }];

}

- (void)setLocation:data{
    currentLocation = data;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:@"clocklocation"];
    [defaults synchronize];
    _currentLocationLabel.text = data;
}
@end
