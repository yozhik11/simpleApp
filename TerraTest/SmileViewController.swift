//
//  SmileViewController.swift
//  TerraTest
//
//  Created by Natalia Shevaldina on 04.08.2022.
//

import UIKit

class SmileViewController: UIViewController {
        
    //MARK: - Variables
    lazy var closeButton: UIImageView = {
        let image = UIImageView(image: Constants.Images.closeButton)
        return image
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Smiles Calculator"
        return label
    }()
    
    lazy var smileLabel: UILabel = {
        let smile = UILabel()
        smile.text = Constants.SmileText.smileText
        smile.lineBreakMode = .byWordWrapping
        smile.numberOfLines = 0
        smile.textColor = .white
        smile.textAlignment = .center
        return smile
    }()
    
    lazy var addSmiles: UITextField = {
        let field = UITextField()
        field.placeholder = " Введите смайлы в виде   🤪🥸😉"
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        field.becomeFirstResponder()
        field.clearButtonMode = .whileEditing
        field.clearsOnBeginEditing = true
        field.returnKeyType = UIReturnKeyType.done
        field.delegate = self
        
        return field
    }()
    
    lazy var calcButton: UIButton = {
        let button = UIButton(primaryAction: UIAction( handler: { [weak self] _ in
            guard let self = self else { return }
            self.calcResult()
        }))
        button.layer.cornerRadius = 15
        button.backgroundColor = Constants.Colors.navyColor
        button.layer.borderWidth = 3.5
        button.layer.borderColor = Constants.Colors.whiteColorCG
        button.setTitle("Let's Calculate", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.alphaColor        
        setupAndConstraints()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeVCButtonTapped))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: - Functions
    
    @objc func closeVCButtonTapped(_ gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: view)
        guard let _ = closeButton.layer.presentation()?.frame.contains(tapLocation) else {return}
        self.dismiss(animated: true, completion: nil)
    }
    
    func calcResult() {
        guard let smiles = addSmiles.text else { return }
        var summ = 0
        smiles.forEach({
            switch $0 {
            case "🙂": summ += 1
            case "😂": summ += 2
            case "😘": summ += 3
            case "😁": summ += 4
            case "😎": summ += 5
            case "🤪": summ += 6
            case "🥸": summ += 7
            case "😉": summ += 8
            case "🥰": summ += 9
            default: print("0")
            }
        })
        showResult(summ)
    }
    
    func showResult(_ summ: Int) {
        calcButton.setTitle(String(summ), for: .normal)
    }
    
    //MARK: - Setup And Constraints
    private func setupAndConstraints() {
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(addSmiles)
        view.addSubview(smileLabel)
        view.addSubview(calcButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        smileLabel.translatesAutoresizingMaskIntoConstraints = false
        smileLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        smileLabel.heightAnchor.constraint(equalToConstant: 220).isActive = true
        smileLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        smileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addSmiles.translatesAutoresizingMaskIntoConstraints = false
        addSmiles.widthAnchor.constraint(equalToConstant: 300).isActive = true
        addSmiles.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addSmiles.topAnchor.constraint(equalTo: smileLabel.bottomAnchor, constant: 10).isActive = true
        addSmiles.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        calcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calcButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        calcButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        calcButton.topAnchor.constraint(equalTo: addSmiles.bottomAnchor,
                                             constant: 10).isActive = true
    }
}

extension SmileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
}
