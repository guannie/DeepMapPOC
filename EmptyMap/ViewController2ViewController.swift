//
//  ViewController2ViewController.swift
//  EmptyMap
//
//  Created by Lee Kuan Xin on 04.10.17.
//  Copyright © 2017 HDMI. All rights reserved.
//

import UIKit
import HDMMapCore

class ViewController2ViewController: UIViewController, HDMMapViewControllerDelegate {

    var mapViewController: HDMMapViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let deepMap = DeepMap(package: Bundle.main.path(forResource: "DeepMap", ofType: "zip")!)   // TODO: bang! *2
        print("test")
        print(self.presentedViewController)
       self.mapViewController = HDMMapViewController(map: deepMap!, locale: "en-US")
        // = mapViewController
        // HDMMapViewController(map: deepMap!, locale: "en-us")
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
