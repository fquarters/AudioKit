// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// Moog Ladder is an new digital implementation of the Moog ladder filter 
/// based on the work of Antti Huovilainen, described in the paper 
/// "Non-Linear Digital Implementation of the Moog Ladder Filter" (Proceedings of DaFX04, Univ of Napoli).
/// This implementation is probably a more accurate digital representation of the original analogue filter.
/// 
public class MoogLadder: Node {

    var input: Node

    /// Connected nodes
    public var connections: [Node] {
        get {
            [input]
        }
        set {
            input = newValue[0]
        }
    }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "mgld")

    // MARK: - Parameters

    /// Specification details for cutoffFrequency
    public static let cutoffFrequencyDef = NodeParameterDef(
        identifier: "cutoffFrequency",
        name: "Cutoff Frequency (Hz)",
        address: akGetParameterAddress("MoogLadderParameterCutoffFrequency"),
        defaultValue: 1_000,
        range: 12.0 ... 20_000.0,
        unit: .hertz)

    /// Filter cutoff frequency.
    @Parameter(cutoffFrequencyDef) public var cutoffFrequency: AUValue

    /// Specification details for resonance
    public static let resonanceDef = NodeParameterDef(
        identifier: "resonance",
        name: "Resonance (%)",
        address: akGetParameterAddress("MoogLadderParameterResonance"),
        defaultValue: 0.5,
        range: 0.0 ... 2.0,
        unit: .percent)

    /// Resonance, generally < 1, but not limited to it. Higher than 1 resonance values might cause aliasing, analogue synths generally allow resonances to be above 1.
    @Parameter(resonanceDef) public var resonance: AUValue

    // MARK: - Initialization

    /// Initialize this filter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - cutoffFrequency: Filter cutoff frequency.
    ///   - resonance: Resonance, generally < 1, but not limited to it. Higher than 1 resonance values might cause aliasing, analogue synths generally allow resonances to be above 1.
    ///
    public init(
        _ input: Node,
        cutoffFrequency: AUValue = cutoffFrequencyDef.defaultValue,
        resonance: AUValue = resonanceDef.defaultValue
        ) {
        self.input = input

        setupParameters()

        self.cutoffFrequency = cutoffFrequency
        self.resonance = resonance
   }
}
