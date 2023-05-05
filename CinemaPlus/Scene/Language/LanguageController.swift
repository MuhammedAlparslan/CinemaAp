//
//  LanguageController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 30.04.2023.
//

import UIKit

class LanguageController: UIViewController {
    @IBOutlet private weak var languageTableView: UITableView!
    
    let viewModel = LanguageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        navigationItem.title = "Language"
    }
    
    func changeLanguage(language: String) {
        UserDefaults.standard.set(language, forKey: "appLang")
        changeLanguageData(message: "Language changed to \(language)")
    }
    
    func changeLanguageData(message: String) {
        let alertController = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
}
    
extension LanguageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.languageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell") as! LanguageCell
        cell.configureData(data: viewModel.languageData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            changeLanguage(language: "az")
        }
        if indexPath.row == 1 {
            changeLanguage(language: "he")
        }
        if indexPath.row == 2 {
            changeLanguage(language: "tr")
        }
        if indexPath.row == 3 {
            changeLanguage(language: "ru")
        }
        if indexPath.row == 4 {
            changeLanguage(language: "en")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
