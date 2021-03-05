//
//  ContentView.swift
//  Shared
//
//  Created by Anthony Lim on 2/23/21.
//

import SwiftUI
import UniformTypeIdentifiers


struct ContentView: View {
    @ State var dataFit = ""
    @ State var dataInfo = ""
    @ State var step = 2880
  
    

    var body: some View {
                
                
                VStack{
                                 
                    

                    Button("Read", action: {self.nfunction2()})
                        .padding()
                    TextField("Info", text: $dataInfo)
                        .padding()
                    
                    //Button("Store", action: {self.nfunction()})
                    
                }
                .padding()
                
                
               
                
            
        
    }
    
    func nfunction2(){
        //let pdf: UTType = .pdf

        //print("MIME type: \(pdf.preferredMIMEType!)")   //application/pdf
        //print("File Extension: \(pdf.preferredFilenameExtension!)") //pdf
        //print("Identifier: \(pdf.identifier)")  //com.adobe.pdf
        
        let path = "/Users/anthonylim/Downloads/real.fits"
        let url = URL(fileURLWithPath: path)
        var textArray:[UInt8] = Array(repeating: 0, count: step)

        //let url = URL(string: path)
        print(url)
        //let data = try Data(contentsOf: url!)
        //catch{}

        do {
            let data = try Data(contentsOf: url)
            //print(data)
            
            let pointer = UnsafeMutableRawBufferPointer.allocate(byteCount: step, alignment: 1<<31)
            
            data.copyBytes(to: pointer, from: 0...(step - 1))
            //print(pointer)
            let str = String(decoding: data, as: UTF8.self)
            
            let strInfo = String(decoding: pointer, as: UTF8.self)
            //print (strInfo)
            

            //let strInfo = str.components(separatedBy: "END")[0]
            
            //print(str2)
            let dataHead = ["SIMPLE ","BITPIX ","NAXIS ","NAXIS1 ","NAXIS2 ","EXTEND ","COMMENT   FITS","BZERO ","BSCALE ","XBINNING","YBINNING","XPIXSZ ", "YPIXSY ", "EXPTIME", "IMAGETYP", "DATE-OBS", "INSTRUME "]
            let q = dataHead.count
            //print(q)
            var strInfoVar = strInfo
            var Info = Array(repeating:"", count: q)
            for n in 0 ... q - 1{
                Info[n] = strInfoVar.components(separatedBy: dataHead[n])[0]
                strInfoVar = dataHead[n] + strInfoVar.components(separatedBy: dataHead[n])[1]
                
                print(Info[n])
                //print(strInfoVar)
                
            }

            dataInfo = strInfo
            //dataFit = strbinary
            //print(strbinary)
        } catch {
        }
 //       print(dataInfo)
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
