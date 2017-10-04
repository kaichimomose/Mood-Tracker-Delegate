//
//  ChooseMoodViewController.swift
//  Mood Tracker Delegate
//
//  Created by Kaichi Momose on 2017/10/02.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

protocol FriendDelegate: class {
    func didSelectFriend(list: List)
}

class ChooseMoodViewController: UIViewController, FriendDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moodSegue: UISegmentedControl!
    var actList: List?
    
    weak var delegate: MoodDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let list = actList {
            nameTextField.text = list.name
            var case_number: Int
            if list.mood == "😁"{
                case_number = 0
            }
            else if list.mood == "😑"{
                case_number = 1
            }
            else{
                case_number = 2
            }
            moodSegue.selectedSegmentIndex = case_number
        }
    }
    
    func didSelectFriend(list: List) {
        actList = list
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            
            var list = List()
            
            list.name = nameTextField.text ?? ""
                
            var mood = ""
                
            switch moodSegue.selectedSegmentIndex {
                case 0:
                    mood = "😁"
                case 1:
                    mood = "😑"
                case 2:
                    mood = "😡"
                default:
                    break
            }
            
            list.mood = mood
                
            list.modificationTime = Date()
            
            if list.name != "" {
                delegate?.didSelectMood(list: list)
            }
            
            let listMoodTableViewController = segue.destination as! ListMoodTableViewController
            
            listMoodTableViewController.delegate = self
            
            print("save button tapped")
        }
        else if segue.identifier == "cancel" {
            print("cancel button tapped")
        }
    }
}

