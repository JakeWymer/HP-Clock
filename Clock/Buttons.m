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

- (IBAction)Home:(id)sender {
    
    data = @"home";
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
    
}

- (IBAction)School:(id)sender {
    data = @"school";
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Work:(id)sender {
    data = @"work";
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Travel:(id)sender {
    data = @"travel";
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Jail:(id)sender {
    data = @"jail";
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Pub:(id)sender {
    data = @"pub";
    NSString *savedName = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"clockname"].lowercaseString;
    
    data = [NSString stringWithFormat: @"%@ %@", savedName, data];
    
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSLog(data);
    [self sendData:data];
}

- (IBAction)Mischief:(id)sender {
    data = @"mischief";
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
    [[SparkCloud sharedInstance] loginWithUser:@"wymerbaseball14@gmail.com" password:@"ENTERPASSHERE" completion:^(NSError *error) {
        if (!error)
            NSLog(@"Logged in to cloud");
        else
            NSLog(@"Wrong credentials or no internet connectivity, please try again");
    }];
    
    //Connect to jake_photon and set as myPhoton
    __block SparkDevice *myPhoton;
    NSString *deviceID = @"ENTER DEVICE ID HERE";
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
@end
