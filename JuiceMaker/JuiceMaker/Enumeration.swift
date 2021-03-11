//
//  Enumeration.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/11.
//

import Foundation

enum Fruit: String, CaseIterable {
    case strawberry = "Strawberry"
    case banana = "Banana"
    case pineapple = "Pineapple"
    case kiwi = "Kiwi"
     case mango = "Mango"
 }

enum Juice: String {
  case strawberryJuice = "딸기쥬스"
  case bananaJuice = "바나나쥬스"
  case kiwiJuice = "키위쥬스"
  case pineappleJuice = "파인애플쥬스"
  case strawberryBananaJuice = "딸바쥬스"
  case mangoJuice = "망고쥬스"
  case mangoKiwiJuice = "망고키위쥬스"
  
  internal var name: String {
    return self.rawValue
  }
}
