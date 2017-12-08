//
//  ProfileViewController.swift
//  vTag
//
//  Created by Cole DePasquale on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var ProfileTotalFriends: UILabel!
    @IBOutlet weak var ProfileTagsSentCount: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        ProfileTotalFriends.text = String(SharedData.sharedDataInstance.friends.count)
        ProfileTagsSentCount.text = String(SharedData.sharedDataInstance.sentTags.count)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
