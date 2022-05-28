//
//  ViewController.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 27.05.2022.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    
    var yemeklerListe = [Yemekler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
        AnasayfaRouter.createModule(ref: self)
}
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yemek = yemek
            }
        }
    }
}
extension ViewController : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.urunlerTableView.reloadData()
            
        }
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunHucre", for: indexPath) as! UrunTableViewCell
        
      //  hucre.urunAdLabel.text = "\(yemek.yemek_adi!)"
       // hucre.urunFiyatLabel.text = "\(yemek.yemek_fiyat!)"
        //hucre.urunResimImageView
        
        
        hucre.urunAdLabel.text = yemek.yemek_adi
        hucre.urunFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        hucre.urunResimImageView.kf.setImage(with: url)
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        //hucre.hucreArkaplan.layer.cornerRadius = 10.0
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}










/****/

/*

extension ViewController : UITableViewDelegate, UITableViewDataSource, HucreProtocol {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListe.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunHucre", for: indexPath) as! UrunTableViewCell
        
        cell.urunResimImageView.image = UIImage(named: urun.urun_resim_ad!)
        cell.urunAdLabel.text = urun.urun_ad
        cell.urunFiyatLabel.text = "\(urun.urun_fiyat!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
                
      //  cell.hucreArkaPlan.layer.cornerRadius = 10.0
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let urun = urunlerListe[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            (action,view,void) in
            print("\(urun.urun_ad!) silindi")
        
        }
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            (action,view,void) in
            print("\(urun.urun_ad!) düzenlendi")
        
        }
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
        
        func buttonTiklandi(indexPath: IndexPath) {
            let urun = urunlerListe[indexPath.row]
            print("\(urun.urun_ad!) sepete ekle")
        }
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let urun = urunlerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let urun = sender as? Urunler
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.urun = urun
        }
            
    }
        
    }
    






//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Kasım Adalan on 17.04.2022.
//

import UIKit

class AnasayfaVC: UIViewController{
    
    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var kisilerListe = [Kisiler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.kisileriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetayVC
                gidilecekVC.kisi = kisi
            }
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisilerListesi: Array<Kisiler>) {
        self.kisilerListe = kisilerListesi
        DispatchQueue.main.async {
            self.kisilerTableView.reloadData()
        }
    }
}

extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre", for: indexPath) as! TableViewHucre
        
        hucre.kisiBilgiLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let kisi = self.kisilerListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(kisi_id: Int(kisi.kisi_id!)!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
*/
