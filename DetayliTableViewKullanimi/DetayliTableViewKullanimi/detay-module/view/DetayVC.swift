//
//  DetayVC.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 27.05.2022.
//

import UIKit

class DetayVC: UIViewController {

  
    
 //   @IBOutlet weak var urunAd: UILabel!
    @IBOutlet weak var urunResim: UIImageView!
    @IBOutlet weak var urunFiyat: UILabel!
    
    var yemek: Yemekler?
    //var sepetUrunler : Sepet_Urunler?
    var DetayPresenterNesnesi:ViewToPresenterDetayProtocol?

    
    @IBOutlet weak var labelStepper: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  navigationController?.navigationBar.topItem?.title = ""
        if let u = yemek {
            self.navigationItem.title = u.yemek_adi
            urunResim.image = UIImage(named: u.yemek_resim_adi!)
           // urunFiyat.text = "\(u.yemek_fiyat!) ₺"
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(u.yemek_resim_adi!)")
            urunResim.kf.setImage(with: url)
        
        }
        DetayRouter.createModule(ref: self)
    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        
        if let u = yemek {
            DetayPresenterNesnesi?.ekle(yemek_adi: u.yemek_adi!,  yemek_resim_adi: u.yemek_resim_adi!,  yemek_fiyat: Int(u.yemek_fiyat!)!,  yemek_siparis_adet: Int(labelStepper.text!)!, kullanici_ad: "Meltem")
        }
    }
    
    @IBAction func stepperDegisimKontrol(_ sender: UIStepper) {
        labelStepper.text = String(Int(sender.value))
        
    }
    
    
    
}
