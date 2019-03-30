//
//  ViewController.swift
//  DailyMotivations
//
//  Created by Duale on 3/29/19.
//  Copyright © 2019 Duale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let mots = ["mot1" , "mot2" , "mot3" , "mot4"
        , "mot5" , "mot6" , "mot7" , "mot8", "mot9", "mot10", "mot11","mot12" , "mot13" ,   "mot14"
        , "mot15" , "mot16" , "mot17" , "mot18", "mot19" , "mot20"]
    
    var index : Int = 0
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBAction func downButton(_ sender: UIButton) {
    }
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBAction func frontButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setMots()
    }
    
    func setMots ()  {
      ImageView.image = UIImage(named: mots[index])
    }
    
    func updateUI () {
        setMots()
    }
    
    
    @IBAction func onPressedBtn(_ sender: UIButton) {
        if (sender.tag == 1 ) {
            index+=1;
        } else if (sender.tag == 2 ) {
            index-=1;
        }
        setMots()
        Limits()
    }
    
    func Limits () {
        if (index == 0  ) {
            let alert = UIAlertController(title: "Go to next! ",
                                          message: "press on next", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Next", style: .default, handler: { UIAlertAction in
                self.restart()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
            
        }
        else if (index == 19 ) {
            let alert = UIAlertController(title: "Go to back! ",
                                          message: "press on back", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Back", style: .default, handler: { UIAlertAction in
                self.end()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
        else if ( index % 5 == 0 ) {
            let alert = UIAlertController(title: "Daily goal reached!",
                                          message: "You are done for five motivations", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Continue if you want", style: .default, handler: { UIAlertAction in
                self.DailyDone()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func restart() {
        index = 0;
        setMots()
    }
    
    func end() {
        index = 19;
        setMots()
   }
    
    func DailyDone() {
        index+=0
        setMots()
    }
}

