//
//  CountryCode+Extension.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/17/25.
//

enum Country: CaseIterable {
    case turkey, usa, germany, turkmenistan

    var flag: String {
        switch self {
        case .turkey: return "🇹🇷"
        case .usa: return "🇺🇸"
        case .germany: return "🇩🇪"
        case .turkmenistan: return "🇹🇲"
        }
    }

    var code: String {
        switch self {
        case .turkey: return "+90"
        case .usa: return "+1"
        case .germany: return "+49"
        case .turkmenistan : return "+993"
        }
    }

    var displayName: String {
        return "\(flag) \(code)"
    }
}
