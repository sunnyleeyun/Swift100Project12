//
//  MainViewController.swift
//  project12
//
//  Created by Mac on 2017/11/7.
//  Copyright © 2017年 sunnyleeyun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  var Durl = URL(string: "http://placehold.it/120x120&text=image1")
  
  @IBOutlet weak var testImage: UIImageView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  var tableViewDataSource1stSection : [String] = ["Segue 1", "Segue 2", "Segue 3", "Segue 4", "Segue 5"]
  var imageArray = [UIImage(named: "1.jpg"), UIImage(named: "1.jpg"), UIImage(named: "1.jpg"), UIImage(named: "1.jpg"), UIImage(named: "1.jpg")]
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    
    testImage.downloadedFrom(url: Durl!)
    
    
    databaseRef = Database.database().reference()
    storageRef = Storage.storage().reference()
    
    fetchData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return brainList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
    if let imgUrl = URL(string: brainList[indexPath.item].imageUrl!){
      cell.imgImage.downloadedFrom(url: imgUrl)
    }
    cell.segueLabel.text = brainList[indexPath.item].titleName
    return cell
  }
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    let selectedCell = sender as! ImageCollectionViewCell
    let indexPath = collectionView.indexPath(for: selectedCell)
    if indexPath?.section == 0 {
      return true
    } else {
      return false
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "detail"{
      let selectedCell = sender as! ImageCollectionViewCell
      let indexPath = collectionView.indexPath(for: selectedCell)
      let destinationViewController = segue.destination as? DetailViewController
      destinationViewController?.sourceViewCellText = brainList[(indexPath?.item)!].titleName!
      //destinationViewController?.sourceViewCellText = tableViewDataSource1stSection[(indexPath?.row)!]
      
    }
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    print("selected: \(indexPath.item)")
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
        
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
        
      }
      
    })
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
