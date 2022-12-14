//
//  Constants.swift
//  TerraTest
//
//  Created by Natalia Shevaldina on 03.08.2022.
//

import UIKit

enum Constants {
    enum Colors {
        static var greyColor = UIColor.darkGray
        static var oliveColor = UIColor(red: 0.4, green: 0.4, blue: 0.2, alpha: 1)
        static var navyColor = UIColor(red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
        static var alphaColor = UIColor(red: 0.2, green: 0.2, blue: 0.3, alpha: 0.8)
        static var purpleColor = UIColor(red: 0.4, green: 0.1, blue: 0.4, alpha: 1)
        static var blueColor = UIColor(red: 0.1, green: 0.4, blue: 0.4, alpha: 1)
        static var whiteColorCG = UIColor.white.cgColor
    }
    
    enum Images {
        static let appleImage: UIImage = UIImage(named: "Apple") ?? UIImage()
        static let backgroundOne: UIImage = UIImage(named: "Bg1") ?? UIImage()
        static let backgroundTwo: UIImage = UIImage(named: "Bg2") ?? UIImage()
        static let closeButton: UIImage = UIImage(named: "CloseButton") ?? UIImage()
    }
    
    enum Smiles {
        case sm1
        case sm2
        case sm3
        case sm4
        case sm5
        case sm6
        case sm7
        case sm8
        case sm9
        case sm0
    }
    
    enum SmileText {
        static let smileText = "ð = 1\n ð = 2\n ð = 3\n ð = 4\n ð = 5\n ðĪŠ = 6\n ðĨļ = 7\n ð = 8\n ðĨ° = 9\n ðĨģ = 0"                   
    }
}
