//
//  AboutViewController.swift
//

import UIKit

class AboutViewController: UIViewController {
    
    var aboutFileURL:URL? = Bundle.main.url(forResource: "About", withExtension: "rtf")
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let fileURL = aboutFileURL else { return }
        do {
            self.textView.attributedText = try NSAttributedString(url: fileURL, options: [NSAttributedString.DocumentReadingOptionKey : Any](), documentAttributes: nil)
        } catch {  }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
