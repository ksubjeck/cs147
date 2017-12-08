//
//  ExploreMenuWithPopup.swift
//  vTag
//
//  Created by Cole DePasquale on 12/4/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class ExploreMenuWithPopup: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tagTitle: UITextField!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    //private instance variables
    var newTag = false;
    var currTag: Tag?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tagTitle.delegate = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(newTag){
            leftButton.setTitle("More Info", for: .normal);
            leftButton.frame.size.width = 110;
            rightButton.setTitle("Set Tag", for: .normal);
            rightButton.frame.size.width = 110;
            rightButton.frame.origin = CGPoint(x: 120, y: 257)
                
        } else {
            tagTitle.text = currTag?.name;
            tagTitle.isUserInteractionEnabled = false;
            
        }
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    
    @IBAction func pressedX(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tagTitle.resignFirstResponder();
        return true;
    }
    
    /**
    * More Info to edit
    * Tag info to see more about it
    */
    @IBAction func leftButtonPress(_ sender: Any) {
        
    }
    
    
    /**
    * Pressed set tag or marked as completed
    */
    @IBAction func rightButtonPress(_ sender: Any) {
        if let navigation = presentingViewController as? UINavigationController {
            if let presenter = navigation.viewControllers.first as? ViewController{
                if(newTag){ // Creating a new Tag!
                    
                    //Sets proper date info
                    let formatter = DateFormatter();
                    formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
                    let yourDate = formatter.string(from: Date());
                    
                    tagTitle.isUserInteractionEnabled = true;
                    let tag = Tag(name: tagTitle.text!, photo: #imageLiteral(resourceName: "VTag Logo"), dateDue: yourDate)
                    presenter.placeObject(tag: tag!);
                } else { //Deleting Tag!
                    
                    tagTitle.isUserInteractionEnabled = false;
                    presenter.deletingObject();
                }
            }
        }
        dismiss(animated: true, completion: nil);
    }
    
    
    
//    @IBAction func markCompleted(_ sender: Any) {
//        for (index, Tag) in SharedData.sharedDataInstance.tags.enumerated() {
//            if ("tagName" == SharedData.sharedDataInstance.tags[index].name) {
//                SharedData.sharedDataInstance.tags.remove(at: index) //TODO FIX "tagname" to the inherited value from the explore interface as tag
//                
//                
//                
//            }
//        }
//        
//        //need to inherit the tag from the Explore interface to obtain the actual tagName
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "More Info":
            
            guard let destinationViewController = segue.destination as? ExploreViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            if(newTag){
                destinationViewController.newTag = true;
                let tag = Tag(name: tagTitle.text!, photo: #imageLiteral(resourceName: "VTag Logo"), dateDue: "")
                destinationViewController.tag = tag
            } else {
                destinationViewController.newTag = false;
                destinationViewController.tag = currTag;
            }
            
        default:
            print("Wrong Segue")
            
            
        }
    }

}
