//
//  HomeViewModel.swift
//  CovidRx
//
//  Created by Chris Ferdian on 11/06/20.
//  Copyright © 2020 Chrizers. All rights reserved.
//

import RxSwift
import RxCocoa

class HomeViewModel: NSObject {
    let dispose = DisposeBag()
    let countries: BehaviorRelay<[Country]> = BehaviorRelay(value: [])

//    func fetch(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
}
