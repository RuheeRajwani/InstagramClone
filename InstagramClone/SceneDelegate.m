//
//  SceneDelegate.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/27/22.
//

#import "SceneDelegate.h"
#import <Parse/Parse.h>


@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    // Code to initialize Parse
    // (See above section 'Parse `initializeWithConfiguration` vs `setApplicationId`', if you have not already set it up)
    
    if (PFUser.currentUser) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    }

}

@end
