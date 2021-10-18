//
//  PrimeiraView.swift
//  AcessibidadeEstudo
//
//  Created by Paulo Gutemberg de Sousa Cavalcante on 17/10/21.
//

import UIKit
import SnapKit

protocol PrimeiraViewDelegate {
    func pressionadoAgoraNao()
    func pressionadoAgoraSim()
    func pressionadoEsperaUmPouco()
    func pressionadoAmanhaVai()
}


class PrimeiraView: UIView {
    
    var botaoAgoraNao: UIButton
    var botaoAgoraSim: UIButton
    var botaoEsperaUmPouco: UIButton
    var botaoAmanhaVai: UIButton
    
    var delegate: PrimeiraViewDelegate?
    
    override init(frame: CGRect) {
        self.botaoAgoraNao = UIButton()
        self.botaoAgoraSim = UIButton()
        self.botaoEsperaUmPouco = UIButton()
        self.botaoAmanhaVai = UIButton()
        super.init(frame: frame)
        setupView()
        addSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemGreen
        
        botaoAgoraNao.setTitle("Agora nao", for: .normal)
        botaoAgoraNao.backgroundColor = .systemRed
        botaoAgoraNao.layer.cornerRadius = 8
        botaoAgoraNao.addTarget(self, action: #selector(agoraNao), for: .touchUpInside)
        
        botaoAgoraSim.setTitle("Agora sim", for: .normal)
        botaoAgoraSim.backgroundColor = .systemBlue
        botaoAgoraSim.layer.cornerRadius = 8
        botaoAgoraSim.addTarget(self, action: #selector(agoraSim), for: .touchUpInside)
        
        botaoEsperaUmPouco.setTitle("Espera um pouco", for: .normal)
        botaoEsperaUmPouco.backgroundColor = .systemYellow
        botaoEsperaUmPouco.layer.cornerRadius = 8
        botaoEsperaUmPouco.addTarget(self, action: #selector(esperaUmPouco), for: .touchUpInside)
        
        botaoAmanhaVai.setTitle("Amanha vai", for: .normal)
        botaoAmanhaVai.backgroundColor = .systemGray2
        botaoAmanhaVai.layer.cornerRadius = 8
        botaoAmanhaVai.addTarget(self, action: #selector(amanhaVai), for: .touchUpInside)
    }
    
    func addSubview(){
        addSubview(botaoAgoraNao)
        addSubview(botaoAgoraSim)
        addSubview(botaoEsperaUmPouco)
        addSubview(botaoAmanhaVai)
    }
    
    func configureLayout() {
        botaoAgoraNao.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        botaoAgoraSim.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(botaoAgoraNao.snp.bottom).offset(16)
        }
        
        botaoEsperaUmPouco.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(botaoAgoraSim.snp.bottom).offset(16)
        }
        
        botaoAmanhaVai.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(botaoEsperaUmPouco.snp.bottom).offset(16)
        }
    }
    
    @objc func agoraNao() {
        delegate?.pressionadoAgoraNao()
    }
    
    @objc func agoraSim() {
        delegate?.pressionadoAgoraSim()
    }
    
    @objc func esperaUmPouco() {
        delegate?.pressionadoEsperaUmPouco()
    }
    
    @objc func amanhaVai() {
        delegate?.pressionadoAmanhaVai()
    }
}
