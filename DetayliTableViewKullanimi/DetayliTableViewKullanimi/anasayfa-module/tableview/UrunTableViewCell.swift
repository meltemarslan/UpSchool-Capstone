//
//  UrunTableViewCell.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 27.05.2022.
//

import UIKit

/*protocol HucreProtocol{ // çatı - amaç view controllerda kullanmak
    func buttonTiklandi(indexPath:IndexPath) // parametre oluşturma (küçük i)
}*/
class UrunTableViewCell: UITableViewCell {

    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunResimImageView: UIImageView!
   
    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var sepeteEkleButon: UIButton!
    
    @IBOutlet weak var hucreArkaplan: UIView!
    //   var hucreProtocol:HucreProtocol?
  //  var indexPath:IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
/*
    @IBAction func sepeteEkleButton(_ sender: Any) { // ben bu butonu nerde çalıştırıcam
       print("button tıklandı")
       hucreProtocol?.buttonTiklandi(indexPath: indexPath!)
    }
 */
}
