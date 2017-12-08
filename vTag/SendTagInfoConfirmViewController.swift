//
//  SendTagInfoConfirmViewController.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/7/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class SendTagInfoConfirmViewController: UIViewController {

    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var successIcon: UIImageView!
    @IBAction func okButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
