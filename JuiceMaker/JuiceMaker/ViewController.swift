//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  let juiceMaker = JuiceMaker()
  
  @IBOutlet var strawberryStockQuantityLabel: UILabel!
  @IBOutlet var bananaStockQuantityLabel: UILabel!
  @IBOutlet var pineappleStockQuantityLabel: UILabel!
  @IBOutlet var kiwiStockQuantityLabel: UILabel!
  @IBOutlet var mangoStockQuantityLabel: UILabel!
  
  @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
  @IBOutlet weak var bananaJuiceOrderButton: UIButton!
  @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
  @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
  @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
  @IBOutlet weak var mangoJuiceOrderButton: UIButton!
  @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
  
  @IBOutlet var buttons: [UIButton]!
  @IBOutlet var labels: [UILabel]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateFruitStockQuantity()
    NotificationCenter.default.addObserver(self, selector: #selector(adjustButtonDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(adjustLabelDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
  }
  @objc func adjustButtonDynamicType() {
    buttons.forEach{ (button) in
      button.titleLabel?.adjustsFontForContentSizeCategory = true
    }
  }
  @objc func adjustLabelDynamicType() {
    labels.forEach{ (label) in
      label.adjustsFontForContentSizeCategory = true
    }
  }
  
  func updateFruitStockQuantity() {
    strawberryStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.strawberry))"
    bananaStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.banana))"
    pineappleStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.pineapple))"
    kiwiStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.kiwi))"
    mangoStockQuantityLabel.text = "\(Stock.shared.count(for: Fruit.mango))"
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "",
                                  message: juiceMaker.orderResult.message,
                                  preferredStyle: UIAlertController.Style.alert)
    
    if juiceMaker.orderResult.isSuccessed {
      let okAction = UIAlertAction(title: "확인", style: .default)
      
      alert.addAction(okAction)
    } else {
      let cancelAction = UIAlertAction(title: "아니오", style: .cancel)
      let moveAction = UIAlertAction(title: "예", style: .default) { (action) in
        self.performSegue(withIdentifier: "goToModifyStockView", sender: self)
      }
      
      alert.addAction(cancelAction)
      alert.addAction(moveAction)
    }
    
    present(alert,
            animated: false,
            completion: nil)
  }
  
  @IBAction func touchUpOrderButton(_ sender: UIButton) {
//    guard let buttonTitle = sender.titleLabel else {
//      return
//    }
//    guard let buttonTitleText = buttonTitle.text else {
//      return
//    }
//    let juiceName = buttonTitleText.replacingOccurrences(of: " 주문", with: "")
//    guard let orderedJuice = Juice(rawValue: juiceName) else {
//      return
//    }

    guard let orderedJuice = findJuicethroughButton(button: sender) else {
      return
    }
    
    do {
      try juiceMaker.make(of: orderedJuice)
    } catch {
      print(error)
    }
    
    updateFruitStockQuantity()
    showAlert()
  }
  
  func findJuicethroughButton(button: UIButton) -> Juice? {
    var juice: Juice?
    switch(button) {
    case strawberryJuiceOrderButton :
      juice = Juice.strawberryJuice
    case bananaJuiceOrderButton :
      juice = Juice.bananaJuice
    case kiwiJuiceOrderButton :
      juice = Juice.kiwiJuice
    case pineappleJuiceOrderButton :
      juice = Juice.pineappleJuice
    case strawberryBananaJuiceOrderButton :
      juice = Juice.strawberryBananaJuice
    case mangoJuiceOrderButton :
      juice = Juice.mangoJuice
    case mangoKiwiJuiceOrderButton :
      juice = Juice.mangoKiwiJuice
    default:
      print("잘못된 쥬스버튼 입력입니다.")
    }
    
    return juice
  }
}
