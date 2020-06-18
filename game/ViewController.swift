//
//  ViewController.swift
//  game
//
//  Created by Joykirat on 12/06/20.
//  Copyright © 2020 Joykirat. All rights reserved.
//

import UIKit
import VisionKit
import Vision
class ViewController: UIViewController, VNDocumentCameraViewControllerDelegate {
//    @IBOutlet weak var i1: UIImageView!
//    @IBOutlet weak var i3: UIImageView!
//    @IBOutlet weak var i4: UIImageView!
//    @IBOutlet weak var i5: UIImageView!
//    @IBOutlet weak var i6: UIImageView!
//    @IBOutlet weak var i7: UIImageView!
//    @IBOutlet weak var i8: UIImageView!
//    @IBOutlet weak var i9: UIImageView!
//    @IBOutlet weak var i10: UIImageView!
//    @IBOutlet weak var i11: UIImageView!
//    @IBOutlet weak var i12: UIImageView!
//    @IBOutlet weak var i13: UIImageView!
//    @IBOutlet weak var i14: UIImageView!
//    @IBOutlet weak var i15: UIImageView!
////    @IBOutlet weak var i16: UIImageView!
//    @IBOutlet weak var i16: UIImageView!
//    @IBOutlet weak var i17: UIImageView!
//    @IBOutlet weak var i18: UIImageView!
//    @IBOutlet weak var i19: UIImageView!
//    @IBOutlet weak var i20: UIImageView!
//    @IBOutlet weak var i21: UIImageView!
//    @IBOutlet weak var i22: UIImageView!
//    @IBOutlet weak var i23: UIImageView!
//    @IBOutlet weak var i24: UIImageView!
//    @IBOutlet weak var i25: UIImageView!
//    @IBOutlet weak var i26: UIImageView!
//    @IBOutlet weak var i27: UIImageView!
//    @IBOutlet weak var i28: UIImageView!
//    @IBOutlet weak var i29: UIImageView!
//    @IBOutlet weak var i30: UIImageView!
//    @IBOutlet weak var i31: UIImageView!
//    @IBOutlet weak var i32: UIImageView!
//    @IBOutlet weak var i33: UIImageView!
//    @IBOutlet weak var i34: UIImageView!
//    @IBOutlet weak var i35: UIImageView!
//    @IBOutlet weak var i36: UIImageView!
//    @IBOutlet weak var i37: UIImageView!
//    @IBOutlet weak var i38: UIImageView!
//    @IBOutlet weak var i39: UIImageView!
//    @IBOutlet weak var i40: UIImageView!
//    @IBOutlet weak var i41: UIImageView!
//    @IBOutlet weak var i42: UIImageView!
//    @IBOutlet weak var i43: UIImageView!
//    @IBOutlet weak var i44: UIImageView!
//    @IBOutlet weak var i45: UIImageView!
//    @IBOutlet weak var i46: UIImageView!
//    @IBOutlet weak var i47: UIImageView!
//    @IBOutlet weak var i48: UIImageView!
//    @IBOutlet weak var i49: UIImageView!
//    @IBOutlet weak var i50: UIImageView!
//    @IBOutlet weak var i51: UIImageView!
//    @IBOutlet weak var i52: UIImageView!
//    @IBOutlet weak var i53: UIImageView!
//    @IBOutlet weak var i54: UIImageView!
//    @IBOutlet weak var i55: UIImageView!
//    @IBOutlet weak var i56: UIImageView!
//    @IBOutlet weak var i57: UIImageView!
//    @IBOutlet weak var i58: UIImageView!
//    @IBOutlet weak var i59: UIImageView!
//    @IBOutlet weak var i60: UIImageView!
//    @IBOutlet weak var i61: UIImageView!
//    @IBOutlet weak var i62: UIImageView!
//    @IBOutlet weak var i63: UIImageView!
//    @IBOutlet weak var i64: UIImageView!
//    @IBOutlet weak var i65: UIImageView!
//    @IBOutlet weak var i66: UIImageView!
//    @IBOutlet weak var i67: UIImageView!
//    @IBOutlet weak var i68: UIImageView!
//    @IBOutlet weak var i69: UIImageView!
//    @IBOutlet weak var i70: UIImageView!
//    @IBOutlet weak var i71: UIImageView!
//    @IBOutlet weak var i72: UIImageView!
//    @IBOutlet weak var i73: UIImageView!
//    @IBOutlet weak var i74: UIImageView!
//    @IBOutlet weak var i75: UIImageView!
//    @IBOutlet weak var i76: UIImageView!
//    @IBOutlet weak var i77: UIImageView!
//    @IBOutlet weak var i78: UIImageView!
//    @IBOutlet weak var i79: UIImageView!
//    @IBOutlet weak var i80: UIImageView!
//    @IBOutlet weak var i81: UIImageView!
//


    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    @IBOutlet weak var textView: UITextView!
//    @IBOutlet weak var i2: UIImageView!
    
