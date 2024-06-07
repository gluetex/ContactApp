//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Emre Ertuğ on 14.05.2024.
//

import Foundation
import RxSwift


class AnasayfaViewModel{
    
    var krepo = KisilerRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())

    init(){
        kisilerListesi = krepo.kisilerListesi //Repo ile bağlantı kişiler için 
        
    }
    
    func ara(aramaKelimesi:String){
        
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisiSil(kisi_id:Int){
        krepo.kisiSil(kisi_id: kisi_id)
        kisileriYuke()
    }
    
    
    func kisileriYuke(){
        

        krepo.kisileriYuke()
        
    }

}
