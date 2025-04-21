//
//  AnalyticsReportService.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/17/25.
//

import Foundation

protocol IAnalyticsReporterService {
    func reportEvent(with message: String, parameters: [String: Any]?)
}

struct AnalyticsReporterService: IAnalyticsReporterService {
    func reportEvent(with message: String, parameters: [String: Any]?) {
        Log.info(message)
    }
}
