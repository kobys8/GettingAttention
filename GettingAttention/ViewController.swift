//
//  ViewController.swift
//  GettingAttention
//
//  Created by Koby Samuel on 10/14/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
	@IBOutlet weak var userOutput: UILabel!

	@IBAction func doAlert(sender: AnyObject) {
		let alertController = UIAlertController(title: "Alert Me Button Selected", message: "Attention grabbing time!", preferredStyle: UIAlertControllerStyle.Alert)
		let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
		alertController.addAction(defaultAction)
		presentViewController(alertController, animated: true, completion: nil)
	}
	
	@IBAction func doMultiButtonAlert(sender: AnyObject) {
		let alertController = UIAlertController(title: "Multi-Button Alert", message: "Attention grabbing time! x3", preferredStyle: UIAlertControllerStyle.Alert)
		let nowAction = UIAlertAction(title: "Time to act", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in self.userOutput.text = "Something was just done"})
		let laterAction = UIAlertAction(title: "Not yet time", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in self.userOutput.text = "Something will be done"})
		let cancelAction = UIAlertAction(title: "Don't Do It", style: UIAlertActionStyle.Cancel, handler: {(alertAction: UIAlertAction!) in self.userOutput.text = "Shia LaBeouf is ashamed of you"})
		alertController.addAction(nowAction)
		alertController.addAction(laterAction)
		alertController.addAction(cancelAction)
		presentViewController(alertController, animated: true, completion: nil)
	}
	
	@IBAction func doAlertInput(sender: AnyObject) {
		let alertController = UIAlertController(title: "Email", message: "Please enter your email address below:", preferredStyle: UIAlertControllerStyle.Alert)
		alertController.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
			textField.placeholder = "Email address"
			textField.keyboardType = UIKeyboardType.EmailAddress
		})
		let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
			let emailAddress: String = (alertController.textFields![0] as UITextField).text!
			self.userOutput.text = "Email: '\(emailAddress)'"
		})
		alertController.addAction(defaultAction)
		presentViewController(alertController, animated: true, completion: nil)
	}
	
	@IBAction func doActionSheet(sender: AnyObject) {
		let alertController = UIAlertController(title: "Actions", message: "Commit!", preferredStyle: UIAlertControllerStyle.ActionSheet)
		let negotiateAction = UIAlertAction(title: "Negotiate", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
			self.userOutput.text = "We don't negotiate with terrorists!"
		})
		let compromiseAction = UIAlertAction(title: "Compromise", style: UIAlertActionStyle.Default, handler: {(alertAction: UIAlertAction!) in
			self.userOutput.text = "OK, let's make a deal"
		})
		let destroyAction = UIAlertAction(title: "Destroy", style: UIAlertActionStyle.Destructive, handler: {(alertAction: UIAlertAction!) in
			self.userOutput.text = "EX-TER-MIN-ATE!!"
		})
		let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {(alertAction: UIAlertAction!) in
			self.userOutput.text = "Wrong button?"
		})
		alertController.addAction(negotiateAction)
		alertController.addAction(compromiseAction)
		alertController.addAction(destroyAction)
		alertController.addAction(cancelAction)
		if(alertController.popoverPresentationController != nil) {
			alertController.popoverPresentationController!.sourceView = sender as! UIButton
			alertController.popoverPresentationController!.sourceRect = (sender as! UIButton).bounds
		}
		presentViewController(alertController, animated: true, completion: nil)
	}
	
	@IBAction func doSound(sender: AnyObject) {
		var soundID: SystemSoundID = 0
		let soundFile: String = NSBundle.mainBundle().pathForResource("soundeffect", ofType: "wav")!
		let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
		AudioServicesCreateSystemSoundID(soundURL, &soundID)
		AudioServicesPlaySystemSound(soundID)
	}
	
	@IBAction func doAlertSound(sender: AnyObject) {
		var soundID: SystemSoundID = 0
		let soundFile: String = NSBundle.mainBundle().pathForResource("alertsound", ofType: "wav")!
		let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
		AudioServicesCreateSystemSoundID(soundURL, &soundID)
		AudioServicesPlayAlertSound(soundID)
	}
	
	@IBAction func doVibration(sender: AnyObject) {
		AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

