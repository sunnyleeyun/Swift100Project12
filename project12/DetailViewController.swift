//
//  DetailViewController.swift
//  project12
//
//  Created by Mac on 2017/11/7.
//  Copyright © 2017年 sunnyleeyun. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {
  
  var sourceViewCellText = ""
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var testLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Source Cell Text is \(sourceViewCellText)")
    testLabel.text = sourceViewCellText
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
}


