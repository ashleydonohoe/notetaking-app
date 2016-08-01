//
//  FirstViewController.swift
//  Notetaking App
//
//  Created by AD on 7/31/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    // Sets variable to hold the notes saved
    var notes: [[String: AnyObject]] = [ ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let notesObject = UserDefaults.standard.object(forKey: "notes") as! [[String: AnyObject]]
        
       if let tempNotes = notesObject as? [[String:AnyObject]] {
            notes = tempNotes
        }
        
        table.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]["title"] as? String
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let viewOrEditController = self.storyboard?.instantiateViewController(withIdentifier: "viewOrEditNote") as! CreateNoteViewController
        viewOrEditController.currentNote = notes[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editNoteIdentifier" {
            print("Note")
        }
    }
}

