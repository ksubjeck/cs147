//
//  SharedData.swift
//  vTag
//
//  Created by Cole DePasquale on 11/30/17.
//  Copyright © 2017 VTag. All rights reserved.
//
import UIKit
import ARKit

class SharedData {
    static let sharedDataInstance = SharedData();
    var tags = [Tag](); //array of tags
    var friendRequests = ["Django", "Jennifer", "Morgan Freeman"];
    var sentTags = [Tag]();
    var contacts = [Contact]();
    var friends = [Friend]();
    var nodes = [SCNNode: Tag]();
    
    func loadTags(){
        
        //Sets proper date info
        let formatter = DateFormatter();
        formatter.dateFormat = "MM-dd-yyy, HH:mm:ss";
        let myString = formatter.string(from: Date());
        let yourDate = formatter.date(from: myString);
        formatter.dateFormat = "MM-dd-yyyy"; // again convert your date to string
        let myDate = formatter.string(from: yourDate!);

        
        let photo1 = UIImage(named: "VTag Logo");
        guard let tag1 = Tag(name: "Get VTag Working", photo: photo1, dateDue: myString) else {
            fatalError("Failed to instantiate tag1");
        }
        guard let tag2 = Tag(name: "Go to Practice", photo: photo1, dateDue: myString) else {
            fatalError("Failed to instantiate tag2");
        }
        guard let tag3 = Tag(name: "Eat Dinner", photo: photo1, dateDue: myString) else {
            fatalError("Failed to instantiate tag2");
        }
        self.tags += [tag1, tag2, tag3];
    }
    
    func loadContacts(){
        print("Loading these fucking contacts")
        guard let contact1 = Contact(name: "Elon Musk", accepted: false) else{
            fatalError("Failed to instantiate contact1");
        }
        guard let contact2 = Contact(name: "Jerry Cain", accepted: false) else{
            fatalError("Failed to instantiate contact2");
        }
        guard let contact3 = Contact(name: "James Landay", accepted: false) else{
            fatalError("Failed to instantiate contact3");
        }
        guard let contact4 = Contact(name: "Jeff Bezos", accepted: false) else{
            fatalError("Failed to instantiate contact4");
        }
        self.contacts += [contact1, contact2, contact3, contact4];
    }
        
    func loadSentTags() {
        
        let photo1 = UIImage(named: "sentTag1");
        let photo2 = UIImage(named: "sentTag2");
        let photo3 = UIImage(named: "sentTag3");
        
        guard let firstSentTag = Tag(name: "Call BFF", photo: photo1, dateDue: "12-31-2017", creator: "Me", recipient: "BFF") else {
            fatalError("Unable to instantiate firstSentTag")
        }
        guard let secondSentTag = Tag(name: "Meet me at Starbucks", photo: photo2, dateDue: "01-07-2018", creator: "Me", recipient: "Abraham Lincoln") else {
            fatalError("Unable to instantiate firstSentTag")
        }
        guard let thirdSentTag = Tag(name: "The meatloaf!", photo: photo3, dateDue: "02-16-2018", creator: "Me", recipient: "Mom") else {
            fatalError("Unable to instantiate firstSentTag")
        }
        
        self.sentTags += [firstSentTag, secondSentTag, thirdSentTag]
    }
    
    func loadSampleFriends(){
        let photo1 = UIImage(named: "friend1")
        let photo2 = UIImage(named: "friend2")
        let photo3 = UIImage(named: "friend3")
        
        guard let friend1 = Friend(name: "Keaton Subjeck", photo: photo1) else{
            fatalError("Unable to instantiate friend1")
        }
        
        guard let friend2 = Friend(name: "Cole Depo", photo: photo2) else {
            fatalError("Unable to instantiate friend2")
        }
        
        guard let friend3 = Friend(name: "Austin Flores", photo: photo3) else {
            fatalError("Unable to instantiate friend3")
        }
        friends += [friend1, friend2, friend3]
    }
}
