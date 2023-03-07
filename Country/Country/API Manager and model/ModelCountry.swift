//
//  ModelCountry.swift
//  Country
//
//  Created by m223 on 23.02.2023.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let country = try? JSONDecoder().decode(Country.self, from: jsonData)

import Foundation

// MARK: - CountryElement
struct CountryElement: Codable {
    let name: Name?
    let tld: [String]?
    let cca2, ccn3, cca3, cioc: String?
    let independent: Bool?
    let status: Status?
    let unMember: Bool?
    let currencies: Currencies?
    let idd: Idd?
    let capital, altSpellings: [String]?
    let region: Region?
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let gini: [String: Double]?
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [Continent]?
    let flags: Flags?
    let coatOfArms: CoatOfArms?
    let startOfWeek: StartOfWeek?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side?
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let eur, bif, bdt, vuv: Aed?
    let xcd, ars, etb, inr: Aed?
    let szl, zar, ghs, xof: Aed?
    let jpy, omr, nzd, xaf: Aed?
    let sek, gbp, jep, mad: Aed?
    let czk, thb, php, ron: Aed?
    let ils, chf, uzs, xpf: Aed?
    let mur, isk, pgk, afn: Aed?
    let bnd, sgd, gip, sbd: Aed?
    let byn, bmd, ttd, hnl: Aed?
    let lrd, krw, srd, usd: Aed?
    let fkp, uyu, crc, all: Aed?
    let tnd, bgn, rwf, clp: Aed?
    let mwk, tjs, dkk, pln: Aed?
    let tzs, bob, pyg, aed: Aed?
    let mxn, nio, ngn, myr: Aed?
    let aud, zmw, cdf, egp: Aed?
    let fok, mkd, tvd, nok: Aed?
    let hkd, khr, wst, cny: Aed?
    let ang, mzn, shp, ggp: Aed?
    let awg, kwd, cad, mvr: Aed?
    let dzd, htg, gyd, jmd: Aed?
    let kgs, mmk, gmd, rsd: Aed?
    let jod, kes, cve, tmt: Aed?
    let bbd, fjd, lak, irr: Aed?
    let gnf, bsd, djf, pab: Aed?
    let sll, twd, kyd, kzt: Aed?
    let bwp, lsl: Aed?
    let bam, sdg: BAM?
    let top, rub, ves, ckd: Aed?
    let bzd, kid, dop, brl: Aed?
    let mdl, iqd, gtq, lkr: Aed?
    let mop, bhd, aoa, pen: Aed?
    let sar, imp, mnt, syp: Aed?
    let idr, yer, lbp, ugx: Aed?
    let lyd, azn, btn, cuc: Aed?
    let cup, mru, kmf, mga: Aed?
    let currenciesTRY, huf, qar, sos: Aed?
    let npr, nad, zwl, stn: Aed?
    let vnd, ssp, scr, cop: Aed?
    let uah, ern, kpw, pkr: Aed?
    let amd, gel: Aed?

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
        case bif = "BIF"
        case bdt = "BDT"
        case vuv = "VUV"
        case xcd = "XCD"
        case ars = "ARS"
        case etb = "ETB"
        case inr = "INR"
        case szl = "SZL"
        case zar = "ZAR"
        case ghs = "GHS"
        case xof = "XOF"
        case jpy = "JPY"
        case omr = "OMR"
        case nzd = "NZD"
        case xaf = "XAF"
        case sek = "SEK"
        case gbp = "GBP"
        case jep = "JEP"
        case mad = "MAD"
        case czk = "CZK"
        case thb = "THB"
        case php = "PHP"
        case ron = "RON"
        case ils = "ILS"
        case chf = "CHF"
        case uzs = "UZS"
        case xpf = "XPF"
        case mur = "MUR"
        case isk = "ISK"
        case pgk = "PGK"
        case afn = "AFN"
        case bnd = "BND"
        case sgd = "SGD"
        case gip = "GIP"
        case sbd = "SBD"
        case byn = "BYN"
        case bmd = "BMD"
        case ttd = "TTD"
        case hnl = "HNL"
        case lrd = "LRD"
        case krw = "KRW"
        case srd = "SRD"
        case usd = "USD"
        case fkp = "FKP"
        case uyu = "UYU"
        case crc = "CRC"
        case all = "ALL"
        case tnd = "TND"
        case bgn = "BGN"
        case rwf = "RWF"
        case clp = "CLP"
        case mwk = "MWK"
        case tjs = "TJS"
        case dkk = "DKK"
        case pln = "PLN"
        case tzs = "TZS"
        case bob = "BOB"
        case pyg = "PYG"
        case aed = "AED"
        case mxn = "MXN"
        case nio = "NIO"
        case ngn = "NGN"
        case myr = "MYR"
        case aud = "AUD"
        case zmw = "ZMW"
        case cdf = "CDF"
        case egp = "EGP"
        case fok = "FOK"
        case mkd = "MKD"
        case tvd = "TVD"
        case nok = "NOK"
        case hkd = "HKD"
        case khr = "KHR"
        case wst = "WST"
        case cny = "CNY"
        case ang = "ANG"
        case mzn = "MZN"
        case shp = "SHP"
        case ggp = "GGP"
        case awg = "AWG"
        case kwd = "KWD"
        case cad = "CAD"
        case mvr = "MVR"
        case dzd = "DZD"
        case htg = "HTG"
        case gyd = "GYD"
        case jmd = "JMD"
        case kgs = "KGS"
        case mmk = "MMK"
        case gmd = "GMD"
        case rsd = "RSD"
        case jod = "JOD"
        case kes = "KES"
        case cve = "CVE"
        case tmt = "TMT"
        case bbd = "BBD"
        case fjd = "FJD"
        case lak = "LAK"
        case irr = "IRR"
        case gnf = "GNF"
        case bsd = "BSD"
        case djf = "DJF"
        case pab = "PAB"
        case sll = "SLL"
        case twd = "TWD"
        case kyd = "KYD"
        case kzt = "KZT"
        case bwp = "BWP"
        case lsl = "LSL"
        case bam = "BAM"
        case sdg = "SDG"
        case top = "TOP"
        case rub = "RUB"
        case ves = "VES"
        case ckd = "CKD"
        case bzd = "BZD"
        case kid = "KID"
        case dop = "DOP"
        case brl = "BRL"
        case mdl = "MDL"
        case iqd = "IQD"
        case gtq = "GTQ"
        case lkr = "LKR"
        case mop = "MOP"
        case bhd = "BHD"
        case aoa = "AOA"
        case pen = "PEN"
        case sar = "SAR"
        case imp = "IMP"
        case mnt = "MNT"
        case syp = "SYP"
        case idr = "IDR"
        case yer = "YER"
        case lbp = "LBP"
        case ugx = "UGX"
        case lyd = "LYD"
        case azn = "AZN"
        case btn = "BTN"
        case cuc = "CUC"
        case cup = "CUP"
        case mru = "MRU"
        case kmf = "KMF"
        case mga = "MGA"
        case currenciesTRY = "TRY"
        case huf = "HUF"
        case qar = "QAR"
        case sos = "SOS"
        case npr = "NPR"
        case nad = "NAD"
        case zwl = "ZWL"
        case stn = "STN"
        case vnd = "VND"
        case ssp = "SSP"
        case scr = "SCR"
        case cop = "COP"
        case uah = "UAH"
        case ern = "ERN"
        case kpw = "KPW"
        case pkr = "PKR"
        case amd = "AMD"
        case gel = "GEL"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String?
}

// MARK: - BAM
struct BAM: Codable {
    let name: String?
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng, fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String?
}

// MARK: - Flags
struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String?
}

// MARK: - Name
struct Name: Codable {
    let common, official: String?
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String?
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format, regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case saturday = "saturday"
    case sunday = "sunday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

typealias Country = [CountryElement]

