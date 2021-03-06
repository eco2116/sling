//
//  QuestionFeedTableView.swift
//  sling
//
//  Created by Avi Chad-Friedman on 10/16/14.
//  Copyright (c) 2014 Avi Chad-Friedman. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class ConvoDetailViewController : UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var timeLineData : NSMutableArray = NSMutableArray()
    var selectedConversationID : String!
    var convo : PFObject = PFObject(className: "Conversation")
    var chosen : Int!
    
    @IBAction func logout(sender: AnyObject) {
        if(PFUser.currentUser() != nil){
            PFUser.logOut()
            viewDidAppear(true)
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if(PFUser.currentUser() != nil){
            self.loadData(1)
        }
    }
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }
    func loadData(order: Int){
        timeLineData.removeAllObjects()
        var findTimeLineData:PFQuery = PFQuery(className: "Message")
        if(order == 0){
            findTimeLineData.orderByDescending("createdAt")
        }
        // Filtering questions to only see those posted by current user
        var currentUser = PFUser.currentUser();
        findTimeLineData.whereKey("inConvo", equalTo: self.convo)
        findTimeLineData.findObjectsInBackgroundWithBlock{
            (objects:[AnyObject]!, error:NSError!)->Void in
            if !(error != nil){
                for object in objects{
                    let pdf = object as PFObject
                    self.timeLineData.addObject(pdf)
                }
                self.tableView.reloadData()
            }
        }
    }
    func sortByScore(){
        
    }
    @IBAction func postQuestion(sender: AnyObject) {
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timeLineData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as MessageCell
        let message:PFObject = self.timeLineData.objectAtIndex(indexPath.row) as PFObject
        cell.messageText.text = " " as NSString
        
        if(message.objectForKey("text") != nil){
            cell.messageText.text = message.objectForKey("text") as NSString
        }
        let date = message.createdAt as NSDate
        let stringDate = NSDateFormatter.localizedStringFromDate(date, dateStyle: .MediumStyle, timeStyle: .ShortStyle) as NSString
        cell.timeSent.text = stringDate as NSString
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    

 
    
}
