//
//  ViewController.swift
//  AcessibidadeEstudo
//
//  Created by Paulo Gutemberg de Sousa Cavalcante on 17/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = PrimeiraView()
        primeiraView.delegate = self
        view = primeiraView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueParaSegundaView" {
            if let viewController = segue.destination as? SegundaViewController {
                viewController.delegateFechar = self
            }
        }

    }
}

extension ViewController: PrimeiraViewDelegate {
    func pressionadoAgoraNao() {
        print("Agora nao")
    }
    
    func pressionadoAgoraSim() {
        print("Agora sim")
        performSegue(withIdentifier: "segueParaSegundaView", sender: nil)
    }
    
    func pressionadoEsperaUmPouco() {
        print("Espera um pouco")
    }
    
    func pressionadoAmanhaVai() {
        print("Amanha vai")
    }
    
    
}

extension ViewController: SegundaViewControllerProtocol {
    func fecharPressionado() {
        print("fechado")
        guard let view = self.view as? PrimeiraView else {
            return
        }
        UIAccessibility.post(notification: .layoutChanged, argument: view.botaoAgoraSim)
    }
}
