//
//  AnasayfaPresenter.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
 
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?

    
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
}
    
  /*  func ara(aramaKelimesi: String) {
        anasayfaInteractor?.kisiAra(aramaKelimesi: aramaKelimesi)
    }*/
    
  /*  func sil(kisi_id: Int) {
        anasayfaInteractor?.kisiSil(kisi_id: kisi_id)
    }
}*/


extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
