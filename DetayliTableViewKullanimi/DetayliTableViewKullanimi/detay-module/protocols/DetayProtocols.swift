//
//  DetayRouter.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation



protocol ViewToPresenterDetayProtocol {
    var DetayInteractor:PresenterToInteractorDetayProtocol? {get set}
    
    func ekle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:Int, yemek_siparis_adet:Int, kullanici_ad:String)
    
}

protocol PresenterToInteractorDetayProtocol {
    func sepeteEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:Int, yemek_siparis_adet:Int, kullanici_ad:String)
    
}

protocol PresenterToRouterDetayProtocol {
    static func createModule(ref:DetayVC)
}
