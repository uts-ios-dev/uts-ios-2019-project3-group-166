//
//  AppDelegate.swift
//  Airport
//
//  Created by Charlie on 22/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var locationManager: CLLocationManager?
	var notificationCenter: UNUserNotificationCenter?
	
	weak var airportDelegate: AirportDelegate?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	
        self.locationManager = CLLocationManager()
        self.locationManager?.requestAlwaysAuthorization()
        self.locationManager?.delegate = self
		
        self.notificationCenter = UNUserNotificationCenter.current()
		self.notificationCenter?.delegate = self
		
		self.notificationCenter?.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: { (allowed, error) in return })
		
		let rootController = HomeController()
		airportDelegate = rootController
		
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.rootViewController = rootController
		self.window?.makeKeyAndVisible()
		
		return true
		
	}

	func applicationWillResignActive(_ application: UIApplication) { return }

	func applicationDidEnterBackground(_ application: UIApplication) { return }

	func applicationWillEnterForeground(_ application: UIApplication) { return }

	func applicationDidBecomeActive(_ application: UIApplication) { return }

	func applicationWillTerminate(_ application: UIApplication) { self.saveContext() }

	lazy var persistentContainer: NSPersistentContainer = {
	    /*
	     The persistent container for the application. This implementation
	     creates and returns a container, having loaded the store for the
	     application to it. This property is optional since there are legitimate
	     error conditions that could cause the creation of the store to fail.
	    */
	    let container = NSPersistentContainer(name: "Airport")
	    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
	        if let error = error as NSError? {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	             
	            /*
	             Typical reasons for an error here include:
	             * The parent directory does not exist, cannot be created, or disallows writing.
	             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
	             * The device is out of space.
	             * The store could not be migrated to the current model version.
	             Check the error message to determine what the actual problem was.
	             */
	            fatalError("Unresolved error \(error), \(error.userInfo)")
	        }
	    })
	    return container
	}()

	func saveContext () {
	    let context = persistentContainer.viewContext
	    if context.hasChanges {
	        do {
	            try context.save()
	        } catch {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	            let nserror = error as NSError
	            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
	        }
	    }
	}

}

extension AppDelegate: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
        }
    }
	
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
		
		guard let circularRegion = region as? CLCircularRegion, let airportCode = AirportCode(rawValue: circularRegion.identifier) else { return }
		
		airportDelegate?.updateAirport(passedCode: airportCode)
		let airportNotification = AirportNotification(airportCode: airportCode)
		
		let notificationContent = UNMutableNotificationContent()
		notificationContent.title = airportNotification.notificationTitle
		notificationContent.subtitle = airportNotification.notificationSubtitle
		notificationContent.body = airportNotification.notificationBody
		notificationContent.sound = UNNotificationSound.default
		
		let notificationRequest = UNNotificationRequest(identifier: circularRegion.identifier, content: notificationContent, trigger: UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false))
	
		notificationCenter?.add(notificationRequest, withCompletionHandler: { (error) in
		
			if error != nil {
				print("Error adding notification")
			} else {
				print("Successfully added notification")
			}
		
		})
		
	}
	
}

extension AppDelegate: UNUserNotificationCenterDelegate {

//	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//<#code#>
//}

	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		
		print("NOTIFICATION")
		
        completionHandler(.alert)
    }

}
