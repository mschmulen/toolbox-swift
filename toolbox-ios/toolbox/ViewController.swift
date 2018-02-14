//
//  ViewController.swift
//  toolbox
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showWizard(_ sender: Any) {
        
        let wizardPageViewController = WizardPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        wizardPageViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        wizardPageViewController.modalPresentationStyle = .overCurrentContext
        
        self.present(wizardPageViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

