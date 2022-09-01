//
//  ViewController.swift
//  TerraTest
//
//  Created by Natalia Shevaldina on 03.08.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables
    var flag = false {
        didSet {
            self.backgroundButtonActive()
        }
    }
    
    var animator: UIViewPropertyAnimator!
    
    var flagImage = false {
        didSet {
            self.animateImageCorner()
        }
    }
        
    lazy var appleImage: UIImageView = {
        let image = UIImageView(image: Constants.Images.appleImage)
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 3.5
        image.layer.borderColor = Constants.Colors.whiteColorCG
        image.clipsToBounds = true
        return image
    }()
    
    lazy var tableOpenButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            let table = TableViewController()
            self?.navigationController?.pushViewController(table, animated: true)
        }))
        button.backgroundColor = Constants.Colors.oliveColor
        button.setTitle("Open Table", for: .normal)
        return button
    }()
    
    lazy var backgroundButton: UIButton = {
        let button = UIButton(primaryAction: UIAction( handler: { [weak self] _ in
            guard let self = self else { return }
            self.flag = !self.flag
        }))
        button.backgroundColor = Constants.Colors.navyColor
        button.setTitle("Change Background", for: .normal)
        return button
    }()
    
    lazy var animateImageButton: UIButton = {
        let button = UIButton(primaryAction: UIAction( handler: { [weak self] _ in
            guard let self = self else { return }
            self.flagImage = !self.flagImage
        }))
        button.backgroundColor = Constants.Colors.purpleColor
        button.setTitle("Image Corner Radius", for: .normal)
        return button
    }()
    
    lazy var calculatorButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            let smile = SmileViewController()
            smile.modalPresentationStyle = UIModalPresentationStyle.formSheet
            smile.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            smile.modalPresentationStyle = .overCurrentContext
            smile.preferredContentSize = CGSize(width: 300, height: 500)
            self?.present(SmileViewController(), animated: true, completion: nil)
        }))
        button.backgroundColor = Constants.Colors.blueColor
        button.setTitle("Smile Calculator", for: .normal)
        return button
    }()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        self.navigationItem.backButtonTitle = ""
    }
    
    //MARK: - Change background and Button color
    func backgroundButtonActive() {
            self.view.backgroundColor = self.flag ?
                UIColor(patternImage: Constants.Images.backgroundTwo) :
                UIColor(patternImage: Constants.Images.backgroundOne)
            self.backgroundButton.backgroundColor = self.flag ?
                Constants.Colors.greyColor :
                Constants.Colors.navyColor
    }
    
    //MARK: - Change image corner radius
    func animateImageCorner() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.appleImage.layer.cornerRadius = self.flagImage ? 120 : 20
        }
    }
    
    //MARK: - Setup and Constraints
    func setupViews() {
        view.backgroundColor = UIColor(patternImage: Constants.Images.backgroundOne)
        view.addSubview(appleImage)
        view.addSubview(backgroundButton)
        view.addSubview(calculatorButton)
        view.addSubview(tableOpenButton)
        view.addSubview(animateImageButton)
    }
    
    func setupConstraints() {
        appleImage.translatesAutoresizingMaskIntoConstraints = false
        appleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appleImage.topAnchor.constraint(equalTo: view.topAnchor,
                                        constant: 100).isActive = true
        
        setupConstraintToButton(tableOpenButton, topButton: appleImage)
        setupConstraintToButton(backgroundButton, topButton: tableOpenButton)
        setupConstraintToButton(animateImageButton, topButton: backgroundButton)
        setupConstraintToButton(calculatorButton, topButton: animateImageButton)
    }
    
    func setupConstraintToButton(_ button: UIButton, topButton: AnyObject) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.topAnchor.constraint(equalTo: topButton.bottomAnchor,
                                             constant: 30).isActive = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 3.5
        button.layer.borderColor = Constants.Colors.whiteColorCG
        button.setTitleColor(.white, for: .normal)
    }
}
