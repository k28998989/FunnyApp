//
//  FinalView.swift
//  GAME
//
//  Created by User21 on 2019/5/12.
//  Copyright © 2019 app. All rights reserved.
//

import UIKit

class FinalView: UIViewController {

    var Score:String?
    var highest:String?
    @IBOutlet weak var overHighestScore: UILabel!
    @IBOutlet weak var thisScore: UILabel!
    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var picture2: UIImageView!
    func ShowResult()
    {
        
        picture1.isHidden = true
        picture2.isHidden = true
        var highest = UserDefaults.standard.integer(forKey: "highest")
        if Int(Score!)! > highest
        {
            UserDefaults.standard.set(self.Score, forKey: "highest")
            picture1.isHidden = false
            picture2.isHidden = true
        }
        else
        {
            picture1.isHidden = true
            picture2.isHidden = false
        }
        highest = UserDefaults.standard.integer(forKey: "highest")
        overHighestScore.text = String(highest)
        thisScore.text = self.Score
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowResult()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func home(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "first") {
            present(controller, animated: true, completion: nil)
        }
    }
}
