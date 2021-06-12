// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import CAudioKit

/// This filter reiterates the input with an echo density determined by loop time. The attenuation rate is
/// independent and is determined by the reverberation time (defined as the time in seconds for a signal to
/// decay to 1/1000, or 60dB down from its original amplitude).  Output will begin to appear immediately.
/// 
public class FlatFrequencyResponseReverb: Node {

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
    public var avAudioNode = instantiate(effect: "alps")

    // MARK: - Parameters

    /// Specification details for reverbDuration
    public static let reverbDurationDef = NodeParameterDef(
        identifier: "reverbDuration",
        name: "Reverb Duration (Seconds)",
        address: akGetParameterAddress("FlatFrequencyResponseReverbParameterReverbDuration"),
        defaultValue: 0.5,
        range: 0 ... 10,
        unit: .seconds)

    /// Seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude.
    @Parameter(reverbDurationDef) public var reverbDuration: AUValue

    // MARK: - Initialization

    /// Initialize this reverb node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - reverbDuration: Seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude.
    ///   - loopDuration: The loop duration of the filter, in seconds. This can also be thought of as the delay time or “echo density” of the reverberation.  
    ///
    public init(
        _ input: Node,
        reverbDuration: AUValue = reverbDurationDef.defaultValue,
        loopDuration: AUValue = 0.1
        ) {
        self.input = input

        setupParameters()

        akFlatFrequencyResponseSetLoopDuration(au.dsp, loopDuration)

        self.reverbDuration = reverbDuration
   }
}
