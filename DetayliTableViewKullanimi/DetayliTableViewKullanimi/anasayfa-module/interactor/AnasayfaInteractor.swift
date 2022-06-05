//
//  AnasayfaInteractor.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
 
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        //GET
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
                
        URLSession.shared.dataTask(with: url){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
                print(cevap)
                if let liste = cevap.yemekler {
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)

                }
             }catch{print(error.localizedDescription)}
        }.resume()
    }
}
 /*   func kisiAra(aramaKelimesi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_ad=\(aramaKelimesi)"
        istek.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                if let liste = cevap.kisiler {
                    self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                }
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    */
  /*  func kisiSil(kisi_id: Int) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_id=\(kisi_id)"
        istek.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
                    
            do{
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
                self.tumKisileriAl()
             }catch{print(error.localizedDescription)}
        }.resume()
    }*/

