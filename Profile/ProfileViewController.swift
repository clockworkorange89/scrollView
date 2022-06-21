


import UIKit


class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView =  ProfileHeaderView()
        profileHeaderView.backgroundColor = .systemGray
        // Задать размер view что бы он был равен корневому viev
        profileHeaderView.frame = CGRect(x: 0,y: 0,width: view.bounds.width, height: view.bounds.height)
        //Обнулять констрэйты, нужно использовать при верстке кодом обезательно!
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        //profileHeaderView.alpha = 0.5
        return profileHeaderView
        
    }()

    
    
    override func viewDidLoad() {
        //как отключить navigation bar сверху
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Profile"
        self.view.addSubview(profileHeaderView)
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.profileHeaderView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
        ])
    }
  
}


