//
//  PlaySongVC.swift
//  SwappingScreens
//
//  Created by Shashank.Rao on 10/29/16.
//  Copyright © 2016 Shashank.Rao. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    private var _selectedSong:String!
    @IBOutlet weak var songLabel: UILabel!
    
    var selectedSong: String {
        get {
            return _selectedSong
        }
        set {
            _selectedSong = newValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songLabel.text = _selectedSong
        
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
