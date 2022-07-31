//
//  ViewModel.swift
//  MiniApp69-RxSwift11
//
//  Created by 前田航汰 on 2022/07/31.
//

import Foundation
import RxCocoa
import RxSwift

class ViewModel {

    var badNumObservable = PublishSubject<Int>()
    var goodNumObservable = PublishSubject<Int>()
    var badNum = 0
    private var goodNum = 0
    private let disposeBag = DisposeBag()

    init(badButtonObservable: Observable<Void>, goodButtonObservable: Observable<Void>){

        badButtonObservable
            .subscribe(onNext: { [weak self] in
                self?.badNum += 1
                self?.badNumObservable.onNext(self?.badNum ?? 0)
            })
            .disposed(by: disposeBag)

        goodButtonObservable.asObservable()
            .subscribe(onNext: { [weak self] in
                self?.goodNum += 1
                self?.goodNumObservable.onNext(self?.goodNum ?? 0)
            })
            .disposed(by: disposeBag)
    }
}
