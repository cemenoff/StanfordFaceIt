//
//  FacialExpression.swift
//  StanfordFaceIt
//
//  Created by Anton Semenov on 04/10/2017.
//  Copyright © 2017 Anton Semenov. All rights reserved.
//

import Foundation

// UI-Independent representation of a facial expression

struct FacialExpression {
    
    enum Eyes: Int {
        case open
        case closed
        case squinting
    }
    
    enum Mouth: Int {
        case frown
        case smirk
        case neutral
        case grin
        case smile
        case wonder
        
        var sadder: Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .frown
        }
        var happier: Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .smile
        }
    }
    
    var sadder: FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    var happier: FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
    let eyes: Eyes
    let mouth: Mouth
}

