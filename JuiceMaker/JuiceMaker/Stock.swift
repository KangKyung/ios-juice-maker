//
//  Stock.swift
//  JuiceMaker
//
//  Created by 강경, Ryan on 2021/03/08.
//

import Foundation

// MARK: - Stock Type
class Stock {
  private(set) static var shared = [Fruit: Int]()
  
  init() {
    for fruit in Fruit.allCases {
      Stock.shared[fruit] = 10
    }
  }
  
  static func checkStock(for fruit: Fruit) {
    guard let fruitNumberInStock = Stock.shared[fruit] else {
      printInvalidFruitError()
      return
    }
    print("\(fruit): \(fruitNumberInStock)")
  }
  
  static func printInvalidFruitError() {
    print("🔥 과일 입력이 잘못되었습니다.")
  }
  
  static func count(for fruit: Fruit) throws -> Int {
    guard let fruitNumberInStock = Stock.shared[fruit] else {
      informErrorLocation(functionName: #function)
      throw FruitError.invalidFruit
    }
    return fruitNumberInStock
  }
  
  static func subtract(for fruit: Fruit, amount: Int = 1) {
    guard let fruitNumberInStock = Stock.shared[fruit] else {
      printInvalidFruitError()
      return
    }
    if fruitNumberInStock >= 0 {
      Stock.shared[fruit] = fruitNumberInStock - amount
    } else {
      print("재고가 없어 더 차감할 수 없습니다.")
    }
  }
  
  static func add(for fruit: Fruit) {
    guard let fruitNumberInStock = Stock.shared[fruit] else {
      printInvalidFruitError()
      return
    }
    Stock.shared[fruit] = fruitNumberInStock + 1
  }
}
