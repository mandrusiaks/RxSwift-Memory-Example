//
//  SecondViewController.swift
//  RxSwift Memory
//
//  Created by Spencer Mandrusiak on 2018-02-01.
//  Copyright © 2018 Spencer Mandrusiak. All rights reserved.
//

import RxSwift
import UIKit

final class SecondViewController: UIViewController {

    deinit {
        print("\ndeinit \(self)")
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    
    private let disposeBag = DisposeBag()
    private let viewModel = SecondViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.count.asObservable()
            .map { "\($0)" }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)

        /*
         First launch the application and navigate to this controller then navigate back
         (optionally tap the increment button; it will work whether you do/don't tap it)

         Observe the resrouce count. Repeat a couple times.

         Next, uncomment the code below and repeat the steps above
         Notice how resource count now decreases and deinit is called
        */
        incrementButton.rx.tap
            .subscribe(onNext: {  //[unowned self] in
                self.viewModel.increment()
            })
            .disposed(by: disposeBag)
    }
}
