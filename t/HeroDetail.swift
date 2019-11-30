//
//  HeroDetail.swift
//  t
//
//  Created by Frank Cheng on 2019/11/30.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HtmlLabel: UIViewRepresentable {
    
    var html: String
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = html.data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<HtmlLabel>) {
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<HtmlLabel>) -> UILabel {
        let label = UILabel()
        label.attributedText = htmlToAttributedString
        return label
    }
}

struct HeroDetail: View {
    var hero: Hero
    var skill: Skill? {
        return heroSkillData.first { (card) -> Bool in
            return card.id == hero.childIds.first
        }
    }
        
    var body: some View {
        return VStack {
            KFImage(URL(string: hero.battlegrounds.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            if skill != nil {
                HtmlLabel(html: skill!.text)
            }
            
            Spacer()
        }
    }
}

struct HeroDetail_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetail(hero: heroData.first!)
    }
}
