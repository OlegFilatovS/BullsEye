//
//  ViewController.h
//  BullsEye
//
//  Created by Филатов Олег on 25.07.16.
//  Copyright © 2016 FilatovOleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *targetLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert:(UIButton *)sender;

- (IBAction)sliderMoved:(UISlider *)sender;

- (IBAction)actionStartOver:(UIButton *)sender;

@end

