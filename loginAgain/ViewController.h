//
//  ViewController.h
//  loginAgain
//
//  Created by Anastasiia Staiko on 3/3/16.
//  Copyright © 2016 Anastasiia Staiko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    BOOL checked;
}

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *checkBoxButton;




- (IBAction)registerUser:(id)sender;
- (IBAction)loginUser:(id)sender;

- (IBAction)checkButton:(id)sender;



-(void)checkPasswordMatch;
-(void)registerNewUser;


@end

