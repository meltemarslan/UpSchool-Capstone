//
//  Protocols.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 27.05.2022.
//

import Foundation

//Ana protocoller
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriYukle()  //tumUrunleriAl
   // func ara(aramaKelimesi:String)
    //func sil(kisi_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriAl()
   // func kisiAra(aramaKelimesi:String)
    //func kisiSil(kisi_id:Int)
}

//Taşıyıcı protocoller
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
}

//Router protocol
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:ViewController)
}
