//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
  @IBOutlet weak var bananaJuiceOrderButton: UIButton!
  @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
  @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
  @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
  @IBOutlet weak var mangoJuiceOrderButton: UIButton!
  @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
  
  
  let juiceMaker = JuiceMaker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    strawberryJuiceOrderButton.titleLabel?.textAlignment = .center
    bananaJuiceOrderButton.titleLabel?.textAlignment = .center
    kiwiJuiceOrderButton.titleLabel?.textAlignment = .center
    pineappleJuiceOrderButton.titleLabel?.textAlignment = .center
    strawberryBananaJuiceOrderButton.titleLabel?.textAlignment = .center
    mangoJuiceOrderButton.titleLabel?.textAlignment = .center
    mangoKiwiJuiceOrderButton.titleLabel?.textAlignment = .center
    // Do any additional setup after loading the view.
  }
  
  @IBAction func touchUpOrderButton(_ sender: UIButton) {
    switch sender {
    case strawberryJuiceOrderButton:
      juiceMaker.make(of: .strawberryJuice)
    case bananaJuiceOrderButton:
      juiceMaker.make(of: .bananaJuice)
    case kiwiJuiceOrderButton:
      juiceMaker.make(of: .kiwiJuice)
    case pineappleJuiceOrderButton:
      juiceMaker.make(of: .pineappleJuice)
    case strawberryBananaJuiceOrderButton:
      juiceMaker.make(of: .strawberryBananaJuice)
    case mangoJuiceOrderButton:
      juiceMaker.make(of: .mangoJuice)
    case mangoKiwiJuiceOrderButton:
      juiceMaker.make(of: .mangoKiwiJuice)
    default:
      print("듣도 보도 못한 버튼이군요..")
      informErrorLocation(functionName: #function)
    }
    // 재고확인용 테스트 코드
    juiceMaker.stock.checkStock(for: .strawberry)
    juiceMaker.stock.checkStock(for: .banana)
    juiceMaker.stock.checkStock(for: .mango)
    juiceMaker.stock.checkStock(for: .pineapple)
    juiceMaker.stock.checkStock(for: .kiwi)
  }
}

