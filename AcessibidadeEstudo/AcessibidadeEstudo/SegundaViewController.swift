//
//  SegundaViewController.swift
//  AcessibidadeEstudo
//
//  Created by Paulo Gutemberg de Sousa Cavalcante on 18/10/21.
//

import UIKit

protocol SegundaViewControllerProtocol {
    func fecharPressionado()
}

class SegundaViewController: UIViewController {

    @IBOutlet weak var voltarBotao: UIButton!
    var delegateFechar: SegundaViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func VoltarPressionado(_ sender: Any) {
        dismiss(animated: true) {
            self.delegateFechar?.fecharPressionado()
        }
    }
}
