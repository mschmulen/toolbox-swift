//
//  WizardContentViewController.swift
//

import UIKit

class WizardContentViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var headerView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var callToActionButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    var page: WizardOnboardPage?
    
    var header: UIImage? {
        get { return headerView?.image }
        set {
            headerView?.image = newValue
//            if newValue == nil {
//                imageHeightConstraint.constant = 10
//            }
//            imageHeightConstraint.constant = newValue.size.height
        }
    }
    
    override var title: String? {
        didSet { titleLabel?.text = title }
    }
    
    var body: String? {
        get { return bodyLabel?.text }
        
        set {
            //            guard let body = newValue else {
            //                bodyLabel?.text = nil
            //                return
            //            }
            //            let paragraphStyle = NSMutableParagraphStyle()
            //            paragraphStyle.lineSpacing = 7.5
            //            let attrString = NSMutableAttributedString(string: body, attributes: [ NSParagraphStyleAttributeName: paragraphStyle ])
            //            bodyLabel?.attributedText = attrString
            bodyLabel?.text = newValue
        }
    }
    
    var callToActionPrompt: String? {
        get {
            return callToActionButton?.title(for: .normal)
        }
        
        set {
            callToActionButton?.setTitle(newValue, for: .normal)
        }
    }
    
    var dismissPrompt: String? {
        get { return dismissButton?.title(for: .normal) }
        set { dismissButton?.setTitle(newValue, for: .normal) }
    }
    
    var callToActionBlock: ((UIPageViewController) -> Void)? = nil
    var dissmissBlock: ((UIPageViewController) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.numberOfPages = WizardOnboardPage.PageCount
        self.pageControl.currentPage = page?.rawValue ?? 0
        
        self.cardView.layer.cornerRadius = 15
        self.cardView.layer.masksToBounds = true
        
        self.header = page?.header
        self.title = page?.title
        self.body = page?.body
        self.callToActionPrompt = page?.callToActionPrompt
        
        if let dismissBlock = page?.dismissBlock {
            self.dissmissBlock = dismissBlock
            self.dismissPrompt = page?.dismissPrompt
            self.dismissButton.isHidden = false
        } else {
            self.dismissButton.isHidden = true
        }
        
        if let callToActionBlock = page?.callToActionBlock {
            self.callToActionBlock = callToActionBlock
            self.callToActionPrompt = page?.callToActionPrompt
            self.callToActionButton.isHidden = false
        } else {
            self.callToActionButton.isHidden = true
        }
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    private func advanceToNextPage(pageViewController: UIPageViewController) {
        if let nextPage = self.page?.next {
            if let nextOnboardingViewController = nextPage.onboardingViewController {
                pageViewController.setViewControllers([nextOnboardingViewController],
                                                      direction: .forward,
                                                      animated: true,
                                                      completion: nil)
            }
        }
    }
    
    @IBAction func callToAction(sender: UIButton) {
        guard let pageViewController = self.parent as? UIPageViewController else { return }
        callToActionBlock?(pageViewController)
        advanceToNextPage(pageViewController: pageViewController)
    }
    
    @IBAction func dismiss(sender: UIButton) {
        guard let pageViewController = self.parent as? UIPageViewController else { return }
        dissmissBlock?(pageViewController)
        advanceToNextPage(pageViewController: pageViewController)
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
    
}
