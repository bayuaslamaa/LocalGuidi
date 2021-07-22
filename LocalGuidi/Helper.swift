//
//  Helper.swift
//  LocalGuidi
//
//  Created by Bayu Aslama  on 21/07/21.
//

import Foundation


class Helper{
    static let shared = Helper()
    
    func getProvince(_ provinceCode: Int?) -> String{
        switch provinceCode {
        case 1:
         return "Bali"
       case 2:
          return "Bangka Belitung"
       case 3:
           return "Banten"
       case 4:
           return "Bengkulu"
        case 5:
            return "DKI Jakarta"
       case 6:
           return "Gorontalo"
       case 7:
        return "Jambi"
       case 8:
       return "Jawa Barat"
       case 9:
       return "Jawa Tengah"
       case 10:
       return "Jawa Timur"
       case 11:
       return "Kalimantan Barat"
       case 12:
       return "Kalimantan Selatan"
       case 13:
       return "Kalimantan Tengah"
        case 14:
           return "Kalimantan Timur"
        case 15:
           return "Kalimantan Utara"
        case 16:
           return "Kepulauan Riau"
       case 17:
            return "Lampung"
       case 18:
            return "Maluku"
       case 19:
            return "Maluku Utara"
       case 20:
            return "N. Aceh D."
       case 21:
            return "NTB"

       case 22:
           return "NTT"
       case 23:
           return "Papua"
       case 24:
           return "Papua Barat"
       case 25:
           return "Riau"
       case 26:
           return "Sulawesi Barat"
       case 27:
           return "Sulawesi Selatan"
       case 28:
            return "Sulawesi Tengah"
       case 29:
            return "Sulawesi Tenggara"
       case 30:
            return "Sulawesi Utara"
       case 31:
            return "Sumatera Barat"
       case 32:
            return "Sumatera Selatan"
       case 33:
            return "Sumatera Utara"
       case 34:
           return "Yogyakarta"
         default:
             return "Indonesia"
        }
    }
}
