//
//  LoginViewController.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/28/22.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>


@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (IBAction)loginViewControllerDidTapSignUp:(id)sender {
    // initialize a user object
       PFUser *newUser = [PFUser user];
       
       // set user properties
       newUser.username = self.usernameField.text;
       newUser.password = self.passwordField.text;
       
       // call sign up function on the object
       [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
           if (error != nil) {
               NSLog(@"Error: %@", error.localizedDescription);
           } else {
               NSLog(@"User registered successfully");
        }
       }];
}
- (IBAction)loginViewControllerDidTapLogin:(id)sender {
    
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
            if (error != nil) {
                NSLog(@"User log in failed: %@", error.localizedDescription);
            } else {
                NSLog(@"User logged in successfully");
                [self performSegueWithIdentifier:@"homeSegue" sender:nil];
                
            }
        }];
}

@end
