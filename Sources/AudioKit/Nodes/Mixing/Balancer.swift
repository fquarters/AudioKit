// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AVFoundation
import CAudioKit

/// This node outputs a version of the audio source, amplitude-modified so
/// that its rms power is equal to that of the comparator audio source. Thus a
/// signal that has suffered loss of power (eg., in passing through a filter
/// bank) can be restored by matching it with, for instance, its own source. It
/// should be noted that this modifies amplitude only; output signal is not
/// altered in any other respect.
///
public class Balancer: Node {

    var input: Node
    var comparator: Node
    
    /// Connected nodes
    public var connections: [Node] {
        get {
            [input, comparator]
        }
        set {
            input = newValue[0]
            comparator = newValue[1]
        }
    }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "blnc")
    
    // MARK: - Initialization

    /// Initialize this balance node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - comparator: Audio to match power with
    ///
    public init(_ input: Node, comparator: Node) {
        self.input = input
        self.comparator = comparator
    }
}
