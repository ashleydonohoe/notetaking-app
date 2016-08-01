//
//  CreateNoteViewController.swift
//  Notetaking App
//
//  Created by Gabriele on 8/1/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit
var note: Note?

class CreateNoteViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentNote: [String: AnyObject] = [:]

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var noteImage: UIImageView!
    @IBOutlet weak var noteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(currentNote)
        if currentNote["title"] != nil {
            titleText.text = currentNote["title"] as! String
            noteText.text = currentNote["content"] as! String
        }
    }
    
    @IBAction func saveNote(_ sender: AnyObject) {
        
        let notesObject = UserDefaults.standard.object(forKey: "notes") as! [[String: AnyObject]]
        print(notesObject)
        var notes: [[String: AnyObject]] = []
        if let tempNotes = notesObject as? [[String:AnyObject]] {
            notes = tempNotes
//            let image = UIImagePNGRepresentation(noteImage.image!)! as NSData
            let note = ["title": titleText.text! as String , "content": noteText.text! as String, "starred": false as Bool]
            notes.append(note as! [String: AnyObject])
//            if titleText.text != nil && noteText.text != nil {
//                if noteImage.image != nil {
//                    // Convert these to dictionaries; eliminate structs for now
//                    let note = ["title": titleText.text!, "content": noteText.text!, "image": noteImage.image!, "starred": false]
//                    print(note)
//                    notes.append(note)
//                    print(notes)
//                    let alert = UIAlertController(title: "Success", message: "Your note with image has been saved!", preferredStyle: UIAlertControllerStyle.alert)
//                    self.present(alert, animated: true, completion: nil)
//                    self.dismiss(animated: true, completion: nil)
//                } else {
//                    let note = ["title": titleText.text!, "content": noteText.text!, "starred": false]
//                    print(note)
//                    notes.append(note as! [String : AnyObject])
//                    print(notes)
//                    self.dismiss(animated: true, completion: nil)
//                    let alert = UIAlertController(title: "Success", message: "Your note has been saved!", preferredStyle: UIAlertControllerStyle.alert)
//                    self.present(alert, animated: true, completion: nil)
//                }
//            } else {
//                let alert = UIAlertController(title: "Error", message: "Your note could not be saved! It may be missing the title or note content.", preferredStyle: UIAlertControllerStyle.alert)
//                self.present(alert, animated: true, completion: nil)
//            }
        }
        
        UserDefaults.standard.set(notes, forKey: "notes")
        print(notes[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelNoteCreation(_ sender: AnyObject) {
       self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImage(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        noteImage.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
