//
//  CreateNoteViewController.swift
//  Notetaking App
//
//  Created by Gabriele on 8/1/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var noteImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
