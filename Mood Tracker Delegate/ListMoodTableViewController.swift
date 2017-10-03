//
//  ListMoodViewController.swift
//  Mood Tracker Delegate
//
//  Created by Kaichi Momose on 2017/10/02.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

protocol MoodDelegate: class {
    func didSelectMood(list: List)
}

class ListMoodTableViewController: UIViewController, MoodDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var lists = [List]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindToListMoodViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMood" {
            let chooseMoodViewController = segue.destination as! ChooseMoodViewController
            chooseMoodViewController.delegate = self
            print("+ button tapped")
        }
    }
    
    func didSelectMood(list: List) {
        lists.append(list)
    }
}

extension ListMoodTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listMoodTableViewCell", for: indexPath) as! ListMoodTableViewCell
        
        let row = indexPath.row
        
        let list = lists[row]
        
        cell.nameLabel.text = list.name
        
        cell.moodLabel.text = list.mood
        
        cell.moodModificationTimeLabel.text = list.modificationTime.convertToString()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let row = indexPath.row
            
            lists.remove(at: row)
        }
    }
}

