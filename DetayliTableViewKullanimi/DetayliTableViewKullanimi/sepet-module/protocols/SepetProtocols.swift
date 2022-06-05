//
//  SepetProtocols.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation

//view -> Presenter -> Interaction

//Ana Protokoller

protocol ViewToPresenterSepetProtocol {
    
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    func sepetyemekleriYukle(kullanici_adi:String)
 //   func ara(aramaKelimesi:String)
    func sil(sepet_yemek_id:Int, kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    func tumYemekleriAl(kullanici_adi:String)
   // func yemekAra(aramaKelimesi:String)
    func yemekSil(sepet_yemek_id:Int, kullanici_adi:String)
}
//Taşıyıcı Protocoller
protocol InteractorToPresenterSepetProtocol {
    
    func presenteraVeriGonder(sepetYemeklerListe:Array<Sepet_Yemekler>)
}
protocol PresenterToViewSepetProtocol {
    
    func vieweVeriGonder(sepetYemeklerListe:Array<Sepet_Yemekler>)
}
protocol PresenterToRouterSepetProtocol{
    static func
        createModule(ref:SepetVC)
}



