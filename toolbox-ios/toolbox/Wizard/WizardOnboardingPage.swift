//
//  WizardOnboardPage.swift
//

import UIKit

let kShowedWizard = "KeyShowedWizard"

enum WizardOnboardPage: Int {
    
    case screenA
    case screenB
    case screenC
    case screenLast
    
    static let PageCount = WizardOnboardPage.screenLast.rawValue + 1
    
    var next: WizardOnboardPage? {
        return WizardOnboardPage(rawValue: self.rawValue + 1)
    }
    
    var previous: WizardOnboardPage? {
        return WizardOnboardPage(rawValue: self.rawValue - 1)
    }
    
    var header: UIImage? {
        switch self {
        case .screenA: return nil
        case .screenB: return UIImage(named: "touchIDHero")
        case .screenC: return nil
        case .screenLast: return UIImage(named: "touchIDHero")
        }
    }
    
    var title: String? {
        switch self {
        case .screenA:
            return "Screen A Title, say something interesting"
        case .screenB:
            return "Screen B Title, say something interesting"
        case .screenC:
            return "Screen C Title, say something interesting"
        case .screenLast:
            return "Final Screen"
        }
    }
    
    var titleColor: UIColor? {
        return UIColor.white
    }
    
    var body: String? {
        switch self {
        case .screenA:
            return ("Page A Body text give some interesting information here")
        case .screenB:
            return "Screen B Body text give some interesting information here"
        case .screenC:
            return "Screen C Body text give some interesting information here "
        case .screenLast:
            return "Screen Last Body !"
        }
    }
    
    var callToActionPrompt: String? {
        switch self {
        case .screenA: return "CTA A show me more!"
        case .screenB: return "CTA B Save Accounts"
        case .screenC:
            return "CTA C Save Accounts"
        case .screenLast:
            return "CTA Last Enabled this"
        }
    }
    
    var dismissPrompt: String? {
        switch self {
        case .screenA:
            return "Screen A Dismiss Prompt>"
        case .screenB:
            return "Screen B Dismiss Prompt>"
        case .screenC:
            return "ScreenC Dismiss Prompt>"
        case .screenLast:
            return "Last Dismiss Prompt>"
//        default: return nil
        }
    }
    
    // can swipe forward
    var canSwipeForward: Bool {
        switch self {
        case .screenA: return true
        case .screenB: return true
        case .screenC: return true
        default: return false
        }
    }
    
    var canSwipeBackward: Bool {
        switch self {
        case .screenA: return false
        default: return true
        }
    }
    
    var callToActionBlock: ((UIPageViewController) -> Void)? {
        switch self {
        case .screenB:
            return { (pageViewController: UIPageViewController) in
                print( "callToActionBlock")
                // DispatchQueue.main.async {
                //      UserDefaults.standard.set(true, forKey: kFeatureConfigXX)
                // }
            }
        case .screenLast:
            return { (pageViewController: UIPageViewController) in
                print( "callToActionBlock")
                // UserDefaults.standard.set(true, forKey: kFeatureConfigX)
                pageViewController.presentingViewController?.dismiss(animated: true, completion: {
                    // UserDefaults.standard.set(true, forKey: kShowedWizard)
                })
            }
        default:
            return nil
        }
    }
    
    var dismissBlock: ((UIPageViewController) -> Void)? {
        switch self {
        case .screenA:
            return { (pageViewController: UIPageViewController) in
                print( "dismissBlock")
            }
        case .screenB:
            return { (pageViewController: UIPageViewController) in
                print( "dismissBlock")
                // UserDefaults.standard.set(false, forKey: kFeatureConfigA)
            }
        case .screenC:
            return { (pageViewController: UIPageViewController) in
                print( "dismissBlock")
            }
        case .screenLast:
            return { (pageViewController: UIPageViewController) in
                print( "dismissBlock")
                // UserDefaults.standard.set(false, forKey: kFeatureConfigC)
                pageViewController.presentingViewController?.dismiss(animated: true, completion: {
                    UserDefaults.standard.set(true, forKey: kShowedWizard)
                })
            }
        default:
            return nil
        }
    }
    
    var onboardingViewController: WizardContentViewController? {
        let storyboard = UIStoryboard(name: "Wizard", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "WizardContentViewController") as? WizardContentViewController else { return nil }
        viewController.page = self
        return viewController
    }
}

