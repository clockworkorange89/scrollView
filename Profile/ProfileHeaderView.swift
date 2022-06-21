//
//  ProfileHeaderView.swift
//  Profile
//
//  Created by Алексей Маяков on 04.06.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    // Создание UI элементов
   
    
    
    private var  statusText  = ""
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "morty")
        imageView.alpha = 1
        return imageView
    }()
    
    
        private lazy var headerLabelView: UILabel = {
            let headerView = UILabel()
            headerView.text = "   Evil Morty"
            headerView.font = .boldSystemFont(ofSize: 18)
            headerView.textColor = .black
            headerView.translatesAutoresizingMaskIntoConstraints = false
            return headerView
        }()
    
    private lazy var uiBotton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .systemIndigo
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.cornerRadius = 15
        setStatusButton.backgroundColor = .blue
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Show Status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        return setStatusButton
    }()

    private lazy var SetTextView: UITextField = {
    let statusTextField = UITextField()
     statusTextField.text = "aaaaaas"
     statusTextField.layer.cornerRadius = 12
     statusTextField.font = UIFont(name: "regular", size: 15)
     statusTextField.layer.borderWidth = 1
     statusTextField.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
     statusTextField.translatesAutoresizingMaskIntoConstraints = false
    statusTextField.leftViewMode = .always
    statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    return  statusTextField
    }()
  
    private lazy var uiLabelStatus: UILabel = {
        let statusTextLabel = UILabel()
        statusTextLabel.text = "Waiting for something..."
        statusTextLabel.font = UIFont(name: "regular", size: 14)
        statusTextLabel.textColor = .gray
        statusTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return  statusTextLabel
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.pushButton()
    }
    


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func pushButton(){
       
        uiBotton.addTarget(self, action: #selector(doOnButton), for: .touchUpInside)
        
    }
    
    
   private func  setupView(){
    // Добавление элементов во view
        self.addSubview(self.avatarImageView)
    self.addSubview(self.headerLabelView)
    self.addSubview(self.uiBotton)
    self.addSubview(self.uiLabelStatus)
    self.addSubview(self.SetTextView)
    // Создаём расположение для ui  элементов
    NSLayoutConstraint.activate([
        //Расположение картинки
        self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
        self.avatarImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
        self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),
        
       //Расположение верхнего лэйбла
        self.headerLabelView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11),
        self.headerLabelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),  
        self.headerLabelView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 0 ),
        self.headerLabelView.widthAnchor.constraint(equalToConstant: 265),
        self.headerLabelView.heightAnchor.constraint(equalToConstant: 20),
        
        //Расположение кнопки
    
       self.uiBotton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant:16 ),
        self.uiBotton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        self.uiBotton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16 ),
       self.uiBotton.widthAnchor.constraint(equalToConstant: 260),
        self.uiBotton.heightAnchor.constraint(equalToConstant: 50),
        
        // Расположение  второго лэйбла
        
       
       self.uiLabelStatus.bottomAnchor.constraint(equalTo: uiBotton.topAnchor, constant:-34),
        self.uiLabelStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
       self.uiLabelStatus.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
        self.uiLabelStatus.widthAnchor.constraint(equalToConstant: 265),
         self.uiLabelStatus.heightAnchor.constraint(equalToConstant: 40),
         // расположение text view
        
        self.SetTextView.topAnchor.constraint(equalTo: uiLabelStatus.topAnchor, constant:30),
        self.SetTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
       self.SetTextView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
         self.SetTextView.widthAnchor.constraint(equalToConstant: 200),
          self.SetTextView.heightAnchor.constraint(equalToConstant: 40),
        
                                    ])
    
    
    
    
    }
    // Добавьте обработку нажатия по кнопке addTarget, UIEvent выбрать .touchUpInside. Добавьте функцию, которую будет принимать обработчик, например, @objc func buttonPressed()
    @objc func doOnButton(){
        print(uiLabelStatus.text!)
        uiLabelStatus.text = SetTextView.text
            }
    //Добавьте обработку изменения введенного текста при помощи addTarget, UIEvent выбрать .editingChanged. Добавьте функцию, которую будет принимать обработчик, например, @objc func statusTextChanged(_ textField: UITextField).
   
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? "empty"
        print("Переменная: \(statusText)")
        
    }
    
    
}