    var arr = [String]()
    var matrix = [[Int]]()
    var temparr = [[Int]]()
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
        textView.text = ""
        // Do any additional setup after loading the view.
        setupVision()
        
    }

    @IBAction func Camera(_ sender: Any) {
        configureDocumentView()
    }
    
    private func configureDocumentView(){
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        self.present(scanningDocumentVC, animated: true,completion: nil)
        
    }
    
    private func setupVision() {
        textView.text = ""
        self.arr.removeAll()
            textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    self.arr.append("0")
                    return }
                
                
                if(observations.count == 0){
                    self.arr.append("0")
                }
                var detectedText = ""
                for observation in observations {
//                    print("\(observation)")
                    guard let topCandidate = observation.topCandidates(1).first else { return }
                    print("text \(topCandidate.string) has confidence \(topCandidate.confidence)")
        
                    detectedText = topCandidate.string
                    if(detectedText == ""){
                        self.arr.append("0")
                    }else{
                        self.arr.append(detectedText)
                    }
                    
                    detectedText = ""
                    
                }
                
                
                DispatchQueue.main.async {
                    var a = ""
                    a = self.arr.description
//                    var at = ""
                    
//                    at = self.matrix.description
                    self.textView.text = a
//                    self.textView.text = a
                    self.make2darr()
                    self.textView.flashScrollIndicators()
                    
                    
                    

                }
            }

            textRecognitionRequest.recognitionLevel = .accurate
            textRecognitionRequest.customWords = ["1","2","3","4","5","6","7","8","9"]
            textRecognitionRequest.minimumTextHeight = 0.03125
