//
//  TagInformation.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/29/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit
import ARKit

class TagInformation: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var dueDate: UIDatePicker!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var takePhoto: UIButton!
    @IBOutlet weak var camerRollButton: UIButton!
    @IBOutlet weak var editAndSaveButton: UIBarButtonItem!
    
    @IBOutlet weak var markCompletedButton: UIButton!
    
    
    var tag: Tag?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.delegate = self;
        
        //No interactions
        name.isUserInteractionEnabled = false;
        takePhoto.isEnabled = false;
        takePhoto.isHidden = true;
        camerRollButton.isEnabled = false;
        camerRollButton.isHidden = true;
        dueDate.isUserInteractionEnabled = false;
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        name.text = tag?.name;
        photo.image = tag?.photo;

        
        for(location, tag) in SharedData.sharedDataInstance.tags.enumerated(){
            if(tag.name == name.text){
                index = location;
                break;
            }
        }
        
        //Sets proper date info
        let formatter = DateFormatter();
        formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
        let yourDate = formatter.date(from: (tag?.dateDue)!);
        dueDate.date = yourDate!;
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder();
        return true;
    }
    
    
    @IBAction func EditButtonPressed(_ sender: Any) {
        if(editAndSaveButton.title == "Edit"){
            editAndSaveButton.title = "Save";
            name.isUserInteractionEnabled = true;
            takePhoto.isEnabled = true;
            takePhoto.isHidden = false;
            camerRollButton.isEnabled = true;
            camerRollButton.isHidden = false;
            dueDate.isUserInteractionEnabled = true;
            markCompletedButton.isHidden = true;
            markCompletedButton.isEnabled = false;
            
            name.placeholder = name.text;
            name.text = "";
        } else { //Button says save
            editAndSaveButton.title = "Edit";
            name.isUserInteractionEnabled = false;
            takePhoto.isEnabled = false;
            takePhoto.isHidden = true;
            camerRollButton.isEnabled = false;
            camerRollButton.isHidden = true;
            dueDate.isUserInteractionEnabled = false;
            markCompletedButton.isHidden = false;
            markCompletedButton.isEnabled = true;
            
            if(name.text == ""){
                name.text = name.placeholder;
            } else {
                SharedData.sharedDataInstance.tags[index!].name = name.text!;
            }
            
            
            
            //Sets proper date info
            let formatter = DateFormatter();
            formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
            let myString = formatter.string(from: dueDate.date);
            let yourDate = formatter.date(from: myString);
            SharedData.sharedDataInstance.tags[index!].dateDue = myString;
        }
        
    }
    
    @IBAction func tagCompleted(_ sender: Any) {
        for (node, currTag) in SharedData.sharedDataInstance.nodes{
            if(tag?.name == currTag.name){
                node.removeFromParentNode();
            }
        }
        SharedData.sharedDataInstance.tags.remove(at: index!);
        self.navigationController?.popViewController(animated: true);
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
