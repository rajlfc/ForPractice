//
//  VideoPlayer.swift
//  streamingKit
//
//  Created by Sudipta Kumar Bhattacharjee on 26/12/22.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

public class StreamingVideoPlayer {
    
    private let playerViewController = AVPlayerViewController()
    
    private let avPlayer = AVPlayer()
    
    private lazy var playerView: UIView = {
        let view = playerViewController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init() {
        
    }
    
    public func add(view: UIView) {
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])
        
        //NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnded), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
    }
    
    public func play(url: URL) {
        let asset = AVAsset(url: url)
        print("42..\(asset.isPlayable)")
        //NotificationCenter.default.post(name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
        let playerItem = AVPlayerItem(asset: asset)
        avPlayer.replaceCurrentItem(with: playerItem)
        playerViewController.player = avPlayer
        playerViewController.player?.play()
        
    }
    
//    @objc private func videoDidEnded() {
//        print("video ended")
//        playerViewController.dismiss(animated: true, completion: nil)
//        NotificationCenter.default.removeObserver(self)
//    }
    
    public func pause() {
        avPlayer.pause()
    }
    
    /// Get the link from https://gist.github.com/rmoriz/cd6c252896108744ba3c228fc386e07e
    /// https://liveproduseast.global.ssl.fastly.net/us/Channel-USTV-AWS-virginia-1/Source-USTV-1000-1_live.m3u8
    
}
