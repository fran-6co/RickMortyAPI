//
//  UITextView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 22/7/24.
//

import SwiftUI

struct TextoUIKitView: UIViewRepresentable {
    @Binding var texto: String
    let size: FontSize
    
    typealias UIViewType = UITextView
    
    final class Coordinator: NSObject, UITextViewDelegate{
        @Binding var texto: String
        
        init(texto: Binding<String>) {
            self._texto = texto
        }
        
        func textViewDidChange(_ textView: UITextView) {
            texto = textView.text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(texto: $texto)
    }

    func makeUIView(context: Context) -> UITextView {
        let textField = UITextView()
        textField.text = texto //Obtiene del binding el texto que se haya querido dejar escrito
        textField.font = UIFont(name: "arial", size: 16)
        textField.backgroundColor = UIColor(Color.gray)
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.font = switch size {
            case .small:
                UIFont(name: "arial", size: 10)
            case .medium:
                UIFont(name: "arial", size: 16)
            case .large:
                UIFont(name: "arial", size: 20)
            case .xl:
                UIFont(name: "arial", size: 24)
        }
    }
}
