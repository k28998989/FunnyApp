//
//  ViewController.swift
//  GAME
//
//  Created by User21 on 2019/5/9.
//  Copyright © 2019 app. All rights reserved.
//

import UIKit
import UserNotifications
import SafariServices
import AVFoundation
class ViewController: UIViewController ,SFSafariViewControllerDelegate{

    var looper: AVPlayerLooper?
    let player = AVQueuePlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://r8---sn-5njj-u2xl.googlevideo.com/videoplayback?expire=1557774828&ei=jG3ZXJz4GYf9gAeP6qzQBg&ip=178.162.205.118&id=o-ALZ7Cn5oAgbu7APC34d5gTNBpA-PLVhW7_lDKu748Hqs&itag=18&source=youtube&requiressl=yes&mime=video%2Fmp4&gir=yes&clen=9713016&ratebypass=yes&dur=212.532&lmt=1540496687121157&fvip=3&beids=9466588&c=WEB&txp=5531432&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=ALgxI2wwRQIhAPRhqLDL-Be_zwgEWr-xWR57xaw34DGh-9t5Na789MTQAiA-Ak7mRcmKX7nnTGHZ1bFO3WJMj8A-GuHlidPq5lwaJA==&title=Alan_Walker_-_Faded&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xl&ms=au&mt=1557753113&mv=m&pl=16&lsparams=mip,mm,mn,ms,mv,pl&lsig=AHylml4wRAIgKPEjIp8Do7rV3qMEhZa68kasjbWf6oGvd-WG7zYqGVgCIEO4pqc5W9_tXNbPKRba9Y0NtnQbW9As-Ank8h7900YG") {
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func Start(_ sender: Any) {
        player.pause()
    }
    @IBAction func gameRules(_ sender: Any) {
        let controller = UIAlertController(title: "遊戲說明", message: "在各方向至外圍黑圈時，按下下方對應的方向鍵，即可獲得分數！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func toWeb(_ sender: Any) {
        if let url = URL(string: "https://youtube.com/")
        {
            let safari = SFSafariViewController(url: url)
            safari.delegate = self as! SFSafariViewControllerDelegate
            present(safari, animated: true, completion: nil)
        }
        
        let content = UNMutableNotificationContent()
        content.title = "驚喜"
        content.subtitle = "其實只是好玩而已"
        content.body = "快點來玩遊戲"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

