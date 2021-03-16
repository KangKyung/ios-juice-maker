//
//  Error'.swift
//  JuiceMaker
//
//  Created by 강경, Ryan on 2021/03/11.
//

import Foundation

enum FruitError: Error, CustomStringConvertible {
  case invalidFruit
  case nilHasOccurredWhileSubtracting
  case nilHasOccurredWhileAdding
  case nilHasOccurredWhileCheckingStock
  
  var description: String {
    switch self {
    case .invalidFruit:
      return "🔥 과일 입력이 잘못되었습니다."
    case .nilHasOccurredWhileSubtracting:
      return "🔥 쥬스 재고 차감 중 stock[fruit] = nil이 발생하였습니다."
    case .nilHasOccurredWhileAdding:
      return "🔥 쥬스 재고 추가 중 stock[fruit] = nil이 발생하였습니다."
    case .nilHasOccurredWhileCheckingStock:
      return "🔥 쥬스 재고 확인 중 stock[fruit] = nil이 발생하였습니다."
    }
  }
}

enum JuiceError: Error, CustomStringConvertible {
  case nilHasOccurredWhileCheckingRequiredFruits
  
  var description: String {
    switch self {
    case .nilHasOccurredWhileCheckingRequiredFruits:
      return "🔥 우리 가게에 없는 쥬스군요."
    }
  }
}

enum RecipeError: Error, CustomStringConvertible {
  case jsonDecodingFailed
  case nilHasOccurredWhileUnwrappingRecipe
  
  var description: String {
    switch self {
    case .jsonDecodingFailed:
      return "JSON 디코딩 작업에 실패하여 레시피를 읽어 들이지 못했습니다."
    case .nilHasOccurredWhileUnwrappingRecipe:
      return "레시피를 가져오는 과정에서 옵셔널 해제에 실패했습니다."
    }
  }
}
