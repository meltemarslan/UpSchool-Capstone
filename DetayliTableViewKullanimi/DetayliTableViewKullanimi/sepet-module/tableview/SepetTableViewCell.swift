//
//  SepetTableViewCell.swift
//  DetayliTableViewKullanimi
//
//  Created by Meltem Arslan on 28.05.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

  /*  @IBOutlet weak var yemekResimImageView: UIImageView!

    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekAdetLabel: UILabel!
    
    @IBOutlet weak var hucreArkaplan: UIView!*/
    
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    @IBOutlet weak var yemekResimImageView: UIImageView!
    
    @IBOutlet weak var yemekAdetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
