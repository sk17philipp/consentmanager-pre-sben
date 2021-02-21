//
//  ExampleViewController.swift
//  ConsentManagerExampleSwift
//

import Foundation
import UIKit

class ExampleViewController : UIViewController {

	// the consent tool
	var cmpConsentTool: CMPConsentTool?
    
    func onClose() -> Void {
        NSLog("closed");
    }
    
    func onOpen() -> Void {
        NSLog("open");
    }
	/**
	 * View did appear
	 */
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
        cmpConsentTool = CMPConsentTool.init("www.consentmanager.net", addId: "10640", addAppName: "my%20test%20app", addLanguage: "DE", add: self, addOpenListener: onOpen, addCloseListener: onClose)
		
		let button = UIButton.init(frame: CGRect.init(x: 10, y: 100, width: 100, height: 50))
		button.setTitle("Consent", for: .normal)
		button.backgroundColor = .red
		button.addTarget(self, action: #selector(onShowConsentClicked), for: .touchUpInside)
		self.view.addSubview(button)
	}
	
	/**
	 * Show consent button was clicked
	 */
	@objc func onShowConsentClicked(sender: UIButton!) {
		cmpConsentTool!.openView()
	}
}
