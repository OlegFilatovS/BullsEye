//
//  AboutViewController.m
//  BullsEye
//
//  Created by Филатов Олег on 27.07.16.
//  Copyright © 2016 FilatovOleg. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"BullsEye" ofType:@"html"];
    
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.webViewAbout loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionCloseButton:(UIButton *)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL) prefersStatusBarHidden {
    return YES;
}


@end
