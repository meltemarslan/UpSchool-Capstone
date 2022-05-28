//
//  Sepet_Yemekler.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import Foundation

class Sepet_Yemekler : Codable {
    var sepet_yemek_id : String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_sipariş_adet:String?
    var yemek_fiyat:String?
    var kullanici_adi:String?
    
    init(sepet_yemek_id : String, yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String,yemek_sipariş_adet:String, kullanici_adi:String){
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_sipariş_adet = yemek_sipariş_adet
        self.kullanici_adi = kullanici_adi
        
    }
}