//            textRecognitionRequest.usesLanguageCorrection = true
        }
    
        
        private func processImage(_ image: UIImage) {
            textView.text = ""
            var imagearr = [UIImage]()
            imagearr = slice(image: image, into: 9)
            imageView.image = image
//            i1.image = imagearr[0]
//            i2.image = imagearr[1]
//            i3.image = imagearr[2]
//            i4.image = imagearr[3]
//            i5.image = imagearr[4]
//            i6.image = imagearr[5]
//            i7.image = imagearr[6]
//            i8.image = imagearr[7]
//            i9.image = imagearr[8]
//            i10.image = imagearr[9]
//            i11.image = imagearr[10]
//            i12.image = imagearr[11]
//            i13.image = imagearr[12]
//            i14.image = imagearr[13]
//            i15.image = imagearr[14]
//            i16.image = imagearr[15]
//            i17.image = imagearr[16]
//            i18.image = imagearr[17]
//            i19.image = imagearr[18]
//            i20.image = imagearr[19]
//            i21.image = imagearr[20]
//            i22.image = imagearr[21]
//            i23.image = imagearr[22]
//            i24.image = imagearr[23]
//            i25.image = imagearr[24]
//            i26.image = imagearr[25]
//            i27.image = imagearr[26]
//            i28.image = imagearr[27]
//            i29.image = imagearr[28]
//            i30.image = imagearr[29]
//            i31.image = imagearr[30]
//            i32.image = imagearr[31]
//            i33.image = imagearr[32]
//            i34.image = imagearr[33]
//            i35.image = imagearr[34]
//            i36.image = imagearr[35]
//            i37.image = imagearr[36]
//            i38.image = imagearr[37]
//            i39.image = imagearr[38]
//            i40.image = imagearr[39]
//            i41.image = imagearr[40]
//            i42.image = imagearr[41]
//            i43.image = imagearr[42]
//            i44.image = imagearr[43]
//            i45.image = imagearr[44]
//            i46.image = imagearr[45]
//            i47.image = imagearr[46]
//            i48.image = imagearr[47]
//            i49.image = imagearr[48]
//            i50.image = imagearr[49]
//            i51.image = imagearr[50]
//            i52.image = imagearr[51]
//            i53.image = imagearr[52]
//            i54.image = imagearr[53]
//            i55.image = imagearr[54]
//            i56.image = imagearr[55]
//            i57.image = imagearr[56]
//            i58.image = imagearr[57]
//            i59.image = imagearr[58]
//            i60.image = imagearr[59]
//            i61.image = imagearr[60]
//            i62.image = imagearr[61]
//            i63.image = imagearr[62]
//            i64.image = imagearr[63]
//            i65.image = imagearr[64]
//            i66.image = imagearr[65]
//            i67.image = imagearr[66]
//            i68.image = imagearr[67]
//            i69.image = imagearr[68]
//            i70.image = imagearr[69]
//            i71.image = imagearr[70]
//            i72.image = imagearr[71]
//            i73.image = imagearr[72]
//            i74.image = imagearr[73]
//            i75.image = imagearr[74]
//            i76.image = imagearr[75]
//            i77.image = imagearr[76]
//            i78.image = imagearr[77]
//            i79.image = imagearr[78]
//            i80.image = imagearr[79]
//            i81.image = imagearr[80]

            for item in imagearr{
                recognizeTextInImage(item)
            }
            
            
            
            
        }
        
        private func recognizeTextInImage(_ image: UIImage) {
            guard let cgImage = image.cgImage else { return }
            
            textView.text = ""
            textRecognitionWorkQueue.async {
                let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
                do {
                    try requestHandler.perform([self.textRecognitionRequest])
                } catch {
//                    self.arr.append("0")
                    print(error)
                }
            }
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            guard scan.pageCount >= 1 else {
                controller.dismiss(animated: true)
                return
            }
            
            let originalImage = scan.imageOfPage(at: 0)
            let newImage = compressedImage(originalImage)
            controller.dismiss(animated: true)
            
            processImage(newImage)
            
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print(error)
            controller.dismiss(animated: true)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true)
        }

        func compressedImage(_ originalImage: UIImage) -> UIImage {
            guard let imageData = originalImage.jpegData(compressionQuality: 1),
                let reloadedImage = UIImage(data: imageData) else {
                    return originalImage
            }
            return reloadedImage
        }
    func slice(image: UIImage, into howMany: Int) -> [UIImage] {
        let width: CGFloat
        let height: CGFloat

        switch image.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            width = image.size.height
            height = image.size.width
        default:
            width = image.size.width
            height = image.size.height
        }

        let tileWidth = Int(width / CGFloat(howMany))
        let tileHeight = Int(height / CGFloat(howMany))

        let scale = Int(image.scale)
        var images = [UIImage]()

        let cgImage = image.cgImage!

        var adjustedHeight = tileHeight

        var y = 0
        for row in 0 ..< howMany {
            if row == (howMany - 1) {
                adjustedHeight = Int(height) - y
            }
            var adjustedWidth = tileWidth
            var x = 0
            for column in 0 ..< howMany {
                if column == (howMany - 1) {
                    adjustedWidth = Int(width) - x
                }
                let origin = CGPoint(x: x * scale, y: y * scale)
                let size = CGSize(width: adjustedWidth * scale, height: adjustedHeight * scale)
                let tileCgImage = cgImage.cropping(to: CGRect(origin: origin, size: size))!
                images.append(UIImage(cgImage: tileCgImage, scale: image.scale, orientation: image.imageOrientation))
                x += tileWidth
            }
            y += tileHeight
        }
        return images
    }
    
    
    func make2darr()
    {   if(self.arr.count != 81){
        return;
        }
        self.textView.text = ""
        var temp = [Int]()
        for i in 0...80{
            if(i != 0 && i%9 == 0){
                self.matrix.append(temp)
                temp.removeAll()
            }
            let myInt2 = Int(self.arr[i]) ?? 0
            temp.append(myInt2)
        }
        self.matrix.append(temp)
        self.duplicate()
//        solveSudoku(n: 9)
        if(self.solveSudoku(n: 9)){
            self.textView.text = printgrid()
        }else{
            self.textView.text = "NO SOLTUION EXIST"
        }
        
    }
    
    
    func duplicate(){
        for i in  0...8{
            var temp = [Int]()
            for j in 0...8{
                temp.append(self.matrix[i][j])
            }
            self.temparr.append(temp)
            temp.removeAll()
        }
    }
    
    func isSafe(row:Int, col:Int, num:Int) -> Bool{
        for d in 0...8{
            if(self.temparr[row][d] == num){
                return false
            }
        }
        for r in 0...8{
            if(self.temparr[r][col] == num){
                return false
            }
        }
        let sqrt = 3
        let boxRowStart = row - row%sqrt
        let boxColStart = col - col%sqrt
        
        for r in boxRowStart...(boxRowStart + sqrt - 1){
            for d in boxColStart...(boxColStart + sqrt - 1){
                if(self.matrix[r][d] == num){
                    return false
                }
            }
        }
        return true
    }
    
    func solveSudoku(n:Int) -> Bool{
        var row = -1
        var col = -1
        var isEmpty = true
        for i in 0...n-1{
            for j in 0...n-1{
                if(self.temparr[i][j] == 0){
                    row = i
                    col = j
                    
                    isEmpty = false
                    break
                }
            }
            if(!isEmpty){
                break
            }
        }
        
        if(isEmpty){
            return true
        }
        
        for num in  1...n{
            if(self.isSafe(row: row, col: col, num: num)){
                self.temparr[row][col] = num
                if(self.solveSudoku(n: n)){
                    return true
                }
                
                else{
                    self.temparr[row][col] = 0
                }
            }
        }
        return false
    }
    
    func printgrid() -> String{
        var text = ""
        for i in 0...8{
            for j in 0...8{
                text += String(self.temparr[i][j])
                text += " "
            }
            text += "\n"
        }
        return text
       
    }
}


