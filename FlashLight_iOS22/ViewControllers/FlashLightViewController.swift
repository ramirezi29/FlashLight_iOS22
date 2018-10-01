//
//  FlashLightViewController.swift
//  FlashLight_iOS22
//
//  Created by Ivan Ramirez on 10/1/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit
import AVKit

class FlashLightViewController: UIViewController {
    
    @IBOutlet weak var FlashLightButton: UIButton!
    
    var isOn = false
    
    @IBOutlet weak var scaryImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        flashLightOff()
    }
    @IBAction func userSwipedAction(_ sender: Any) {
        print("SWiper No Swipping")
        if isOn == false {
            flashLightOff()
            toggleTorch(on: false)
            
        } else {
            if isOn == true {
                flashLightOn()
                toggleTorch(on: true)
            }
        }
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video)
            else {return}
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
        
    }
    func flashLightOff() {
        view.backgroundColor = .black
        FlashLightButton.setTitle("Off", for: .normal)
        FlashLightButton.setTitleColor(.white, for: .normal)
        scaryImage.image = UIImage.init(named: "pumpkinHeads")
        isOn = true
    }
    
    func flashLightOn() {
        view.backgroundColor = .white
        FlashLightButton.setTitle("On", for: .normal)
        FlashLightButton.setTitleColor(.black, for: .normal)
        scaryImage.image = UIImage.init(named: "")
        isOn = false
    }
}
