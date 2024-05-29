//
//  SImageProcessor.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 29/05/24.
//

import UIKit
import Vision

struct SImageProcessor {
    static func processImage(image: UIImage, onCompletion: @escaping(([String]?) -> Void)) {
        // Convert UIImage to CIImage
        guard let cgImage = image.cgImage else {return  }
        // Create a VNImageRequestHandler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        // Create a VNRecognizeTextRequest
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {return}
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string})
            onCompletion(text)
        }
        request.recognitionLevel = VNRequestTextRecognitionLevel.fast
        try? handler.perform([request])
    }
    
    static func processImage(in image: UIImage) async throws -> [String] {
        return try await withCheckedThrowingContinuation { continuation in
            // Convert UIImage to CIImage
            guard let ciImage = CIImage(image: image) else {
                continuation.resume(throwing: NSError(domain: "InvalidImage", code: -1, userInfo: nil))
                return
            }
            // Create a VNImageRequestHandler
            let requestHandler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            
            // Create a VNRecognizeTextRequest
            let request = VNRecognizeTextRequest { request, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    continuation.resume(throwing: NSError(domain: "NoTextFound", code: -1, userInfo: nil))
                    return
                }
                let recognizedStrings = observations.compactMap { observation in
                    observation.topCandidates(1).first?.string
                }
                continuation.resume(returning: recognizedStrings)
            }
            request.recognitionLevel = .fast
            do {
                try requestHandler.perform([request])
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
}
