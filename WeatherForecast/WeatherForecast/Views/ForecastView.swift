//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 渡邉 華輝 on 2024/09/04.
//

import SwiftUI

struct ForecastView: View {
    
    @ObservedObject var weatherController = WeatherController()
    @State private var showClosedView = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Image(weatherController.weatherResponse.weatherCondition.ImageName)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(1.0, contentMode: .fit)
                        .foregroundStyle(weatherController.weatherResponse.weatherCondition.color)
                    HStack(spacing: 0) {
                        Text("\(weatherController.weatherResponse.minTemperature)")
                            .foregroundStyle(Color.blue)
                            .frame(maxWidth: .infinity)
                        Text("\(weatherController.weatherResponse.maxTemperature)")
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
                Spacer()
                    .overlay(alignment: .top) {
                        HStack(spacing: 0) {
                            Button("Close") {
                                showClosedView = true
                            }
                            .frame(maxWidth: .infinity)
                            .fullScreenCover(isPresented: $showClosedView, content: {
                                                            ClosedView(isPresented: $showClosedView)
                                                        })
                            Button("Reload") {
                                weatherController.reloadWeather()
                            }
                            .frame(maxWidth: .infinity)
                            .alert("Error", isPresented: $weatherController.isErrorPresented, presenting: weatherController.errorMessage) { _ in
                                Button("OK") {
                                }
                            } message: { errorMessage in

                                Text(errorMessage)
                            }
                        }
                        .padding(.top, 80)
                        .frame(width: geometry.size.width / 2)
                    }
            }
            .frame(width: geometry.size.width / 2, height: geometry.size.height)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ForecastView()
}
