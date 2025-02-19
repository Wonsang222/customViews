//
//  DetailViewController.swift
//  practice
//
//  Created by Wonsang Hwang on 2/18/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var bigImageView: UIImageView! {
        didSet {bigImageView.contentMode = .scaleAspectFit}
    }
    
    var image: UIImage?
    
    var detailText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = detailText
        bigImageView.image = image
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
