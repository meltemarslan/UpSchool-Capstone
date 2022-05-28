//
//  SepetVC.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import UIKit

class SepetVC: UIViewController {

    @IBOutlet weak var sepetYemeklerTableView: UITableView!
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    var sepetYemeklerListe = [Sepet_Yemekler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sepetPresenterNesnesi?.sepetyemekleriYukle(kullanici_adi:"Meltem")
        
        SepetRouter.createModule(ref: self)
        sepetYemeklerTableView.delegate = self
        sepetYemeklerTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)

        
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetyemekleriYukle(kullanici_adi: "Meltem")
    }
}

extension SepetVC : PresenterToViewSepetProtocol {
    
    func vieweVeriGonder(sepetYemeklerListe: Array<Sepet_Yemekler>) {
        self.sepetYemeklerListe = sepetYemeklerListe
        DispatchQueue.main.async {
            self.sepetYemeklerTableView.reloadData()
        }
    }
}
    extension SepetVC : UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sepetYemeklerListe.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let yemek = sepetYemeklerListe[indexPath.row]
            
            let hucre = tableView.dequeueReusableCell(withIdentifier: "cartHucre", for: indexPath) as! SepetTableViewCell
            
            hucre.yemekAdLabel.text = yemek.yemek_adi
            hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
            hucre.yemekResimImageView.image = UIImage(named: yemek.yemek_resim_adi!)
            hucre.yemekAdetLabel.text = "Adet: \(yemek.yemek_sipariş_adet!)"
            
            
            return hucre
        }
        /*
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let yemek = yemeklerListe[indexPath.row]
            performSegue(withIdentifier: "toDetay", sender: yemek)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        */
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
                let sepet = self.sepetYemeklerListe[indexPath.row]
                
                let alert = UIAlertController(title: "Silme İşlemi", message: "\(sepet.yemek_adi!) silinsin mi?", preferredStyle: .alert)
                let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
                alert.addAction(iptalAction)
                
                let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                    self.sepetPresenterNesnesi?.sil(sepet_yemek_id: Int(sepet.sepet_yemek_id!)!, kullanici_adi: sepet.kullanici_adi!)
                }
                alert.addAction(evetAction)
                self.present(alert, animated: true)
            }
            
            return UISwipeActionsConfiguration(actions: [silAction])
        }
         
    }
    
    
    
    
    
    


