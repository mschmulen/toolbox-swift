//
//  WizardPageViewController.swift
//

import UIKit

class WizardPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.75)
        
        guard let firstOnboardingPage = WizardOnboardPage(rawValue: 0) else { return }
        guard let firstOnboardingController = firstOnboardingPage.onboardingViewController else { return }
        
        setViewControllers([firstOnboardingController], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let onboardingViewController = viewController as? WizardContentViewController else { return nil }
        guard let currentPage = onboardingViewController.page else { return nil }
        if !currentPage.canSwipeBackward { return nil }
        guard let previousController = currentPage.previous?.onboardingViewController else { return nil }
        return previousController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let onboardingViewController = viewController as? WizardContentViewController else { return nil }
        guard let currentPage = onboardingViewController.page else { return nil }
        if !currentPage.canSwipeForward { return nil }
        guard let nextController = currentPage.next?.onboardingViewController else { return nil }
        return nextController
    }
}

