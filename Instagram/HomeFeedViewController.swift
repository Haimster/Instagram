//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by Haimei Yang on 2/25/18.
//  Copyright © 2018 Haimei Yang. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //outlets
    @IBOutlet weak var tableView: UITableView!
    
    //variables
    var Instaposts: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 380

        /*
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        */
        getPosts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LogoutBtnPressed(_ sender: Any) {
         self.performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    
    @IBAction func ComposeBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toCompose", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.captionLabel.text = Instaposts[indexPath.row]["caption"] as? String
        if let photo = Instaposts[indexPath.row]["media"] as? PFFile {
            photo.getDataInBackground(block: { (data, error) in
                if let data = data {
                    cell.InstaPhoto.image = UIImage(data: data)
                } else {
                    print("setting image failed")
                }
            })
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Instaposts.count;
    }
    
    
    @objc func getPosts() {
        let query = Post.query()
        query?.addDescendingOrder("_created_at")
        query?.limit = 20
        
        query?.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts {
                self.Instaposts = posts
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }

}
