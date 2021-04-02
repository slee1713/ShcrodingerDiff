//
//  ContentView.swift
//  Shared
//
//  Created by Spencer Lee on 3/19/21.
//

import SwiftUI
import CorePlot

typealias plotDataType = [CPTScatterPlotField : Double]

struct ContentView: View {
    @EnvironmentObject var plotDataModel :PlotDataClass
    @ObservedObject private var calculator = CalculatePlotData()
    @State var isChecked:Bool = false
    @State var energyL = ""
    @State var energyU = ""
    @State var stepSize = ""
    @State var seletcionInput = ""
    var body: some View {
        
        VStack{
      
            CorePlot(dataForPlot: $plotDataModel.plotData, changingPlotParameters: $plotDataModel.changingPlotParameters)
                .setPlotPadding(left: 10)
                .setPlotPadding(right: 10)
                .setPlotPadding(top: 10)
                .setPlotPadding(bottom: 10)
                .padding()
            
            Divider()
            
            HStack{
                
                HStack(alignment: .center) {
                    Text("Lower Energy Limit:")
                        .font(.callout)
                        .bold()
                    TextField("", text: $energyL)
                        .padding()
                    Text("Upper Energy Limit:")
                            .font(.callout)
                            .bold()
                    TextField("", text: $energyU)
                            .padding()
                    Text("Step Size:")
                        .font(.callout)
                        .bold()
                    TextField("", text: $stepSize)
                        .padding()
                    Text("Selection Input:")
                        .font(.callout)
                        .bold()
                    TextField("", text: $seletcionInput)
                        .padding()
                }.padding()
                
                Toggle(isOn: $isChecked) {
                            Text("Display Error")
                        }
                .padding()
                
                
            }
            
            
            HStack{
                Button("text", action: {self.calculate()} )
                .padding()
                
            }
            
        }
        
    }
    
    
    
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        let minE = Double(energyL)!
        let maxE = Double(energyU)!
        let eStep = Double(stepSize)!
        let select = Int(seletcionInput)!
        
        //var temp = 0.0
        
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        //Calculate the new plotting data and place in the plotDataModel
        
        calculator.shootingPlot(minE: minE, maxE: maxE, eStep: eStep, select: select)
        
    }
    

   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
