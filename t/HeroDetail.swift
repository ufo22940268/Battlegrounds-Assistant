//
//  HeroDetail.swift
//  t
//
//  Created by Frank Cheng on 2019/11/30.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

class TextView : UIView {
    
    var html: NSAttributedString?
    
    init(html: NSAttributedString?) {
        self.html = html
        super.init(frame: .zero)
        let label = UILabel()
        label.attributedText = html
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        addSubview(label)
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: widthAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct HtmlLabel: UIViewRepresentable {
    
    var html: NSAttributedString?
    
    init(text: String) {
        html = text.htmlToAttributedString
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<HtmlLabel>) {
        uiView.sizeToFit()
    }
    
    func makeUIView(context: UIViewRepresentableContext<HtmlLabel>) -> UIView {
        return TextView(html: html)
    }
}

struct HeroDetail: View {
    var hero: Hero
    
    var firstSkill: Skill {
        return allSkills.first!
    }
    
    var allSkills: [Skill] {
        return heroSkillData.filter { (card) -> Bool in
            return card.id == hero.childIds.first
        }
    }
        
        
    var body: some View {
        ScrollView {
            VStack {
                ScrollView {
                    HStack(spacing: 10) {
                        ForEach(allSkills) { skill in
                            KFImage(URL(string: skill.image))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 400)
                        }
                    }
                }.padding(.top)
                Spacer()
            }
            .navigationBarTitle(hero.name)
        }
    }
}

struct HeroDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HeroDetail(hero: heroData[1])
        }
    }
}

