//
//  SendTagInformationViewController.swift
//  vTag
//
//  Created by Keaton Subjeck on 12/3/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class SendTagInformationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tagTitle: UITextField!
    @IBOutlet weak var tagPhoto: UIImageView!
    @IBOutlet weak var tagDate: UIDatePicker!
    @IBOutlet weak var tagButton: UIButton!
    var recipient: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tagTitle.delegate = self;
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        let buttonText = "Send to " + recipient;
        self.tagButton.setTitle(buttonText, for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendTag(_ sender: UIButton) {
        let date = self.tagDate.date
        let formatter = DateFormatter();
        formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
        let myString = formatter.string(from: date);
        let yourDate = formatter.date(from: myString);
        formatter.dateFormat = "MM-dd-yyyy"; // again convert your date to string
        let myDate = formatter.string(from: yourDate!);
        if (tagTitle.text == "") {
            tagTitle.text = "Untitled";
        }
        
        let currTag = Tag(name: tagTitle.text!, photo: UIImage(named: "VTag Logo"), dateDue: myDate, creator: "Me", recipient: recipient);
        
        SharedData.sharedDataInstance.sentTags.append(currTag!);
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: UIButton) {
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
