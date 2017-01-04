//
//  ViewController.swift
//  YKHangul
//
//  Created by yojkim on 2017. 1. 5..
//  Copyright © 2017년 yojkim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stringLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangulSystem = YKHangul()
        
        stringLabel.text = hangulSystem.getStringConsonant(string: "안녕하세요. 저는 yojkim입니다.", consonantType: .Initial)
    }

}

