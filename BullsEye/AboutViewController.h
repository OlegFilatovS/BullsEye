//
//  AboutViewController.h
//  BullsEye
//
//  Created by Филатов Олег on 27.07.16.
//  Copyright © 2016 FilatovOleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webViewAbout;

- (IBAction)actionCloseButton:(UIButton *)sender;

@end