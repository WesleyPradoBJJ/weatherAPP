//
//  ContentView.swift
//  weatherAPP
//
//  Created by Wesley Prado on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[.blue, .white, .yellow]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("Abu Dhabi, UAE")
                    .font(.system(size: 42, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
          
                VStack (spacing: 8){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio (contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("44°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.yellow)
                }
                Spacer()
                
                HStack(spacing: 30){
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "sun.max.fill",
                                   temperature: 46)
                    
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "sun.max.fill",
                                   temperature: 47)
                    
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "cloud.sun.fill",
                                   temperature: 35)
                    
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 22)
                    
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "cloud.sun.fill",
                                   temperature: 35)
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
