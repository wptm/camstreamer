//
//  ViewController.swift
//  camstreamer
//
//  Created by Lucas Mendes on 02/04/20.
//  Copyright © 2020 devSDMF. All rights reserved.
//

import UIKit
import MobileCoreServices

class CustomUIImagePickerController: UIImagePickerController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
    }
    
    override public var shouldAutorotate: Bool {
        return true
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
    }
    
    override public var shouldAutorotate: Bool {
        return true
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }

    @IBAction func chooseFromCamera() {
        let picker: UIImagePickerController = CustomUIImagePickerController()
        
        picker.delegate = self;
        picker.sourceType = .camera
        
        picker.setNavigationBarHidden(true, animated: false)
        picker.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
        picker.cameraCaptureMode = UIImagePickerController.CameraCaptureMode.video
        picker.videoQuality = UIImagePickerController.QualityType.typeHigh
        picker.showsCameraControls = false
        
        //Change by wptm: instead of picker.cameraViewTransform.ty += 100;
        //I use the following two rows. This makes full screen viewer on
        //iPhone 11 Pro Max
        picker.cameraViewTransform = CGAffineTransform(scaleX: 1.0, y: 1.24)
        picker.cameraViewTransform.ty -= -85;

        
        present(picker, animated: true, completion: nil)
    }
    
}

