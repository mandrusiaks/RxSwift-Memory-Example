//
//  ViewController.swift
//  RxSwift Memory
//
//  Created by Spencer Mandrusiak on 2018-02-01.
//  Copyright © 2018 Spencer Mandrusiak. All rights reserved.
//

import RxSwift
import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    private let disposeBag = DisposeBag()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.rx.text.orEmpty
            .bind(to: viewModel.text)
            .disposed(by: disposeBag)

        viewModel.text.asObservable()
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
}

