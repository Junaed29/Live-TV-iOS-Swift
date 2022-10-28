//
//  ViewController.swift
//  Live TV
//
//  Created by Junaed Muhammad Chowdhury on 28/10/22.
//

import UIKit
import StreamingKit

class ViewController: UIViewController {
    private let videoPlayer = StreamingVideoPlayer()

    @IBOutlet weak var viewVideoPlayer: UIView!
    @IBOutlet weak var textFieldUrl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVideoPlayer()
    }
    
    private func setUpVideoPlayer(){
        videoPlayer.add(to: viewVideoPlayer)
    }

    @IBAction func playButtonClicked(_ sender: UIButton) {
        guard let textUrl = textFieldUrl.text, let url = URL(string: textUrl) else{
            print("Error parsing url")
            return
        }
        
        videoPlayer.play(url: url)
    }
    
    @IBAction func pauseButtonClicked(_ sender: UIButton) {
        videoPlayer.pause()
    }
    
    @IBAction func clearbuttonClicked(_ sender: UIButton) {
        textFieldUrl.text = nil
        videoPlayer.pause()
    }
}

