//
//  AppDelegate.swift
//  FbMailSender
//
//  Created by hatice kübra kılınç on 13.02.2018.
//  Copyright © 2018 hatice kübra kılınç. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,GIDSignInDelegate {

    var window: UIWindow?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: [:])
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        
        
        if let error = error {
            print(error.localizedDescription)
            return
            
        }
        
        /*
         print("User signed into google")
         
         let authentication = user.authentication
         let credential = GoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
         accessToken: (authentication?.accessToken)!)
         
         Auth.auth().signIn(with: credential) { (user, error) in
         print("User Signed Into Firebase")
         
         
         databaseRef = Database.database().reference()
         
         databaseRef.child("user_profiles").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
         
         let snapshot = snapshot.value as? NSDictionary
         
         if(snapshot == nil)
         {
         self.databaseRef.child("user_profiles").child(user!.uid).child("name").setValue(user?.displayName)
         self.databaseRef.child("user_profiles").child(user!.uid).child("email").setValue(user?.email)
         }
         
         let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
         
         self.window?.rootViewController?.performSegue(withIdentifier: "HomeViewSegue", sender: nil)
         
         })
         
         }
         
         
         */
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)

        
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
            
                return
            }
            else {
                //self.window?.rootViewController?.performSegue(withIdentifier: "VC2", sender: nil)
            }
            // User is signed in
            print("kullanıcı firebase kullanarak giriş yaptı")
            print (user)
           self.window?.rootViewController?.performSegue(withIdentifier: "VC2", sender: nil)
            
         
        }
        

       // self.window?.rootViewController?.performSegue(withIdentifier: "VC", sender: nil)
        
    }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
      
    
    }


   func signOut(){
    
    let firebaseAuth = Auth.auth()
    do {
        try firebaseAuth.signOut()
    } catch let signOutError as NSError {
        print ("Error signing out: %@", signOutError)
    }
    
 }
    
    ///////////////////////////////////

    func applicationWillResignActive(_ application: UIApplication) {
     
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }




