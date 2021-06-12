// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AudioKit
import XCTest

class ExpanderTests: XCTestCase {

    func testDefault() {
        let engine = AudioEngine()
        let url = Bundle.module.url(forResource: "12345", withExtension: "wav", subdirectory: "TestResources")!
        let input = AudioPlayer(url: url)!
        engine.output = Expander(input)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
// TODO: Figure out why this and Dynamics Processor give different results on CI
//        testMD5(audio)

    }
}
