//
//  ChooseMoodViewController.swift
//  Mood Tracker Delegate
//
//  Created by Kaichi Momose on 2017/10/02.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class ChooseMoodViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moodSegue: UISegmentedControl!
    var list: List?
    
    weak var delegate: MoodDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                
            print("save button tapped")
        }
        else if segue.identifier == "cancel" {
            print("cancel button tapped")
        }
    }
}

