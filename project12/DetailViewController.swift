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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Source Cell Text is \(sourceViewCellText)")
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
