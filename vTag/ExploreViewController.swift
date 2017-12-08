//
//  ExploreViewController.swift
//  vTag
//
//  Created by Austin-Caleb Flores on 11/28/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tagName: UITextField!
    @IBOutlet weak var tagPhoto: UIImageView!
    @IBOutlet weak var tagDate: UIDatePicker!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var dueDate: UIDatePicker!
    var tag: Tag?;
    var newTag: Bool?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.tagName.delegate = self;
        tagName.text = tag?.name;
        if(!newTag!){
            bottomButton.setTitle("Mark As Completed", for: .normal);
            
            //Sets proper date info
            let formatter = DateFormatter();
            formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
            let yourDate = formatter.date(from: (tag?.dateDue)!);
            dueDate.date = yourDate!;
            
            tagDate.isUserInteractionEnabled = false;
            tagName.isUserInteractionEnabled = false;
        }
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tagName.resignFirstResponder();
        return true;
    }
    
    @IBAction func pressedX(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    

    @IBAction func setTag(_ sender: Any) {
        if(newTag)!{
            let date = self.tagDate.date
            
            let formatter = DateFormatter();
            formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
            let myString = formatter.string(from: date);
            let yourDate = formatter.date(from: myString);
            formatter.dateFormat = "MM-dd-yyyy"; // again convert your date to string
            let myDate = formatter.string(from: yourDate!);
            
            let currTag = Tag(name: tagName.text!, photo: UIImage(named: "VTag Logo"), dateDue: myDate);
            
            
            //Popping viewcontroller and setting it
            if let navigation = presentingViewController?.presentingViewController as? UINavigationController {
                if let presenter = navigation.viewControllers.first as? ViewController{
                    presenter.placeObject(tag: currTag!);
                }
            }
        } else {
            for(location, currTag) in SharedData.sharedDataInstance.tags.enumerated(){
                if(tag?.name == currTag.name){
                    SharedData.sharedDataInstance.tags.remove(at: location);
                }
            }
            for (node, currTag) in SharedData.sharedDataInstance.nodes{
                if(tag?.name == currTag.name){
                    node.removeFromParentNode();
                }
            }
        }
        self.presentingViewController?.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
