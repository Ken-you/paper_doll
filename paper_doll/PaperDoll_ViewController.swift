//
//  PaperDoll_ViewController.swift
//  paper_doll
//
//  Created by yousun on 2021/4/15.
//

import UIKit
import AVFoundation

class PaperDoll_ViewController: UIViewController {
    
    // 左邊多個重疊的 Image 先形成人物，之後透過 Button 轉換圖片
    @IBOutlet weak var HeadImage: UIImageView!
    @IBOutlet weak var FaceImage: UIImageView!
    @IBOutlet weak var BeardImage: UIImageView!
    @IBOutlet weak var GlassesImage: UIImageView!
    @IBOutlet weak var PoseImage: UIImageView!
    
    // 右邊的框框裡有 5 種不一樣的 ScrollView，透過 Segment 切換來選擇圖片
    @IBOutlet weak var HeadScrollView: UIScrollView!
    @IBOutlet weak var FaceScrollView: UIScrollView!
    @IBOutlet weak var GlassesScrollView: UIScrollView!
    @IBOutlet weak var BeardScrollView: UIScrollView!
    @IBOutlet weak var PoseScrollView: UIScrollView!
    
    // 抓取打出來的文字，配合 AVSpeechSynthesizer 說話
    @IBOutlet weak var NameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 從 TextField 拉 IBAction 修改成 Did End On Exit 用於收鍵盤
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    // if 來判斷 selectedSegmentIndex 選擇的位置 顯示/隱藏 ScrollView
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
    
    // ScrollView 裡面的 ImageButton 點選直接跟換
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
    
    
    // 按下 Button 讀出 TextField 裡的文字
    @IBAction func speakBtn(_ sender: Any) {
        
        let speak = AVSpeechUtterance(string: NameTextField.text! + "每天都扶老太太過馬路")
        speak.voice = AVSpeechSynthesisVoice.init(language: "zh-TW")
        speak.pitchMultiplier = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speak)
        
    }
}
