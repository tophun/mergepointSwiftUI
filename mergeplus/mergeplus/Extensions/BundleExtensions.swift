//
//  BundleExtensions.swift
//  mergeplus
//
//  Created by Tophun_mh on 2020/06/26.
//  Copyright © 2020 mergepoint. All rights reserved.
//

import Foundation

extension Bundle {
  var appName: String {
    return infoDictionary?["CFBundleName"] as! String
  }
  
  var bundleId: String {
    return bundleIdentifier!
  }
  
  var versionNumber: String {
    return infoDictionary?["CFBundleShortVersionString"] as! String
  }
  
  var buildNumber: String {
    return infoDictionary?["CFBundleVersion"] as! String
  }
}
