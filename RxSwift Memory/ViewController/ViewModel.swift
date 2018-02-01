//
//  ViewModel.swift
//  RxSwift Memory
//
//  Created by Spencer Mandrusiak on 2018-02-01.
//  Copyright © 2018 Spencer Mandrusiak. All rights reserved.
//

import RxCocoa

struct ViewModel {
    let text: BehaviorRelay<String>

    init() {
        text = BehaviorRelay(value: "")
    }
}
