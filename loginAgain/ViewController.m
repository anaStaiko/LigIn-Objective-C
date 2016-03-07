//
//  ViewController.m
//  loginAgain
//
//  Created by Anastasiia Staiko on 3/3/16.
//  Copyright © 2016 Anastasiia Staiko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 

@end

@implementation ViewController

@synthesize checkBoxButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Check to see if you already registered user
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    checked = [defaults boolForKey:@"boxIsChecked"];
    
    if (![defaults boolForKey:@"registered"]) {
        NSLog(@"No user registered");
        _loginBtn.hidden = YES;
    } else {
        NSLog(@"user is registered");
        _reEnterPasswordField.hidden = YES;
        _registerBtn.hidden = YES;
    }
    
    [self checkTheBox]; 

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(id)sender {
    
    if ([_usernameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        
 //
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Error"
                                              message:@"You must complete all fields."
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             }];
        
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];

    } else {
        
        [self checkPasswordMatch];
    }
}



-(void)checkPasswordMatch {
    if ([_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        NSLog(@"password match");
        [self registerNewUser];
    } else {
        NSLog(@"password don't match");
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Error"
                                              message:@"Your entered password doesn't match."
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             }];
        
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];

    }
}



-(void)registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_usernameField.text forKey:@"username"];
    [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    // saves info to the memory
    
    [defaults synchronize];
    
  
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Success"
                                          message:@"Your have registered a new user."
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
 
    [self performSegueWithIdentifier:@"login" sender:self];
    
}




- (IBAction)loginUser:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([_usernameField.text isEqualToString:[defaults objectForKey:@"username"]] && [_passwordField.text isEqualToString:[defaults objectForKey:@"password"]])
        
    {
        NSLog(@"login credentials accepted");
        _usernameField.text = nil;
        _passwordField.text = nil;
        [self performSegueWithIdentifier:@"login" sender:self];

    } else if (checked) {
        
        [self performSegueWithIdentifier:@"login" sender:self];
        
    } else {
        NSLog(@"login credentials incorrect");

        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Error"
                                              message:@"Your username or password doesn't match."
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             }];
        
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];

    }
    
}

- (IBAction)checkButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if(!checked) {
        [checkBoxButton setImage:[UIImage imageNamed:@"cbu.png"] forState:UIControlStateNormal];
        checked = YES;
        [defaults setBool:checked forKey:@"boxIsChecked"];
    } else if(checked) {
        [checkBoxButton setImage:[UIImage imageNamed:@"cbd.png"] forState:UIControlStateNormal];
        checked = NO;
        [defaults setBool:checked forKey:@"boxIsChecked"];
           }
  [defaults synchronize];
}


-(void)checkTheBox {
    if(!checked) {
        [checkBoxButton setImage:[UIImage imageNamed:@"cbd.png"] forState:UIControlStateNormal];
        } else if(checked) {
        [checkBoxButton setImage:[UIImage imageNamed:@"cbu.png"] forState:UIControlStateNormal];
    }
}




@end
