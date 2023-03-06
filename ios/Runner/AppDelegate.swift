import UIKit
import Flutter
import awesome_notifications
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyBAhhSr06w2GZoHmkhm_cYy3wFA2Gh5BHA") // Add this line to provide your Google Maps API key
    GeneratedPluginRegistrant.register(with: self)
    SwiftAwesomeNotificationsPlugin.setPluginRegistrantCallback { registry in          
          SwiftAwesomeNotificationsPlugin.register(
            with: registry.registrar(forPlugin: "io.flutter.plugins.awesomenotifications.AwesomeNotificationsPlugin")!)
      }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
