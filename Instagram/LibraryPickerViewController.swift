//
//  LibraryPickerViewController.swift
//  Instagram
//
//  Created by Haimei Yang on 2/26/18.
//  Copyright © 2018 Haimei Yang. All rights reserved.
//

import UIKit
import Parse

class LibraryPickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        choosePicFromLibrary()
    }
    
    func choosePicFromLibrary() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = originalImage
        /*
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage */
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "LibraryToCompose", sender: nil)
    }
    
    @IBAction func ChooseAnotherPicBtn(_ sender: Any) {
        choosePicFromLibrary()
    }
    
    @IBAction func PostBtnPressed(_ sender: Any) {
        Post.postUserImage(image: imageView.image, withCaption: captionText.text) { (success: Bool, error: Error?) in
            
            //If success
            if success {
                print("Photo got posted")
                
                // Clear out old data and return to homefeed view
                self.performSegue(withIdentifier: "afterPost", sender: nil)
                self.tabBarController?.selectedIndex = 0
                self.imageView.image = nil
                self.captionText.text = ""
                self.captionText.placeholder = "Caption your photo here..."
                
                //Error
            } else {
                print("Error posting to \"Instagram\" in function onSubmitPostButtonPressed(): \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    
    
}
