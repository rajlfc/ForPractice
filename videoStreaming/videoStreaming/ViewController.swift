//
//  ViewController.swift
//  videoStreaming
//
//  Created by Sudipta Kumar Bhattacharjee on 26/12/22.
//

import UIKit
import streamingKit

class ViewController: UIViewController {

    private let videoPlayer = StreamingVideoPlayer()
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var greyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textfield.text = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        setupVideoPlayer()
    }
    
    private func setupVideoPlayer() {
        videoPlayer.add(view: greyView)
    }

    @IBAction func playButtonTapped() {
        guard let text = textfield.text, let url = URL(string: text) else {
            return
        }
        videoPlayer.play(url: url)
    }
    
    @IBAction func stopButtonTapped() {
        videoPlayer.pause()
    }
    
    @IBAction func clearButtonTapped() {
        textfield.text = nil
        videoPlayer.pause()
    }

}

