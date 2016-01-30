//
//  AKHighShelfFilterWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import Foundation
import Cocoa

/// A Window to control AKHighShelfFilter in Playgrounds
public class AKHighShelfFilterWindow: NSWindow {
    
    private let windowWidth = 400
    private let padding = 30
    private let sliderHeight = 20
    private let numberOfComponents = 2
    
    /// Slider to control cutOffFrequency
    public let cutOffFrequencySlider: NSSlider
    /// Slider to control gain
    public let gainSlider: NSSlider
    
    private let cutOffFrequencyTextField: NSTextField
    private let gainTextField: NSTextField
    
    private var highShelfFilter: AKHighShelfFilter
    
    /// Initiate the AKHighShelfFilter window
    public init(_ control: AKHighShelfFilter) {
        highShelfFilter = control
        let sliderWidth = windowWidth - 2 * padding
        
        cutOffFrequencySlider = newSlider(sliderWidth)
        gainSlider = newSlider(sliderWidth)
        
        cutOffFrequencyTextField = newTextField(sliderWidth)
        gainTextField = newTextField(sliderWidth)
        
        let titleHeightApproximation = 50
        let windowHeight = padding * 2 + titleHeightApproximation + numberOfComponents * 3 * sliderHeight
        
        super.init(contentRect: NSRect(x: padding, y: padding, width: windowWidth, height: windowHeight),
            styleMask: NSTitledWindowMask,
            backing: .Buffered,
            defer: false)
        self.hasShadow = true
        self.styleMask = NSBorderlessWindowMask | NSResizableWindowMask
        self.movableByWindowBackground = true
        self.level = 7
        self.title = "AKHighShelfFilter"
        
        let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
        let view = NSView(frame: viewRect)
        
        let topTitle = NSTextField()
        topTitle.stringValue = "AKHighShelfFilter"
        topTitle.editable = false
        topTitle.drawsBackground = false
        topTitle.bezeled = false
        topTitle.alignment = NSCenterTextAlignment
        topTitle.font = NSFont(name: "Lucida Grande", size: 24)
        topTitle.sizeToFit()
        topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
        topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
        view.addSubview(topTitle)
        
        makeTextField(cutOffFrequencyTextField, view: view, below: topTitle, distance: 2,
            stringValue: "Cut Off Frequency: \(highShelfFilter.cutOffFrequency) Hz")
        makeSlider(cutOffFrequencySlider, view: view, below: topTitle, distance: 3, target: self,
            action: "updateCutofffrequency",
            currentValue: highShelfFilter.cutOffFrequency,
            minimumValue: 10000,
            maximumValue: 22050)
        
        makeTextField(gainTextField, view: view, below: topTitle, distance: 5,
            stringValue: "Gain: \(highShelfFilter.gain) dB")
        makeSlider(gainSlider, view: view, below: topTitle, distance: 6, target: self,
            action: "updateGain",
            currentValue: highShelfFilter.gain,
            minimumValue: -40,
            maximumValue: 40)
        
        self.contentView!.addSubview(view)
        self.makeKeyAndOrderFront(nil)
    }
    
    internal func updateCutofffrequency() {
        highShelfFilter.cutOffFrequency = cutOffFrequencySlider.doubleValue
        cutOffFrequencyTextField.stringValue =
        "Cut Off Frequency \(String(format: "%0.4f", highShelfFilter.cutOffFrequency)) Hz"
    }
    internal func updateGain() {
        highShelfFilter.gain = gainSlider.doubleValue
        gainTextField.stringValue =
        "Gain \(String(format: "%0.4f", highShelfFilter.gain)) dB"
    }
    
    /// Required initializer
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

