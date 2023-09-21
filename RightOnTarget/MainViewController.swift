//
//  MainViewController.swift
//  Right on target
//
//  Created by Admin on 05.11.2020.
//

import UIKit

class MainViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("loadVied")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    

    // MARK: - Переходы
    
    @IBAction func previousScreen( unwindSegue: UIStoryboardSegue ) {
        return
    }

}
