//
//  HomeViewController.swift
//  CovidRx
//
//  Created by Chris Ferdian on 10/06/20.
//  Copyright © 2020 Chrizers. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    let apiClint = APIClient()
    let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let obsSummary: Observable<SummaryResponse> = apiClint.send(apiRequest: APIRequest.summary)
        obsSummary.subscribe(onNext: { (response) in
            print(response.countries?.count)
        }).disposed(by: dispose)
    }
}
