//
//  CustomAlertView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 9/5/24.
//

import SwiftUI

struct CustomAlertView: View {
    let alertDescription: String
    let alertTitle: String
    let alertButtonTitle: String
    let alertAction: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .foregroundStyle(.yellow)
            Text(alertTitle)
                .font(.largeTitle)
                .bold()
            Text(alertDescription)
                .font(.body)
            HStack{
                Button {
                    alertAction()
                } label: {
                    Text(alertButtonTitle)
                }
                .buttonBorderShape(.roundedRectangle)

            }
        }
        .padding(20)
        .background{
            Color.gray
                .opacity(0.3)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CustomAlertView(alertDescription: "Esto es una descripcion del error.", alertTitle: "Título de la alerta.", alertButtonTitle: "BotonAlert") {
        print("he pulsado")
    }
}
