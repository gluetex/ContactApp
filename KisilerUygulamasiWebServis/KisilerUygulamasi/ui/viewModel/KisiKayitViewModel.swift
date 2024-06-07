//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Emre Ertuğ on 14.05.2024.
//

import Foundation


class KisiKayitViewModel{
    var krepo = KisilerRepository() //her viewmodel'de repo nesnesi olacak ortak erişim için

    
    func kaydet(kisi_ad:String,kisi_tel:String){
        krepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
    
    
    
}
