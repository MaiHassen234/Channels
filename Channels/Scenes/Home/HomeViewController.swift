//
//  HomeViewController.swift
//  Channels
//
//  Created by Mai hassen on 3/23/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: HomeViewProtocol {
    
}
