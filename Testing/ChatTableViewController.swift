//
//  ChatTableViewController.swift
//  Testing
//
//  Created by Mihir Shah on 3/17/17.
//  Copyright © 2017 Mihir Shah. All rights reserved.
//

import UIKit

class ChatTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBAction func enterMessage(_ sender: Any) {
        if messageTextField.text!.characters.count == 0 { return }
        myMessages.append(self.messageTextField.text!)
        let randomMessage = randomString(length: 5)
        yourMessages.append(randomMessage)
        tablView.reloadData()
        messageTextField.text = ""
        messageTextField.endEditing(true)
    }
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tablView: UITableView!
    var myMessages = [String]()
    var yourMessages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tablView.rowHeight = UITableViewAutomaticDimension
        tablView.estimatedRowHeight = 140
        
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow(notification:)) , name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(notification:)) , name: .UIKeyboardWillHide, object: nil)
        
        self.tablView.separatorColor = .clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let messageCount = myMessages.count + yourMessages.count
        return messageCount
        //return 2
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rtCell", for: indexPath) as! RightTableViewCell
            let currentMessage = myMessages[indexPath.row/2]
            //let currentMessage = "asdasda qw2eq \n asdq \n qsdqwdsqsq qws "
            cell.setupRightLabelInCell(currentMessage)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as! LeftTableViewCell
            //let msg = "Hi how are you \n I am fine thanks for asking \n asdjkhas aksjdhajsd"
            let msg = yourMessages[(indexPath.row - 1)/2]
            cell.setupLeftLabelInCell(msg)
            return cell
        }
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyz"
        let len = UInt32(letters.length)
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        enterMessage(true)
        return true
    }

    //Moving screen for keyboard
   /* func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    */
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y += keyboardSize.height
        }
    }

}
