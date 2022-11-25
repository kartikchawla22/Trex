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
    @Binding var date: String
    @Binding var goal: String
    @Binding var steps: String
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(date)
                    .multilineTextAlignment(.center)
                    .frame(width: 130.0, alignment: .center)
                Divider()
                Text(goal)
                    .multilineTextAlignment(.center)
                    .frame(width: 75, alignment: .center)
                Divider()
                Text(steps)
                    .multilineTextAlignment(.center)
                    .frame(width: 75, alignment: .center)
            }.fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct StepsIdentifiable: Identifiable {
    let id = UUID()
    var date: String
    var steps: String
    var goal: String
}
