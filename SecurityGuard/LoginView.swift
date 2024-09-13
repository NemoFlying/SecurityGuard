//
//  LoginView.swift
//  SafeFactory
//
//  Created by 熊何凡 on 2024/8/17.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = UserViewModel()
    @State private var jobNumber = ""
    @State private var passWord = ""
    @State private var selectedOption = "Option 1"
    @State private var showHomeView = false
    var body: some View {
        NavigationStack{
        ZStack{
            Color(red: 76/255, green: 134/255, blue: 110/255).ignoresSafeArea()
            Circle().scale(1.7).fill(Color.white.opacity(0.15))
            Circle().scale(1.35).fill(Color.white.opacity(0.1))
            
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 300)
                        .padding()
                    VStack{
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120,height: 120)
                            .padding()
                            .offset(y:-80)
                        VStack{
                            Text("登陆安巡卫士")
                                .font(.system(size: 38))
                                .bold()
                                .offset(y:-20)
                            TextField("输入你的工号",text:$viewModel.userName)
                                .modifier(ThreadsTextFieldModifier())
                                .offset(y:-20)
                            SecureField("输入你的密码",text:$viewModel.password)
                                .modifier(ThreadsTextFieldModifier())
                                .offset(y:-10)
                            //                            Picker("Select an option", selection: $selectedOption) {
                            //                                Text("员工").tag("Option 1")
                            //                                Text("安全员").tag("Option 2")
                            //                                Text("管理员").tag("Option 3")
                            //                            }
                            //                            .pickerStyle(.segmented).frame(width: 340,height:50)
                        }.padding(20)
                        //                        NavigationLink{
                        //
                        //                            Text("这里是忘记密码页面")
                        //                        }
                        //                    label:{
                        //                        Text("忘记密码？")
                        //                            .font(.footnote)
                        //                            .underline()
                        //                            .fontWeight(.semibold)
                        //                            .padding(.vertical)
                        //                            .padding(.trailing,28)
                        //                            .foregroundColor(.black)
                        //                        .frame(maxWidth:.infinity,alignment: .trailing)}
                        
                        Button{
                            viewModel.Login()
                        }
                    label: {
                        Text("登陆")
                            .modifier(buttomFieldModifier())
                    }}
                }
                    Spacer()
                    Divider()
            NavigationLink{RegistrationView().navigationBarBackButtonHidden(true)}
                label: {
                    HStack(spacing:3){
                        Text("没有账号？")
                        Text("申请").underline().bold()
                    }.font(.footnote)
                        .foregroundColor(.black)
                    
                }.padding(.vertical,16)
                }
            }.alert(isPresented: $viewModel.showAlter){
                Alert(title: Text("登陆失败"),message: Text("\(viewModel.alterMsg)"))
            }
        }
    }
}
#Preview {
    LoginView()
}
