import UIKit
import Flutter
//import FBSDKCoreKit
//import FBSDKLoginKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyAp1HcX_ufE3LFU7_1Ht-BV6JGWlSmZvGw")
    GeneratedPluginRegistrant.register(with: self)

    return true
  }
}

