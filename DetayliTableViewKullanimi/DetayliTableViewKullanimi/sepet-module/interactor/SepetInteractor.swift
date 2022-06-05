//
//  SepetInteractor.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation

class SepetInteractor : PresenterToInteractorSepetProtocol {
 
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func tumYemekleriAl(kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "kullanici_adi=\(kullanici_adi)"
      //  let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(kullanici_adi)"

       /* let postString = "yemek_adi=\(yemek_adi)&yemek_resim_adi=\(yemek_resim_adi)&yemek_fiyat=\(yemek_fiyat)&yemek_siparis_adet=\(yemek_siparis_adet)&kullanici_adi=\(kullanici_adi)"*/
        istek.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(Sepet_YemeklerCevap.self, from: data!)
                print(cevap)
                if let liste = cevap.sepet_yemekler {
                    self.sepetPresenter?.presenteraVeriGonder(sepetYemeklerListe: liste)
                 //   print(liste)
                }
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
    
    
    func yemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")!)
        istek.httpMethod = "POST"
        let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
                    
            do{
                let cevap = try JSONSerialization.jsonObject(with: data!)
                //print(cevap)
                self.tumYemekleriAl(kullanici_adi: "Meltem")
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
    
}

