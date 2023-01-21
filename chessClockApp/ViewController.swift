//
//  ViewController.swift
//  chessClockApp
//
//  Created by Fırat İlhan on 21.01.2023.
//

import UIKit

class ViewController: UIViewController {

    //Siyah Oyuncu
    @IBOutlet weak var saniyeLabelSiyah: UILabel!
    @IBOutlet weak var dakikaLabelSiyah: UILabel!
    @IBOutlet weak var saatLabelSiyah: UILabel!
    @IBOutlet weak var durdurLabel: UIButton!
    @IBOutlet weak var baslatLabel: UIButton!
    
    var zamanSiyah = Timer()
    var saniyeSiyah = 0
    var dakikaSiyah = 0
    var saatSiyah = 3
    
    //Beyaz Oyuncu
    @IBOutlet weak var saniyeLabelBeyaz: UILabel!
    @IBOutlet weak var dakikaLabelBeyaz: UILabel!
    @IBOutlet weak var saatLabelBeyaz: UILabel!
    
    var zamanBeyaz = Timer()
    var saniyeBeyaz = 0
    var dakikaBeyaz = 0
    var saatBeyaz = 3
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saniyeLabelSiyah.text = String(saniyeSiyah)
        dakikaLabelSiyah.text = String(dakikaSiyah)
        saatLabelSiyah.text = String(saatSiyah)
    
        durdurLabel.isHidden = true
        
        saniyeLabelBeyaz.text = String(saniyeBeyaz)
        dakikaLabelBeyaz.text = String(dakikaBeyaz)
        saatLabelBeyaz.text = String(saatBeyaz)
        
   
    }
    
    @IBAction func durdur(_ sender: Any) {
        baslatLabel.isHidden = false
        durdurLabel.isHidden = true
        
        zamanSiyah.invalidate()
        zamanBeyaz.invalidate()
        
    }
    

    @IBAction func baslat(_ sender: Any) {
        beyazZamanBaslat() // önce beyaz oyuncu başlar.
        
        baslatLabel.isHidden = true
        durdurLabel.isHidden = false
      
    }
    
    
    @IBAction func siyahOyuncu(_ sender: Any) {
        zamanSiyah.invalidate()
        beyazZamanBaslat()
        
    }
    
    @IBAction func beyazOyuncu(_ sender: Any) {
        zamanBeyaz.invalidate()
        siyahZamanBaslat()
    }
    
    
    func siyahZamanBaslat() {
        zamanSiyah = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(sayacFnkSiyah), userInfo: nil, repeats: true)
    }
    func beyazZamanBaslat() {
        zamanBeyaz = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(sayacFnkBeyaz), userInfo: nil, repeats: true)
    }
    
    
    @objc func sayacFnkSiyah() {
        saniyeSiyah -= 1
        saniyeLabelSiyah.text = String(saniyeSiyah)
        if saniyeSiyah == 0 {
            dakikaFonkSiyah()
        }
        if dakikaSiyah == 0  {
            saatFonkSiyah()
        }
        if saatSiyah == -1 {
            zamanSiyahSon()
        }
    }
    @objc func sayacFnkBeyaz() {
        saniyeBeyaz -= 1
        saniyeLabelBeyaz.text = String(saniyeBeyaz)
        if saniyeBeyaz == 0 {
            dakikaFonkBeyaz()
        }
        if dakikaBeyaz == 0  {
            saatFonkBeyaz()
        }
        if saatBeyaz == -1 {
            zamanBeyazSon()
        }
    }
    
    func dakikaFonkSiyah() {
        saniyeSiyah = 59
        saniyeLabelSiyah.text = String(saniyeSiyah)
        dakikaSiyah -= 1
        dakikaLabelSiyah.text = String(dakikaSiyah)
    }
    func dakikaFonkBeyaz() {
        saniyeBeyaz = 59
        saniyeLabelBeyaz.text = String(saniyeBeyaz)
        dakikaBeyaz -= 1
        dakikaLabelBeyaz.text = String(dakikaBeyaz)
    }
    
    func saatFonkSiyah() {
        saniyeSiyah = 59
        saniyeLabelSiyah.text = String(saniyeSiyah)
        dakikaSiyah = 59
        dakikaLabelSiyah.text  = String(dakikaSiyah)
        saatSiyah -= 1
        saatLabelSiyah.text = String(saatSiyah)
    }
    func saatFonkBeyaz() {
        saniyeBeyaz = 59
        saniyeLabelBeyaz.text = String(saniyeBeyaz)
        dakikaBeyaz = 59
        dakikaLabelBeyaz.text  = String(dakikaBeyaz)
        saatBeyaz -= 1
        saatLabelBeyaz.text = String(saatBeyaz)
    }
    func zamanSiyahSon() {
        saniyeSiyah = 0
        dakikaSiyah = 0
        saatSiyah = 0
        saniyeLabelSiyah.text = String(saniyeSiyah)
        dakikaLabelSiyah.text  = String(dakikaSiyah)
        saatLabelSiyah.text = String(saatSiyah)

        zamanSiyah.invalidate()
        makeAlert(titleInput: "Oyun Bitti", messageInput: "Beyaz Oyuncu Kazandı...")

    }
    func zamanBeyazSon() {
        saniyeBeyaz = 0
        dakikaBeyaz = 0
        saatBeyaz = 0
        saniyeLabelBeyaz.text = String(saniyeBeyaz)
        dakikaLabelBeyaz.text  = String(dakikaBeyaz)
        saatLabelBeyaz.text = String(saatBeyaz)

        zamanBeyaz.invalidate()
        makeAlert(titleInput: "Oyun Bitti", messageInput: "Siyah Oyuncu Kazandı...")
        
    }
    
    
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: .default) { (UIAlertAction) in
                        self.resetle() }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    func resetle() {
        saniyeSiyah = 0
        dakikaSiyah = 0
        saatSiyah = 3
        saniyeLabelSiyah.text = String(saniyeSiyah)
        dakikaLabelSiyah.text  = String(dakikaSiyah)
        saatLabelSiyah.text = String(saatSiyah)
        
        
        saniyeBeyaz = 0
        dakikaBeyaz = 0
        saatBeyaz = 3
        saniyeLabelBeyaz.text = String(saniyeBeyaz)
        dakikaLabelBeyaz.text  = String(dakikaBeyaz)
        saatLabelBeyaz.text = String(saatBeyaz)
        
        
        baslatLabel.isHidden = false
        durdurLabel.isHidden = true
        
    }
}

