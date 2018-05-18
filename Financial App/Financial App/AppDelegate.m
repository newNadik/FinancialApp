//
//  AppDelegate.m
//  Financial App
//
//  Created by Nadiia Ivanova on 5/12/18.
//  Copyright © 2018 Nadiia Ivanova. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [FIRApp configure];
    
    [GIDSignIn sharedInstance].clientID = [FIRApp defaultApp].options.clientID;
    [GIDSignIn sharedInstance].delegate = self;
    FIRFirestoreSettings *settings = [[FIRFirestoreSettings alloc] init];
    settings.persistenceEnabled = YES;
    [FIRFirestore firestore].settings = settings;
    
    if(![FIRAuth auth].currentUser) {
        [self.window setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SignInViewController"]];
    }
    
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                      annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
    
}


- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    
    if (error == nil) {
        GIDAuthentication *authentication = user.authentication;
        FIRAuthCredential *credential = [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken
                                                                         accessToken:authentication.accessToken];
        
        [[FIRAuth auth] signInAndRetrieveDataWithCredential:credential
                                                 completion:^(FIRAuthDataResult *authResult,
                                                              NSError *error)
         {
             if (error) {
                 NSLog(@"Error signInAndRetrieveData: %@", error);
                 return;
             }
             
             [[[[FIRFirestore firestore] collectionWithPath:@"users"]
               documentWithPath:[FIRAuth auth].currentUser.email] setData:
              @{ @"name": [FIRAuth auth].currentUser.displayName,
                 @"photoURL": [FIRAuth auth].currentUser.photoURL.absoluteString }
              merge:YES
              completion:^(NSError * _Nullable error) {
                  if (error != nil) {
                      NSLog(@"Error writing document: %@", error);
                  } else {
                      NSLog(@"Document successfully written!");
                  }
              }];
             
             [self.window setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"InitViewController"]];
             
         }];
    } else {
        NSLog(@"Error didSignInForUser: %@", error);
    }
}


- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    
    if (error) NSLog(@"Error didDisconnectWithUser: %@", error);
    else NSLog(@"didDisconnectWithUser successfully");
    
}


- (void)signOut {
    
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    } else {
        [[GIDSignIn sharedInstance] disconnect];
        [self.window setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SignInViewController"]];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application { }

- (void)applicationDidEnterBackground:(UIApplication *)application { }

- (void)applicationWillEnterForeground:(UIApplication *)application { }

- (void)applicationDidBecomeActive:(UIApplication *)application { }

- (void)applicationWillTerminate:(UIApplication *)application { }

@end
