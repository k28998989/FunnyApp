//
//  GameView.swift
//  GAME
//
//  Created by User21 on 2019/5/12.
//  Copyright © 2019 app. All rights reserved.
//

import UIKit
import AVFoundation
var timer:Timer?
var check = 0;
class GameView: UIViewController {
    var player: AVPlayer?
    var looper: AVPlayerLooper?
    var top_dir = UIImageView();
    var right_dir = UIImageView();
    var left_dir = UIImageView();
    var down_dir = UIImageView();
    var now_score = 0;
    var type:Int = 0
    
    class direction{
        var type:Int
        var left:Int
        
        init(){
            self.type = Int.random(in: 0...3)
            self.left = self.type
        }
    }
    @IBOutlet weak var Final: UIButton!
    @IBOutlet weak var Score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://r8---sn-5njj-u2xl.googlevideo.com/videoplayback?expire=1557774828&ei=jG3ZXJz4GYf9gAeP6qzQBg&ip=178.162.205.118&id=o-ALZ7Cn5oAgbu7APC34d5gTNBpA-PLVhW7_lDKu748Hqs&itag=18&source=youtube&requiressl=yes&mime=video%2Fmp4&gir=yes&clen=9713016&ratebypass=yes&dur=212.532&lmt=1540496687121157&fvip=3&beids=9466588&c=WEB&txp=5531432&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=ALgxI2wwRQIhAPRhqLDL-Be_zwgEWr-xWR57xaw34DGh-9t5Na789MTQAiA-Ak7mRcmKX7nnTGHZ1bFO3WJMj8A-GuHlidPq5lwaJA==&title=Alan_Walker_-_Faded&cms_redirect=yes&mip=140.121.196.88&mm=31&mn=sn-5njj-u2xl&ms=au&mt=1557753113&mv=m&pl=16&lsparams=mip,mm,mn,ms,mv,pl&lsig=AHylml4wRAIgKPEjIp8Do7rV3qMEhZa68kasjbWf6oGvd-WG7zYqGVgCIEO4pqc5W9_tXNbPKRba9Y0NtnQbW9As-Ank8h7900YG" ) {
            player = AVPlayer(url: url)
            player?.play()
        }
        Final.isHidden = true
        var all_sec = 215
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.Score.text = (String(self.now_score))
            if all_sec > 0
            {
                all_sec = all_sec - 1
                if(all_sec%3==0)
                {
                    self.top_dir.removeFromSuperview();
                    self.down_dir.removeFromSuperview();
                    self.left_dir.removeFromSuperview();
                    self.right_dir.removeFromSuperview();
                    self.type = Int.random(in:0...3)
                    check = 0;
                    if(self.type == 0)
                    {
                        self.top_dir = UIImageView(image: UIImage(named: "final.png")!)
                        self.top_dir.frame = CGRect(x: 196, y: 428, width: 40, height: 40)
                        self.view.addSubview(self.top_dir)
                    }
                    else if(self.type == 1)
                    {
                        self.right_dir = UIImageView(image: UIImage(named: "下載.png")!)
                        self.right_dir.frame = CGRect(x: 196, y: 428, width: 40, height: 40)
                        self.view.addSubview(self.right_dir)
                    }
                    else if(self.type == 2)
                    {
                        self.left_dir = UIImageView(image: UIImage(named: "175410498 2.png")!)
                        self.left_dir.frame = CGRect(x: 196, y: 428, width: 40, height: 40)
                        self.view.addSubview(self.left_dir)
                    }
                    else
                    {
                        self.down_dir = UIImageView(image: UIImage(named: "175410498.png")!)
                        self.down_dir.frame = CGRect(x: 196, y: 428, width: 40, height: 40)
                        self.view.addSubview(self.down_dir)
                    }
                };            UIViewPropertyAnimator.runningPropertyAnimator(withDuration:3, delay: 0, animations: {
                    self.top_dir.center = CGPoint(x:220,y:250)
                    self.right_dir.center = CGPoint(x: 400, y: 450)
                    self.left_dir.center = CGPoint(x:20,y:450)
                    self.down_dir.center = CGPoint(x:220,y:660)
                })
            }
            else
            {
                self.top_dir.removeFromSuperview();
                self.down_dir.removeFromSuperview();
                self.left_dir.removeFromSuperview();
                self.right_dir.removeFromSuperview();
                if timer != nil {
                    timer?.invalidate()
                }
                self.Final.isHidden = false
            }
            
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func upArrow(_ sender: Any) {
        print(top_dir.layer.presentation()?.frame.origin.y)
        let now = top_dir.layer.presentation()?.frame.origin.y
        let x1 = CGFloat(260.0)
        let x2 = CGFloat(230.0)
        if(now! <= x1 && now! >= x2)
        {
            now_score = now_score+3;
        }
        check = check+1
        self.top_dir.removeFromSuperview();
    }
    @IBAction func DownArrow(_ sender: Any) {
        print(down_dir.layer.presentation()?.frame.origin.y)
        let now = down_dir.layer.presentation()?.frame.origin.y
        let x1 = CGFloat(630.0)
        let x2 = CGFloat(600.0)
        if(now! <= x1 && now! >= x2)
        {
            now_score = now_score+3;
        }
        check = check+1
        self.down_dir.removeFromSuperview();
    }
    @IBAction func LeftArrow(_ sender: Any) {
        print(left_dir.layer.presentation()?.frame.origin.x)
        let now = left_dir.layer.presentation()?.frame.origin.x
        let x1 = CGFloat(40.0)
        let x2 = CGFloat(10.0)
        if(now! <= x1 && now! >= x2){
            now_score = now_score+3;
        }
        check = check+1
        self.left_dir.removeFromSuperview();
    }
    @IBAction func RightArrow(_ sender: Any) {
        print(right_dir.layer.presentation()?.frame.origin.x)
        let now = right_dir.layer.presentation()?.frame.origin.x
        let x1 = CGFloat(370.0)
        let x2 = CGFloat(350.0)
        if(now! <= x1 && now! >= x2){
        now_score = now_score+3;
        }
        check = check+1
        self.right_dir.removeFromSuperview();
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? FinalView
        controller?.Score = Score.text
    }
}
