//
//  DetayRouter.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        ref.DetayPresenterNesnesi = DetayPresenter()
        ref.DetayPresenterNesnesi?.DetayInteractor = DetayInteractor()
    }
}

