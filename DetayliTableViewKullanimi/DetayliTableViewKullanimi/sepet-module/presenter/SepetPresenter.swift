//
//  SepetPresenter.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?

    
    func sepetyemekleriYukle(kullanici_adi: String) {
        sepetInteractor?.tumYemekleriAl(kullanici_adi: kullanici_adi)
    }
    
    func sil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}
    
  /*  func ara(aramaKelimesi: String) {
        anasayfaInteractor?.kisiAra(aramaKelimesi: aramaKelimesi)
    }*/
    
  /*  func sil(kisi_id: Int) {
        anasayfaInteractor?.kisiSil(kisi_id: kisi_id)
    }
}*/


extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetYemeklerListe: Array<Sepet_Yemekler>) {
        sepetView?.vieweVeriGonder(sepetYemeklerListe: sepetYemeklerListe)
    }
}
