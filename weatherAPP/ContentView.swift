//
//  ContentView.swift
//  weatherAPP
//
//  Created by Wesley Prado on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack{
                CityTextView(cityName: "Abu Dhabi, UAE.")
               
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 29 : 44)
                
                HStack(spacing: 30){
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "sun.max.fill",
                                   temperature: 46)
                    
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "smoke.fill",
                                   temperature: 47)
                    
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "cloud.sun.fill",
                                   temperature: 35)
                    
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 22)
                    
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "wind",
                                   temperature: 35)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .yellow)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size:16, weight: .bold))
                .foregroundColor(.blue)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio (contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.blue)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .yellow,
                                                  isNight ? .black : .white,
                                                  isNight ? .gray : .blue]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 40, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack (spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio (contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.yellow)
        }
        .padding(.bottom, 50)
    }
}
