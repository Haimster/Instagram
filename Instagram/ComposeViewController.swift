//
//  ComposeViewController.swift
//  Instagram
//
//  Created by Haimei Yang on 2/26/18.
//  Copyright © 2018 Haimei Yang. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func CancelBtnPressed(_ sender: Any){
            self.performSegue(withIdentifier: "toHome", sender: nil)
    }
    
    @IBAction func ShareBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toHome", sender: nil)
    }
    
    @IBAction func PhotoLibraryBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toLibrary", sender: nil)
    
    }
    
    @IBAction func CameraBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toCamera", sender: nil)
    
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
