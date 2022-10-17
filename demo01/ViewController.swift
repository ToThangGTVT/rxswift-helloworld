//
//  ViewController.swift
//  demo01
//
//  Created by ToThang on 10/17/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    var viewModel = ViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.rx.text.asDriver().drive(onNext: { [weak self] val in
            self?.viewModel.handle(inp: self?.inputField.text ?? "")
        }).disposed(by: disposeBag)
        
        self.viewModel.inputSequence.subscribe{ [weak self] event in
            self?.lblResult.text = event.element
        }.disposed(by: disposeBag)
    }
}

