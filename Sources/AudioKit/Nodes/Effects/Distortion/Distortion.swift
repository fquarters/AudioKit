// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation

/// AudioKit version of Apple's Distortion Audio Unit
///
public class Distortion: Node {

    fileprivate let effectAU = AVAudioUnitEffect(appleEffect: kAudioUnitSubType_Distortion)

    let input: Node
    public var connections: [Node] { [input] }
    public var avAudioNode: AVAudioNode { effectAU }

    /// Specification details for delay
    public static let delayDef = NodeParameterDef(
        identifier: "delay",
        name: "Delay",
        address: 0,
        defaultValue: 0.1,
        range: 0.1 ... 500,
        unit: .milliseconds)

    /// Delay (Milliseconds) ranges from 0.1 to 500 (Default: 0.1)
    @Parameter(delayDef) public var delay: AUValue

    /// Specification details for decay
    public static let decayDef = NodeParameterDef(
        identifier: "decay",
        name: "Decay",
        address: 1,
        defaultValue: 1.0,
        range: 0.1 ... 50,
        unit: .rate)

    /// Decay (Rate) ranges from 0.1 to 50 (Default: 1.0)
    @Parameter(decayDef) public var decay: AUValue

    /// Specification details for delayMix
    public static let delayMixDef = NodeParameterDef(
        identifier: "delayMix",
        name: "Delay Mix",
        address: 2,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Delay Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(delayMixDef) public var delayMix: AUValue

    /// Specification details for ringModFreq1
    public static let ringModFreq1Def = NodeParameterDef(
        identifier: "ringModFreq1",
        name: "Ring Mod Freq1",
        address: 3,
        defaultValue: 100,
        range: 0.5 ... 8000,
        unit: .hertz)

    /// Ring Mod Freq1 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    @Parameter(ringModFreq1Def) public var ringModFreq1: AUValue

    /// Specification details for ringModFreq2
    public static let ringModFreq2Def = NodeParameterDef(
        identifier: "ringModFreq2",
        name: "Ring Mod Freq2",
        address: 4,
        defaultValue: 100,
        range: 0.5 ... 8000,
        unit: .hertz)

    /// Ring Mod Freq2 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    @Parameter(ringModFreq2Def) public var ringModFreq2: AUValue

    /// Specification details for ringModBalance
    public static let ringModBalanceDef = NodeParameterDef(
        identifier: "ringModBalance",
        name: "Ring Mod Balance",
        address: 5,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Ring Mod Balance (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(ringModBalanceDef) public var ringModBalance: AUValue

    /// Specification details for ringModMix
    public static let ringModMixDef = NodeParameterDef(
        identifier: "ringModMix",
        name: "Ring Mod Mix",
        address: 6,
        defaultValue: 0,
        range: 0 ... 100,
        unit: .percent)

    /// Ring Mod Mix (Percent) ranges from 0 to 100 (Default: 0)
    @Parameter(ringModMixDef) public var ringModMix: AUValue

    /// Specification details for decimation
    public static let decimationDef = NodeParameterDef(
        identifier: "decimation",
        name: "Decimation",
        address: 7,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Decimation (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(decimationDef) public var decimation: AUValue

    /// Specification details for rounding
    public static let roundingDef = NodeParameterDef(
        identifier: "rounding",
        name: "Rounding",
        address: 8,
        defaultValue: 0,
        range: 0 ... 100,
        unit: .percent)

    /// Rounding (Percent) ranges from 0 to 100 (Default: 0)
    @Parameter(roundingDef) public var rounding: AUValue

    /// Specification details for decimationMix
    public static let decimationMixDef = NodeParameterDef(
        identifier: "decimationMix",
        name: "Decimation Mix",
        address: 9,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Decimation Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(decimationMixDef) public var decimationMix: AUValue

    /// Specification details for linearTerm
    public static let linearTermDef = NodeParameterDef(
        identifier: "linearTerm",
        name: "Linear Term",
        address: 10,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Linear Term (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(linearTermDef) public var linearTerm: AUValue

    /// Specification details for squaredTerm
    public static let squaredTermDef = NodeParameterDef(
        identifier: "squaredTerm",
        name: "Squared Term",
        address: 11,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Squared Term (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(squaredTermDef) public var squaredTerm: AUValue

    /// Specification details for cubicTerm
    public static let cubicTermDef = NodeParameterDef(
        identifier: "cubicTerm",
        name: "Cubic Term",
        address: 12,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Cubic Term (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(cubicTermDef) public var cubicTerm: AUValue

    /// Specification details for polynomialMix
    public static let polynomialMixDef = NodeParameterDef(
        identifier: "polynomialMix",
        name: "Polynomial Mix",
        address: 13,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Polynomial Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(polynomialMixDef) public var polynomialMix: AUValue

    /// Specification details for softClipGain
    public static let softClipGainDef = NodeParameterDef(
        identifier: "softClipGain",
        name: "Soft Clip Gain",
        address: 14,
        defaultValue: -6,
        range: -80 ... 20,
        unit: .decibels)

    /// Soft Clip Gain (decibels) ranges from -80 to 20 (Default: -6)
    @Parameter(softClipGainDef) public var softClipGain: AUValue

    /// Specification details for finalMix
    public static let finalMixDef = NodeParameterDef(
        identifier: "finalMix",
        name: "Final Mix",
        address: 15,
        defaultValue: 50,
        range: 0 ... 100,
        unit: .percent)

    /// Final Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter(finalMixDef) public var finalMix: AUValue

    /// Tells whether the node is processing (ie. started, playing, or active)
    public var isStarted = true

    /// Initialize the distortion node
    ///
    /// - parameter input: Input node to process
    /// - parameter delay: Delay (Milliseconds) ranges from 0.1 to 500 (Default: 0.1)
    /// - parameter decay: Decay (Rate) ranges from 0.1 to 50 (Default: 1.0)
    /// - parameter delayMix: Delay Mix (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter ringModFreq1: Ring Mod Freq1 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    /// - parameter ringModFreq2: Ring Mod Freq2 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    /// - parameter ringModBalance: Ring Mod Balance (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter ringModMix: Ring Mod Mix (Percent) ranges from 0 to 100 (Default: 0)
    /// - parameter decimation: Decimation (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter rounding: Rounding (Percent) ranges from 0 to 100 (Default: 0)
    /// - parameter decimationMix: Decimation Mix (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter linearTerm: Linear Term (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter squaredTerm: Squared Term (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter cubicTerm: Cubic Term (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter polynomialMix: Polynomial Mix (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter softClipGain: Soft Clip Gain (decibels) ranges from -80 to 20 (Default: -6)
    /// - parameter finalMix: Final Mix (Percent) ranges from 0 to 100 (Default: 50)
    ///
    public init(
        _ input: Node,
        delay: AUValue = delayDef.defaultValue,
        decay: AUValue = decayDef.defaultValue,
        delayMix: AUValue = delayMixDef.defaultValue,
        ringModFreq1: AUValue = ringModFreq1Def.defaultValue,
        ringModFreq2: AUValue = ringModFreq2Def.defaultValue,
        ringModBalance: AUValue = ringModBalanceDef.defaultValue,
        ringModMix: AUValue = ringModMixDef.defaultValue,
        decimation: AUValue = decimationDef.defaultValue,
        rounding: AUValue = roundingDef.defaultValue,
        decimationMix: AUValue = decimationMixDef.defaultValue,
        linearTerm: AUValue = linearTermDef.defaultValue,
        squaredTerm: AUValue = squaredTermDef.defaultValue,
        cubicTerm: AUValue = cubicTermDef.defaultValue,
        polynomialMix: AUValue = polynomialMixDef.defaultValue,
        softClipGain: AUValue = softClipGainDef.defaultValue,
        finalMix: AUValue = finalMixDef.defaultValue) {
        self.input = input

        associateParams(with: effectAU)

        self.delay = delay
        self.decay = decay
        self.delayMix = delayMix
        self.ringModFreq1 = ringModFreq1
        self.ringModFreq2 = ringModFreq2
        self.ringModBalance = ringModBalance
        self.ringModMix = ringModMix
        self.decimation = decimation
        self.rounding = rounding
        self.decimationMix = decimationMix
        self.linearTerm = linearTerm
        self.squaredTerm = squaredTerm
        self.cubicTerm = cubicTerm
        self.polynomialMix = polynomialMix
        self.softClipGain = softClipGain
        self.finalMix = finalMix
    }

    /// Function to start, play, or activate the node, all do the same thing
    public func start() {
        effectAU.bypass = false
        isStarted = true
    }

    /// Function to stop or bypass the node, both are equivalent
    public func stop() {
        effectAU.bypass = true
        isStarted = false
    }
}
