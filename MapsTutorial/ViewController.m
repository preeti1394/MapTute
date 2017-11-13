//
//  ViewController.m
//  MapsTutorial
//
//  Created by Raj Dhakate on 15/02/17.
//  Copyright © 2017 CodeBlood. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc]init];
    
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];

}



- (IBAction)getLocationAction:(UIButton *)sender
{
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
        
        [locationManager startUpdatingLocation];
    }
    
    NSLog(@"Updating Location");
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    NSLog(@"Location Updated");
    
    CLLocation *currentLocation = [locations lastObject];
    
    self.latitudeValue.text = [NSString stringWithFormat:@"%f", currentLocation.coordinate.latitude];
    
    self.longitudeValue.text = [NSString stringWithFormat:@"%f", currentLocation.coordinate.latitude];
    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    NSLog(@"Error : %@", [error localizedDescription]);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:^{
        nil;
    }];
}





@end
