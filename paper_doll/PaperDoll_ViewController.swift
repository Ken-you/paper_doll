//
//  PaperDoll_ViewController.swift
//  paper_doll
//
//  Created by yousun on 2021/4/15.
//

import UIKit
import AVFoundation

class PaperDoll_ViewController: UIViewController {
    
    @IBOutlet weak var HeadImage: UIImageView!
    @IBOutlet weak var FaceImage: UIImageView!
    @IBOutlet weak var BeardImage: UIImageView!
    @IBOutlet weak var GlassesImage: UIImageView!
    @IBOutlet weak var PoseImage: UIImageView!
    
    
    @IBOutlet weak var HeadScrollView: UIScrollView!
    @IBOutlet weak var FaceScrollView: UIScrollView!
    @IBOutlet weak var GlassesScrollView: UIScrollView!
    @IBOutlet weak var BeardScrollView: UIScrollView!
    @IBOutlet weak var PoseScrollView: UIScrollView!
    
    
    @IBOutlet weak var NameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func ChooseSegmented(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            HeadScrollView.isHidden = false
            FaceScrollView.isHidden = true
            GlassesScrollView.isHidden = true
            BeardScrollView.isHidden = true
            PoseScrollView.isHidden = true
            
        }else if sender.selectedSegmentIndex == 1{
            HeadScrollView.isHidden = true
            FaceScrollView.isHidden = false
            GlassesScrollView.isHidden = true
            BeardScrollView.isHidden = true
            PoseScrollView.isHidden = true
            
        }else if sender.selectedSegmentIndex == 2{
            HeadScrollView.isHidden = true
            FaceScrollView.isHidden = true
            GlassesScrollView.isHidden = false
            BeardScrollView.isHidden = true
            PoseScrollView.isHidden = true
            
        }else if sender.selectedSegmentIndex == 3{
            HeadScrollView.isHidden = true
            FaceScrollView.isHidden = true
            GlassesScrollView.isHidden = true
            BeardScrollView.isHidden = false
            PoseScrollView.isHidden = true
            
        }else if sender.selectedSegmentIndex == 4{
            HeadScrollView.isHidden = true
            FaceScrollView.isHidden = true
            GlassesScrollView.isHidden = true
            BeardScrollView.isHidden = true
            PoseScrollView.isHidden = false
        }
    }
    
    @IBAction func HeadBtn(_ sender: UIButton) {
        HeadImage.image = sender.currentImage
    }
    
    @IBAction func FaceBtn(_ sender: UIButton) {
        FaceImage.image = sender.currentImage
    }
    
    @IBAction func GlassesBtn(_ sender: UIButton) {
        GlassesImage.image = sender.currentImage
    }
    
    @IBAction func BeardBtn(_ sender: UIButton) {
        BeardImage.image = sender.currentImage
    }
    
    @IBAction func PoseBtn(_ sender: UIButton) {
        PoseImage.image = sender.currentImage
    }
    
    
    
    @IBAction func speakBtn(_ sender: Any) {
        
        let speak = AVSpeechUtterance(string: NameTextField.text! + "每天都扶老太太過馬路")
        speak.voice = AVSpeechSynthesisVoice.init(language: "zh-TW")
        speak.pitchMultiplier = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speak)
        
    }
}
