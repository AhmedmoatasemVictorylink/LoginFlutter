import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    GeneratedPluginRegistrant.register(with: self)

    // let navigationController : UINavigationController?
    // navigationController = UINavigationController(rootViewController: controller)
    // navigationController?.setNavigationBarHidden(true, animated: false)
    // self.window!.rootViewController = navigationController
    // self.window!.makeKeyAndVisible()

    let channel = FlutterMethodChannel(name: "com.flutter.epic/epic", binaryMessenger: controller as! FlutterBinaryMessenger)
    
    channel.setMethodCallHandler { [unowned self] (methodCall, result) in
      if methodCall.method == "getSwiftValue" {
        let vc = CustomViewController(nibName: "CustomViewController", bundle: nil)
        // navigationController?.pushViewController(vc, animated: false)
        controller.present(vc, animated: true)
        result("navigating")
       // result("Hi from swift")
//        if let args = methodCall.arguments {
//          result("data 1 is \(args)")
//          let myArguments = args as? [String: Any]
//          result("value is \(myArguments?["value1"] as? String)")
//        }else {
//          result("couldn't get data")
//        }
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
