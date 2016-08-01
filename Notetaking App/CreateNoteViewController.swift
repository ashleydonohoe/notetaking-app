//
//  CreateNoteViewController.swift
//  Notetaking App
//
//  Created by Gabriele on 8/1/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit
var noteWithImage: Note?
var noteWithoutImage: NoteWithoutImage?

class CreateNoteViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentNote: Note?

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var noteImage: UIImageView!
    
    @IBOutlet weak var noteText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveNote(_ sender: AnyObject) {
        if titleText.text != nil && noteText.text != nil {
            if noteImage.image != nil {
                noteWithImage = Note(title: titleText.text!, content: noteText.text, image: noteImage.image!)
            } else {
                noteWithoutImage = NoteWithoutImage(title: titleText.text!, content: noteText.text!)
            }
        }
        print(noteWithImage)
        print(noteWithoutImage)
        
        if noteWithImage != nil || noteWithoutImage != nil {
            let alert = UIAlertController(title: "Success", message: "Your note has been saved!", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Your note could not be saved!", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true, completion: nil)
        }
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
        print(info)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        noteImage.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
