//
//  HeroPage.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI

struct HeroPage: View {
    
    var body: some View {
        ZStack{
            
            backgroundBlobs
            BlobView()
                .offset(x: 200, y: 250)
                .blur(radius: 100)
                .hueRotation(Angle.degrees(190))
            VStack {
                heroSearch
                heroTitle
            }
//            heroBlrub
            VStack {
                HStack {
                    Text("Recent Orders")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                buttonStack()
            }
            .offset(y:220)
            
            CustomTabBar()
                .offset(y:340)
        }
    }
}

struct HeroPage_Previews: PreviewProvider {
    static var previews: some View {
        HeroPage()
                .environmentObject(Model.previewData)
    }
}


//MARK: - Views
extension HeroPage{
    var heroTitle: some View{
        HStack {
            Spacer()
            VStack {
                Text("Discover the \nbest food &\ndrinks")
                    .font(.system(size: 37, weight: .bold))
                Spacer()
                    .frame( height: 500)
            }
        }

        .padding()
    }
    var heroSearch: some View{
        Label(title: {
            Text("Search")
        }, icon: {
         Image(systemName: "magnifyingglass")
        })
                .offset(x: -120)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.thinMaterial)
                        .shadow(color: .black.opacity(0.2), radius: 1, x: 1, y: 1)
                        .frame(width: 350)
            )
                
    }
    var backgroundBlobs: some View{
        return ZStack(){
            
//            BlobView()
//                .offset(x: 200, y: -220)
//                .blur(radius: 100)
            BlobView()
                .offset(x: -290, y: -150)
                .scaleEffect(0.6)
                .blur(radius: 30)
                .overlay {
                    RadialIcons()
//                        .environmentObject(Model.previewData)
                        .offset(x: -180, y: -90)
                }
            
        }
    }
    var heroBlrub: some View{
        HStack {
            Text("Explore curated list of trendy resturants,\ncafes, pubs, and bars based on trends")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding()
            Spacer()
        }
        .offset(x:150,y:-30)
    }
}


//MARK: - View Builders
