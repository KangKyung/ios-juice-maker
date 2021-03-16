//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
  let juiceMaker = JuiceMaker()
  @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
  @IBOutlet weak var bananaJuiceOrderButton: UIButton!
  @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
  @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
  @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
  @IBOutlet weak var mangoJuiceOrderButton: UIButton!
  @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
  @IBOutlet weak var remainingStrawberryNumberLabel: UILabel!
  @IBOutlet weak var remainingBananaNumberLabel: UILabel!
  @IBOutlet weak var remainingKiwiNumberLabel: UILabel!
  @IBOutlet weak var remainingPineappleNumberLabel: UILabel!
  @IBOutlet weak var remainingMangoNumberLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    strawberryJuiceOrderButton.titleLabel?.textAlignment = .center
    bananaJuiceOrderButton.titleLabel?.textAlignment = .center
    kiwiJuiceOrderButton.titleLabel?.textAlignment = .center
    pineappleJuiceOrderButton.titleLabel?.textAlignment = .center
    strawberryBananaJuiceOrderButton.titleLabel?.textAlignment = .center
    mangoJuiceOrderButton.titleLabel?.textAlignment = .center
    mangoKiwiJuiceOrderButton.titleLabel?.textAlignment = .center

    do {
      remainingStrawberryNumberLabel.text = try String(
        Stock.shared.count(for: .strawberry))
      remainingBananaNumberLabel.text = try String(
        Stock.shared.count(for: .banana))
      remainingPineappleNumberLabel.text = try String(
        Stock.shared.count(for: .pineapple))
      remainingKiwiNumberLabel.text = try String(
        Stock.shared.count(for: .kiwi))
      remainingMangoNumberLabel.text = try String(
        Stock.shared.count(for: .mango))
    } catch {
      print("String 타입캐스팅에 실패하였습니다.")
    }
    // Do any additional setup after loading the view.
  }
  
  @IBAction func touchUpOrderButton(_ sender: UIButton) {
    do {
      switch sender {
      case strawberryJuiceOrderButton:
        juiceMaker.make(of: .strawberryJuice)
        remainingStrawberryNumberLabel.text = try String(
          Stock.shared.count(for: .strawberry))
      case bananaJuiceOrderButton:
        juiceMaker.make(of: .bananaJuice)
        remainingBananaNumberLabel.text = try String(
          Stock.shared.count(for: .banana))
      case kiwiJuiceOrderButton:
        juiceMaker.make(of: .kiwiJuice)
        remainingKiwiNumberLabel.text = try String(
          Stock.shared.count(for: .kiwi))
      case pineappleJuiceOrderButton:
        juiceMaker.make(of: .pineappleJuice)
        remainingPineappleNumberLabel.text = try String(
          Stock.shared.count(for: .pineapple))
      case strawberryBananaJuiceOrderButton:
        juiceMaker.make(of: .strawberryBananaJuice)
        remainingStrawberryNumberLabel.text = try String(
          Stock.shared.count(for: .strawberry))
        remainingBananaNumberLabel.text = try String(
          Stock.shared.count(for: .banana))
      case mangoJuiceOrderButton:
        juiceMaker.make(of: .mangoJuice)
        remainingMangoNumberLabel.text = try String(
          Stock.shared.count(for: .mango))
      case mangoKiwiJuiceOrderButton:
        juiceMaker.make(of: .mangoKiwiJuice)
        remainingMangoNumberLabel.text = try String(
          Stock.shared.count(for: .mango))
        remainingKiwiNumberLabel.text = try String(
          Stock.shared.count(for: .kiwi))
      default:
        print("듣도 보도 못한 버튼이군요..")
        informErrorLocation(functionName: #function)
      }
    } catch {
      print("String 타입캐스팅 실패")
    }
  }
}

