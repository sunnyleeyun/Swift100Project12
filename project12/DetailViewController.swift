//
//  DetailViewController.swift
//  project12
//
//  Created by Mac on 2017/11/7.
//  Copyright © 2017年 sunnyleeyun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class DetailViewController: UIViewController {
  
  var sourceViewCellText = ""
  
  @IBOutlet weak var testLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Source Cell Text is \(sourceViewCellText)")
    //testLabel.text = sourceViewCellText
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  var brainList = [Brain]()
  
  var refHandle: UInt!
  var databaseRef: DatabaseReference!
  var storageRef: StorageReference!
  func fetchData(){
    // Listen for new comments in the Firebase database
    databaseRef.child("Brain").observe(.childAdded, with: { (snapshot) in
      
      if let dictionary = snapshot.value as? [String: AnyObject]{
        print("dictionary is \(dictionary)")
        
        let brain = Brain()
        brain.titleName = dictionary["titleName"] as? String
        brain.imageUrl = dictionary["imageUrl"] as? String
        
        self.brainList.append(brain)
        
        
        
      }
      
    })
  }
  
  
  
}


