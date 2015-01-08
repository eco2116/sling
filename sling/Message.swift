//
//  Message.swift
//  sling
// --avi was here
//  Created by Avi Chad-Friedman on 12/21/14.
//  Copyright (c) 2014 Avi Chad-Friedman. All rights reserved.
//

import Foundation

class Message : NSObject, JSQMessageData {
    /*
    var sender : PFUser;
    var recipients : NSMutableArray;
    var timeCreated : NSDate;
    var text : NSString;
    
    init(text : NSString){
        self.sender = PFUser.currentUser();
        self.timeCreated = NSDate();
        self.text = text;
        recipients = NSMutableArray();
    }
    
    func sendTo(user : PFUser){
        recipients.addObject(user);
    }
    */
    var text_: String
    var sender_: String
    var date_: NSDate
    var imageUrl_: String?
    
    convenience init(text: String?, sender: String?) {
        self.init(text: text, sender: sender, imageUrl: nil)
    }
    
    init(text: String?, sender: String?, imageUrl: String?) {
        self.text_ = text!
        self.sender_ = sender!
        self.date_ = NSDate()
        self.imageUrl_ = imageUrl
    }
    
    func text() -> String! {
        return text_;
    }
    
    func sender() -> String! {
        return sender_;
    }
    
    func date() -> NSDate! {
        return date_;
    }
    
    func imageUrl() -> String? {
        return imageUrl_;
    }
    
}