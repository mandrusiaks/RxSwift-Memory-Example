//
//  SecondViewModel.swift
//  RxSwift Memory
//
//  Created by Spencer Mandrusiak on 2018-02-01.
//  Copyright © 2018 Spencer Mandrusiak. All rights reserved.
//

import RxCocoa

struct SecondViewModel {

    let count: BehaviorRelay<Int>

    init() {
        count = BehaviorRelay(value: 0)
    }

    func increment() {
        count.accept(count.value + 1)
    }
}
