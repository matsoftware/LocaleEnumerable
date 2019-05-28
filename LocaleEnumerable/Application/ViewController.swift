//
//  ViewController.swift
//  LocaleEnumerable
//
//  Created by Mattia Campolese on 23/04/2018.
//  Copyright © 2018 Mattia Campolese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnShowRandomText: UIButton!
    
    // Actions
    @IBAction func showRandomText(_ sender: Any) {
        displayRandomTextAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localizeText()
    }
    
    private func localizeText() {
        lblTitle.text = LocalizedText<LocaleKey>(.app_viewcontroller_title).text
        lblSubTitle.text = LocalizedText<LocaleKey>(.app_viewcontroller_subtitle).text
        btnShowRandomText.setTitle(LocalizedText<LocaleKey>(.app_viewcontroller_cta).text, for: .normal)
    }
    
    private func displayRandomTextAlert() {
        arc4random_stir()
        let elementIndex = Int(arc4random_uniform(4))
        let localeKey = LocaleKey.allCases.first {
            $0.rawValue.hasSuffix("\(elementIndex)")
        } ?? .app_randomtext_1
        showAlert(with: LocalizedText<LocaleKey>(localeKey).text)
    }
    
    private func showAlert(with localizedRandomText: String) {
        let alert = UIAlertController(title: LocalizedText<LocaleKey>(.app_randomtext_title).text,
                                      message: localizedRandomText,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
