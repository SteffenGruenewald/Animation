//
//  BabyModeViewController.swift
//  Alarm For Children
//
//  Created by Huijing on 25/01/2017.
//  Copyright © 2017 Huijing. All rights reserved.
//

import UIKit

import MASSDK

class BabyModeViewController: BaseViewController {

    @IBOutlet weak var btnBabyModeStatus: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imvBack: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.navigationController?.viewControllers.count == 1
        {
            btnBack.isHidden = true
            imvBack.isHidden = true
            self.navigationController?.isNavigationBarHidden = false
        }
        else{
            self.navigationController?.isNavigationBarHidden = true
            btnBack.isHidden = false
            imvBack.isHidden = false
            imvBack.setImageWith(color: UIColor.white)
        }
        setButtonStatus()
        
    }
    
    override func appDidEnterForeground() {
        setButtonStatus()
    }
    

    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func babyModeStatusButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!)
        /*
        if Settings.getAirplaneStatus(){
            
            /*btnBabyModeStatus.backgroundColor = UIColor(colorLiteralRed: 72.0 / 255.0, green: 142.0 / 255.0 , blue: 42.0 / 255.0, alpha: 1)
            btnBabyModeStatus.setTitle("START", for: .normal)*/
        }
        else{
            //Settings.baby_mode_status = Constants.BABY_MODE_ON
            /*btnBabyModeStatus.backgroundColor = UIColor(colorLiteralRed: 173.0 / 255.0, green: 37.0 / 255.0 , blue: 36.0 / 255.0, alpha: 1)
            btnBabyModeStatus.setTitle("STOP", for: .normal)*/
            
            UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!)
            
        }*/
    }
    
    func setButtonStatus() {
        if (Settings.getAirplaneStatus()){
            btnBabyModeStatus.backgroundColor = UIColor(colorLiteralRed: 173.0 / 255.0, green: 37.0 / 255.0 , blue: 36.0 / 255.0, alpha: 1)
            btnBabyModeStatus.setTitle("STOP", for: .normal)
        }
        else{
            btnBabyModeStatus.backgroundColor = UIColor(colorLiteralRed: 72.0 / 255.0, green: 142.0 / 255.0 , blue: 42.0 / 255.0, alpha: 1)
            btnBabyModeStatus.setTitle("START", for: .normal)
        }
    }

}
