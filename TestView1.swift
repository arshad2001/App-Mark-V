//
//  ContentView.swift
//  App-Mark-V
//
//  Created by Arshad Buchori on 29/06/24.
//
import AVFoundation
import SwiftUI
import Combine

struct TestView1: View {
    var body: some View {
        AudioReactiveView()
    }
}

#Preview {
    TestView1()
}

struct AudioReactiveView: View {
    @ObservedObject var audioManager = AudioManager()
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: CGFloat(100 + audioManager.averagePower * 2), height: CGFloat(100 + audioManager.averagePower * 2))
                .animation(.easeInOut, value: audioManager.averagePower)
        }
        .padding()
        .onAppear {
            audioManager.startRecording()
        }
        .onDisappear {
            audioManager.stopRecording()
        }
    }
}



class AudioManager: ObservableObject {
    private var audioEngine: AVAudioEngine
    private var audioInputNode: AVAudioInputNode?
    private var audioBus: AVAudioNodeBus = 0
    private var audioFormat: AVAudioFormat?
    @Published var averagePower: Float = 0.0

    init() {
        audioEngine = AVAudioEngine()
        audioInputNode = audioEngine.inputNode
        audioFormat = audioInputNode?.outputFormat(forBus: audioBus)
        setupAudioEngine()
    }

    private func setupAudioEngine() {
        audioInputNode?.installTap(onBus: audioBus, bufferSize: 1024, format: audioFormat) { buffer, time in
            self.processAudio(buffer: buffer)
        }
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine couldn't start: \(error.localizedDescription)")
        }
    }

    private func processAudio(buffer: AVAudioPCMBuffer) {
        buffer.frameLength = 1024
        let channelData = buffer.floatChannelData?[0]
        let channelDataValueArray = stride(from: 0,
                                           to: Int(buffer.frameLength),
                                           by: buffer.stride).map { channelData?[$0] ?? 0 }
        let rms = sqrt(channelDataValueArray.map { $0 * $0 }.reduce(0, +) / Float(buffer.frameLength))
        let avgPower = 20 * log10(rms)
        DispatchQueue.main.async {
            self.averagePower = avgPower
        }
    }

    func startRecording() {
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine couldn't start: \(error.localizedDescription)")
        }
    }

    func stopRecording() {
        audioEngine.stop()
        audioInputNode?.removeTap(onBus: audioBus)
    }
}
