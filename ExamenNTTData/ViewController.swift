//
//  ViewController.swift
//  ExamenNTTData
//
//  Created by Guillermo Matos on 12/09/23.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    
    let viewmodel = UsuarioViewModel()
    var usuario: Usuario?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadUser()
        
    }
    
    func loadUser() {
        self.viewmodel.getUsuario { user in
            self.usuario = user
            DispatchQueue.main.async {
                self.userData()
            }
        }
    }
    
    func userData() {
        self.nameLabel.text = self.usuario?.results?[0].name?.first
        self.emailLabel.text = self.usuario?.results?[0].email
        self.addressLabel.text = self.usuario?.results?[0].location?.street?.name
        self.dateLabel.text = self.usuario?.results?[0].dob?.date
        self.phoneLabel.text = self.usuario?.results?[0].cell
        self.passwordLabel.text = self.usuario?.results?[0].login?.password
        self.imagen.load(url: URL(string: (self.usuario?.results?[0].picture?.medium)!)!)
    }


    @IBAction func refreshAction(_ sender: UIButton) {
        
        loadUser()

    }
    
}






