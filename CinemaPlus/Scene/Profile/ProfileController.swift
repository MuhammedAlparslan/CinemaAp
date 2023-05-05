//
//  ProfileController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 30.04.2023.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet private weak var profileTableiew: UITableView!
    
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = "Profile"
    }
}


extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        cell.configure(data: viewModel.profileData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let controller = storyboard?.instantiateViewController(identifier: "LanguageController") as! LanguageController
            navigationController?.show(controller, sender: nil)        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
    
