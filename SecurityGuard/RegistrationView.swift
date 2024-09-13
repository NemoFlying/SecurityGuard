//
//  RegistrationView.swift
//  SafeFactory
//
//  Created by 熊何凡 on 2024/8/17.
//

import SwiftUI

struct RegistrationView: View {
    @State private var jobNumber = ""
    @State private var passWord = ""
    @State private var company = ""
    @State private var department = ""
    @State private var selectedOption = "Option 1"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color(red: 76/255, green: 134/255, blue: 110/255).ignoresSafeArea()
            Circle().scale(1.7).fill(Color.white.opacity(0.15))
            Circle().scale(1.35).fill(Color.white.opacity(0.1))
            
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width:395,height: 440)
                    VStack{
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120,height: 120)
                            .padding()
                        VStack{
                            Text("申请账号")
                                .font(.system(size: 38))
                                .bold()
                            TextField("输入你的工号",text:$jobNumber)
                                .modifier(ThreadsTextFieldModifier())
                            SecureField("输入你的密码",text:$passWord)
                                .modifier(ThreadsTextFieldModifier())
                            TextField("输入你的公司名称",text:$company)
                                .modifier(ThreadsTextFieldModifier())
                            TextField("输入你的部门名称",text:$department)
                                .modifier(ThreadsTextFieldModifier())
                            Picker("Select an option", selection: $selectedOption) {
                                Text("员工").tag("Option 1")
                                Text("安全员").tag("Option 2")
                                Text("管理员").tag("Option 3")
                            }
                            .pickerStyle(.segmented).frame(width: 340,height:50)
                        }
                        
                        Button{
                            
                        }label: {
                            Text("申请")
                                .modifier(buttomFieldModifier())
                        }.offset(y:10)
                        Spacer()
                        Divider()
                        Button{dismiss()
                        }
                    label: {
                        HStack(spacing:3){
                            Text("已有账号？")
                            Text("登陆").underline().bold()
                        }.font(.footnote)
                            .foregroundColor(.black)
                    }.padding(.vertical,16)
                    }}}
            }
        }
    }

#Preview {
    RegistrationView()
}
