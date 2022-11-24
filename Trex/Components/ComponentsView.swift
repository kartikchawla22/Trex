//
//  ComponentsView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-11.
//

import SwiftUI

struct ComponentsView: View {
    @State private var text = "hello"
    var body: some View {
        VStack {
            WelcomeTextView(text: $text)
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
    @Binding var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct TrackStepsCell: View {
    var body: some View {
        VStack{
            HStack {
                Group {
                    Text(Date.now, style: .date).multilineTextAlignment(.center)
                    Spacer()
                    Divider()
                }
                Group {
                    Spacer()
                    Text("5000").multilineTextAlignment(.center)
                    Spacer()
                    Divider()
                }
                Group {
                    Spacer()
                    Text("5000").multilineTextAlignment(.center)
                    Spacer()
                }
            }
        }
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
