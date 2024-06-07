//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Emre Ertuğ on 5.05.2024.
//

import UIKit

class Anasayfa: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerList = [Kisiler]()
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        
        _ = viewModel.kisilerListesi.subscribe(onNext: { liste in
            
            self.kisilerList = liste
            DispatchQueue.main.async(){ //Async çalışması için
                
                self.kisilerTableView.reloadData()

            }
            
            
            
        })

    }

    override func viewWillAppear(_ animated: Bool) {
        
        viewModel.kisileriYuke()
        //Bu sayfaya dönüldüğünde veriler yüklenmiş olacak
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
}

extension Anasayfa : UISearchBarDelegate  {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        let kisi = kisilerList[indexPath.row]
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let kisi = kisilerList[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ contexualAction, view, bool in
            
            let kisi = self.kisilerList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "\(kisi.kisi_ad!) Will be deleted", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Yes", style: .destructive){ _ in
                
                self.viewModel.kisiSil(kisi_id: Int(kisi.kisi_id!)!)
            }
            
            alert.addAction(deleteAction)
            
            self.present(alert, animated: true)
        }
    
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    
}
