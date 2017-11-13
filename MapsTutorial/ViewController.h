//
//  ViewController.h
//  MapsTutorial
//
//  Created by Raj Dhakate on 15/02/17.
//  Copyright © 2017 CodeBlood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeValue;
@property (weak, nonatomic) IBOutlet UILabel *longitudeValue;
@property (weak, nonatomic) IBOutlet UILabel *addressValue;
- (IBAction)getLocationAction:(UIButton *)sender;

@end

