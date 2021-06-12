// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// Casio-style phase distortion with "pivot point" on the X axis
/// This module is designed to emulate the classic phase distortion synthesis technique.
/// From the mid 90's. The technique reads the first and second halves of the ftbl
/// at different rates in order to warp the waveform. For example, pdhalf can
/// smoothly transition a sinewave into something approximating a sawtooth wave.
/// 
public class PhaseDistortionOscillator: Node {

    /// Connected nodes
    public var connections: [Node] {
        get { [] }
        set {}
    }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(instrument: "pdho")

    fileprivate var waveform: Table?

    /// Specification details for frequency
    public static let frequencyDef = NodeParameterDef(
        identifier: "frequency",
        name: "Frequency (Hz)",
        address: akGetParameterAddress("PhaseDistortionOscillatorParameterFrequency"),
        defaultValue: 440,
        range: 0 ... 20_000,
        unit: .hertz)

    /// Frequency in cycles per second
    @Parameter(frequencyDef) public var frequency: AUValue

    /// Specification details for amplitude
    public static let amplitudeDef = NodeParameterDef(
        identifier: "amplitude",
        name: "Amplitude",
        address: akGetParameterAddress("PhaseDistortionOscillatorParameterAmplitude"),
        defaultValue: 1,
        range: 0 ... 10,
        unit: .generic)

    /// Output Amplitude.
    @Parameter(amplitudeDef) public var amplitude: AUValue

    /// Specification details for phaseDistortion
    public static let phaseDistortionDef = NodeParameterDef(
        identifier: "phaseDistortion",
        name: "Amount of distortion, within the range [-1, 1]. 0 is no distortion.",
        address: akGetParameterAddress("PhaseDistortionOscillatorParameterPhaseDistortion"),
        defaultValue: 0,
        range: -1 ... 1,
        unit: .generic)

    /// Amount of distortion, within the range [-1, 1]. 0 is no distortion.
    @Parameter(phaseDistortionDef) public var phaseDistortion: AUValue

    /// Specification details for detuningOffset
    public static let detuningOffsetDef = NodeParameterDef(
        identifier: "detuningOffset",
        name: "Frequency offset (Hz)",
        address: akGetParameterAddress("PhaseDistortionOscillatorParameterDetuningOffset"),
        defaultValue: 0,
        range: -1_000 ... 1_000,
        unit: .hertz)

    /// Frequency offset in Hz.
    @Parameter(detuningOffsetDef) public var detuningOffset: AUValue

    /// Specification details for detuningMultiplier
    public static let detuningMultiplierDef = NodeParameterDef(
        identifier: "detuningMultiplier",
        name: "Frequency detuning multiplier",
        address: akGetParameterAddress("PhaseDistortionOscillatorParameterDetuningMultiplier"),
        defaultValue: 1,
        range: 0.9 ... 1.11,
        unit: .generic)

    /// Frequency detuning multiplier
    @Parameter(detuningMultiplierDef) public var detuningMultiplier: AUValue

    // MARK: - Initialization

    /// Initialize this oscillator node
    ///
    /// - Parameters:
    ///   - waveform: The waveform of oscillation
    ///   - frequency: Frequency in cycles per second
    ///   - amplitude: Output Amplitude.
    ///   - phaseDistortion: Amount of distortion, within the range [-1, 1]. 0 is no distortion.
    ///   - detuningOffset: Frequency offset in Hz.
    ///   - detuningMultiplier: Frequency detuning multiplier
    ///
    public init(
        waveform: Table = Table(.sine),
        frequency: AUValue = frequencyDef.defaultValue,
        amplitude: AUValue = amplitudeDef.defaultValue,
        phaseDistortion: AUValue = phaseDistortionDef.defaultValue,
        detuningOffset: AUValue = detuningOffsetDef.defaultValue,
        detuningMultiplier: AUValue = detuningMultiplierDef.defaultValue
    ) {
        setupParameters()

        self.stop()

        au.setWavetable(waveform.content)

        self.waveform = waveform
        self.frequency = frequency
        self.amplitude = amplitude
        self.phaseDistortion = phaseDistortion
        self.detuningOffset = detuningOffset
        self.detuningMultiplier = detuningMultiplier
    }
}
