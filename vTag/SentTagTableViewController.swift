//
//  SentTagTableViewController.swift
//  vTag
//
//  Created by Cole DePasquale on 12/6/17.
//  Copyright © 2017 VTag. All rights reserved.
//

import UIKit

class SentTagTableViewController: UITableViewController {

    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData();
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SharedData.sharedDataInstance.sentTags.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SentTagTableViewCell";
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SentTagTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SentTagTableViewCell.")
        }
        
        // Configure the cell...
        let sentTag = SharedData.sharedDataInstance.sentTags[indexPath.row]
        cell.nameLabel.text = sentTag.name
        cell.photoImageView.image = sentTag.photo
        cell.recipientControl.text = sentTag.recipient
        cell.photoImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        cell.photoImageView.contentMode = UIViewContentMode.scaleAspectFit
        cell.photoImageView.clipsToBounds = true
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    //MARK: Private Methods
    
//    private func loadSentTags() {
//
//        let photo1 = UIImage(named: "sentTag1");
//        let photo2 = UIImage(named: "sentTag2");
//        let photo3 = UIImage(named: "sentTag3");
//
//        guard let firstSentTag = Tag(name: "Call BFF", photo: photo1, dateDue: "12-31-2017", creator: "Me", recipient: "BFF") else {
//            fatalError("Unable to instantiate firstSentTag")
//        }
//        guard let secondSentTag = Tag(name: "Meet me at Starbucks", photo: photo2, dateDue: "01-07-2018", creator: "Me", recipient: "Abraham Lincoln") else {
//            fatalError("Unable to instantiate firstSentTag")
//        }
//        guard let thirdSentTag = Tag(name: "The meatloaf!", photo: photo3, dateDue: "02-16-2018", creator: "Me", recipient: "Mom") else {
//            fatalError("Unable to instantiate firstSentTag")
//        }
//
//        sentTags += [firstSentTag, secondSentTag, thirdSentTag]
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "SentTagInventorySegue":
            
            guard let tagDetailViewController = segue.destination as? SentTagInfoViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedTagCell = sender as? SentTagTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedTagCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedTag = SharedData.sharedDataInstance.sentTags[indexPath.row]
            tagDetailViewController.tag = selectedTag
            
        default:
            print("Went to the wrong view controller")
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
