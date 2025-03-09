//
//  SwiftUI+Fonts.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//
import SwiftUI

extension Font{
    static func displayTitle() -> Font {
        return Font.custom("MarkaziText-Medium", size: 45)
    }
    
    static func displaySubtitle() -> Font {
        return Font.custom("MarkaziText-Medium", size: 30)
    }
    
    static func leadText() -> Font {
        return Font.custom("Karla-Medium", size: 17)
    }
    
    static func sectionTitle() -> Font {
        return Font.custom("Karla-ExtraBold", size: 19)
    }
    
    static func sectionCategory() -> Font {
        return Font.custom("Karla-ExtraBold", size: 15)
    }
    
    static func cardTitle() -> Font {
        return Font.custom("Karla-Bold", size: 17)
    }
    
    static func paragraphText() -> Font {
        return Font.custom("Karla-Regular", size: 15)
    }
    
    static func highlightText() -> Font {
        return Font.custom("Karla-Medium", size: 15)
    }
}
