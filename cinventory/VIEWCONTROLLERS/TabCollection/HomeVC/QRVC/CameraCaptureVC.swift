//
//  CameraCaptureVC.swift
//  PolaroidPopLayouts
//
//  Created by clines227 on 06/06/2017.
//  Copyright © 2017 matech. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Photos
import PhotosUI
import CoreMotion;

class CameraCaptureVC: BaseViewController, AVCaptureMetadataOutputObjectsDelegate{
    
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    @IBOutlet weak var cameraView: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        
        // Make sure the view layout happens before requesting an image sized to fit the view.
        view.layoutIfNeeded();
        videoPreviewLayer?.frame.size = cameraView.frame.size
        
        prepareCamera();
        
        
    }
    
    func prepareCamera(){
        
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
        
        let captureDevice = AVCaptureDevice.default(for: .video);
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            // Start video capture.
            captureSession?.startRunning()
            
            // Move the message label and top bar to the front
            // view.bringSubview(toFront: messageLabel)
            // view.bringSubview(toFront: videoPreviewLayer)
            
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
    }
    
    
}





















