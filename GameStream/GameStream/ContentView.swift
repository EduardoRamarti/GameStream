//
//  ContentView.swift
//  GameStream
//
//  Created by Eduardo Ramirez on 30/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Spacer() //este spacer es para que el logo no sobrepasa la safe Area
            //aqui se pone entr 255 por que necesitamos introducir los valores de manera double, y para ello utilizamos el 255 del rgb
            Color(red: 18/255, green: 28/255, blue: 63/255, opacity: 1.0)
                .ignoresSafeArea()
            
            VStack{
                
                HStack {
                    Image("appLogoControl")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:40)
                    
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                }
                .padding(.bottom, 42) //aqui le estoy diciendo que al hstack que contiene el logo, le va a hacer un padding de 60 haci abajo
                
                InicioYRegistroView()
                
            }
        }
    }
}

struct InicioYRegistroView : View{
    
    @State var tipoInicioSesion = true
    
    var body: some View{
        VStack{
            HStack {
                
                Spacer()
                
                Button(action: {
                    tipoInicioSesion = true
                }, label: {
                    Text("INICIA SESIÓN")
                        .foregroundColor(tipoInicioSesion ? .white : .gray)
                        .fontWeight(.bold)
                        
                })
                
                Spacer()
                
                Button(action: {
                    tipoInicioSesion = false
                }, label: {
                    Text("REGÍSTRATE")
                        .foregroundColor(tipoInicioSesion ? .gray : .white )
                        .fontWeight(.bold)
                })
        
                Spacer()

            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true{
                
                InicioSesionView()
                
            }else{
                
                RegistroView()
                
                
            }
            
        }
    }
}

struct InicioSesionView : View{
    @State var correo : String = ""
    var body: some View{
        ScrollView {
            VStack (alignment: .leading){
                Text("Correo Electrónico")
                    .foregroundColor(Color("dark-cian"))
                    .fontWeight(.bold)
                
                ZStack{
                    
                    if correo.isEmpty {
                        Text("ejemplo@ejemplo.com")
                            .font(.caption)

                    }
                    
                    TextField("", text: $correo)
                        
                }

            }.padding(.horizontal, 77.0)
        }
    }
}

struct RegistroView : View{
    var body: some View{
        VStack{
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        Image("pantalla01")
            .resizable()
            .scaledToFit()
            
    }
}
