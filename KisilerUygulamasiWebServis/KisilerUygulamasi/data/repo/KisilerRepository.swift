//
//  KisilerRepository.swift
//  KisilerUygulamasi
//
//  Created by Emre Ertuğ on 14.05.2024.
//

import Foundation
import RxSwift
import Alamofire

//COMMENTED ONES ARE URL SESSION-NATIVE IOS  -> NORMAL ONES ALAMOFIRE-OPENSOURCE
class KisilerRepository{
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        //        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!
        //
        //        var istek = URLRequest(url: url)
        //        istek.httpMethod = "POST"
        //        let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        //        istek.httpBody = postString.data(using: .utf8)
        //
        //        URLSession.shared.dataTask(with: istek){ data, response, error in
        //
        //            do{
        //
        //                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
        //
        //                print("Başarı: \(cevap.success!)")
        //                print("Message: \(cevap.message!)")
        //
        //
        //            }catch{
        //
        //                print(error.localizedDescription)
        //            }
        //
        //
        //
        //        }.resume()
        
        
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!
        
        let params:Parameters = ["kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        
        AF.request(url,method: .post, parameters: params).response{ response in
            
            if let data = response.data{
                
                do{
                    
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    
                    print("Başarı: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                    
                    
                }catch{
                    
                    print(error.localizedDescription)
                }
                
            }
            
            
        }
        
        
    }
    
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        //        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!
        //
        //        var istek = URLRequest(url: url)
        //        istek.httpMethod = "POST"
        //        let postString = "kisi_id=\(kisi_id)&kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        //        istek.httpBody = postString.data(using: .utf8)
        //
        //        URLSession.shared.dataTask(with: istek){ data, response, error in
        //
        //            do{
        //
        //                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
        //
        //                print("Başarı: \(cevap.success!)")
        //                print("Message: \(cevap.message!)")
        //
        //
        //            }catch{
        //
        //                print(error.localizedDescription)
        //            }
        //
        //
        //
        //        }.resume()
        
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!
        
        let params:Parameters = ["kisi_id":kisi_id,"kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        
        AF.request(url,method: .post, parameters: params).response{ response in
            
            if let data = response.data{
                
                do{
                    
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    
                    print("Başarı: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                    
                    
                }catch{
                    
                    print(error.localizedDescription)
                }
                
            }
            
            
        }
    }
    
    
    func ara(aramaKelimesi:String){
        
        //        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!
        //
        //        var istek = URLRequest(url: url)
        //        istek.httpMethod = "POST"
        //        let postString = "kisi_ad=\(aramaKelimesi)"
        //        istek.httpBody = postString.data(using: .utf8)
        //
        //        URLSession.shared.dataTask(with: istek){ data, response, error in
        //
        //            do{
        //
        //                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
        //
        //                if let liste = cevap.kisiler{
        //
        //                    self.kisilerListesi.onNext(liste)
        //
        //
        //                }
        //
        //            }catch{
        //
        //                print(error.localizedDescription)
        //            }
        //
        //
        //
        //        }.resume()
        
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!
        
        let params:Parameters = ["kisi_id":aramaKelimesi]
        
        AF.request(url,method: .post, parameters: params).response{ response in
            
            if let data = response.data{
                
                do{
                    
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    
                    if let liste = cevap.kisiler{
                        
                        self.kisilerListesi.onNext(liste)
                        
                        
                    }
                    
                }catch{
                    
                    print(error.localizedDescription)
                }
                
            }
            
            
        }
    }
        
        func kisiSil(kisi_id:Int){
            //        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!
            //
            //        var istek = URLRequest(url: url)
            //        istek.httpMethod = "POST"
            //        let postString = "kisi_id=\(kisi_id)"
            //        istek.httpBody = postString.data(using: .utf8)
            //
            //        URLSession.shared.dataTask(with: istek){ data, response, error in
            //
            //            do{
            //
            //                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
            //
            //                print("Başarı: \(cevap.success!)")
            //                print("Message: \(cevap.message!)")
            //
            //
            //            }catch{
            //
            //                print(error.localizedDescription)
            //            }
            //
            //
            //
            //        }.resume()
            
            
            let url = URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!
            
            let params:Parameters = ["kisi_id":kisi_id]
            
            AF.request(url,method: .post, parameters: params).response{ response in
                
                if let data = response.data{
                    
                    do{
                        
                        let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                        
                        print("Başarı: \(cevap.success!)")
                        print("Message: \(cevap.message!)")
                        
                        
                    }catch{
                        
                        print(error.localizedDescription)
                    }
                    
                }
                
                
            }
            
        }
        
        
    func kisileriYuke(){
        //kisilerListesi.onNext(liste)
        
        //
        //            let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        //
        //        URLSession.shared.dataTask(with: url){ data, response, error in
        //
        //            do{
        //
        //                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
        //
        //                if let liste = cevap.kisiler{
        //
        //                    self.kisilerListesi.onNext(liste)
        //
        //
        //                }
        //
        //            }catch{
        //
        //                print(error.localizedDescription)
        //            }
        //
        //
        //
        //        }.resume()
        
        
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        AF.request(url,method: .get).response{ response in
            
            if let data = response.data{
                
                do{
                    
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    
                    if let liste = cevap.kisiler{
                        
                        self.kisilerListesi.onNext(liste)
                        
                        
                    }
                    
                }catch{
                    
                    print(error.localizedDescription)
                }
                
                
            }
            
            
        }
        
        
    }
       
        
    }

