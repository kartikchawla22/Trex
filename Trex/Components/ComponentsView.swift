//
//  ComponentsView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-11.
//

import SwiftUI

struct ComponentsView: View {
    var body: some View {
        VStack {
            WelcomeTextView()
            LogoImageView()
        }
        .padding()
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView()
    }
}


struct LogoImageView: View {
    var body: some View {
        Image("AppIconSet")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct WelcomeTextView: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct TrackStepsCell: View {
    var body: some View {
        VStack{
            HStack {
                Text(Date.now, style: .date)
                Divider()
                Spacer()
                Text("5000")
                Divider()
                Spacer()
                Text("5000")
            }
            .padding()
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }.padding(10)
    }
}
struct StepsIdentifiable: Identifiable {
    let id = UUID()
    let date: Date
    let steps: String
    let goal: String
}


struct TrackStepsCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
            TrackStepsCell()
        }.padding().previewLayout(.fixed(width: 300, height: 100))
    }
}
