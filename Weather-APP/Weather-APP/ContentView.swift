//
//  ContentView.swift
//  Weather-APP
//
//  Created by Lavenda Shan on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        // ZStack - layer(s)
        ZStack {
            // Ternary operator:
            // test_expr ? expr1: expr2
            // if test_expr is true -> expr1, else -> expr2
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(CityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temp: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(DayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temp: 76)
                    
                    WeatherDayView(DayOfWeek: "WED",
                                   imageName: "cloud.sun.fill",
                                   temp: 74)
                    
                    WeatherDayView(DayOfWeek: "THU",
                                   imageName: "cloud.sun.rain.fill",
                                   temp: 68)
                    
                    WeatherDayView(DayOfWeek: "FRI",
                                   imageName: "cloud.bolt.rain.fill",
                                   temp: 60)
                    
                    WeatherDayView(DayOfWeek: "SAT",
                                   imageName: "tornado",
                                   temp: 55)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgrounColor: .white)
                }
                Spacer()
            }
        }
    }
}


#Preview {
    ContentView()
}


struct WeatherDayView: View {
    
    var DayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(DayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var CityName: String
    
    var body: some View {
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


