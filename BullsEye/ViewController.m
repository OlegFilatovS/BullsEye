//
//  ViewController.m
//  BullsEye
//
//  Created by Филатов Олег on 25.07.16.
//  Copyright © 2016 FilatovOleg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(assign,nonatomic) NSInteger currentValue;
@property(assign,nonatomic) NSInteger targetValue;
@property(assign,nonatomic) NSInteger score;
@property(assign,nonatomic) NSInteger round;



@end

@implementation ViewController


#pragma  mark initials


- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
    
    self.round = 0;
    
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) startNewRound
{
    self.currentValue = 50;
    self.targetValue = 1 + arc4random_uniform(100);
    self.slider.value = self.currentValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Labels

-(void) updateLabels {
    
    self.targetLabel.text = [NSString stringWithFormat:@"%ld", (long)self.targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",(long)self.score];
    self.roundLabel.text = [NSString stringWithFormat:@"%ld",(long)self.round];
}



#pragma mark Actions

- (IBAction)showAlert:(UIButton *)sender {
    
    NSInteger difference = labs(self.currentValue - self.targetValue);
    NSInteger points = 100 - difference;

    self.round++;
    
    NSString *title;
    if (difference==0) {
        title = @"Perfect!";
        self.score +=100;
    }
    else if (difference==1) {
        title =@"Close shot!";
        self.score +=50;
    }
    else if (difference<=5) title = @"You almost had it!";
    else if (difference<=10) title = @"Pretty good!";
    else title = @"Not even close,are you drunk?";
    self.score +=points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %ld points",(long)points];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: message  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                                       [self startNewRound];
                                       [self updateLabels];
                                   }];
    
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

- (IBAction)sliderMoved:(UISlider *)sender {
    
    self.currentValue = lroundf(sender.value);
}

- (IBAction)actionStartOver:(UIButton *)sender {
    
    CATransition * transition =[CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseOut];
    
    self.score = 0;
    self.round = 0;
    
    [self startNewRound];
    
    [self updateLabels];
    
    [self.view.layer addAnimation:transition forKey:nil];
    
    
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}



@end
