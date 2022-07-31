//
//  ViewController.swift
//  MiniApp69-RxSwift11
//
//  Created by 前田航汰 on 2022/07/31.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var badLabel: UILabel!
    @IBOutlet private weak var goodLabel: UILabel!
    @IBOutlet private weak var badButton: UIButton!
    @IBOutlet private weak var goodButton: UIButton!

    private let disposeBag = DisposeBag()

    var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel(
            badButtonObservable: badButton.rx.tap.asObservable(),
            goodButtonObservable: goodButton.rx.tap.asObservable()
        )

        viewModel?.badNumObservable
            .subscribe(onNext: { count in
                self.badLabel.text = String(count)
            })
            .disposed(by: disposeBag)

        viewModel?.goodNumObservable
            .subscribe(onNext: { count in
                self.goodLabel.text = String(count)
            })
            .disposed(by: disposeBag)


    }


}

