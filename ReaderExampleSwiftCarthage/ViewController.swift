//
//  ViewController.swift
//  ReaderExampleSwift
//
//  Created by Evgeniy Sinev on 22/10/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

import UIKit
import PaynetEasyReader;

class ViewController: UIViewController, PNEReaderPresenter {

    var manager: PNEReaderManager!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startManager()
    }

    func startManager() {
        label.text = "Starting ..."
        
        let factory = PNEReaderFactory()
        let reader  = PNEReaderInfo(type: PNEReaderType.MIURA_OR_SPIRE)
        let amount  = NSDecimalNumber(string: "1.00")
        
        manager     = factory.createManager(reader, amount: amount, currency: "RUB", presenter: self)
        manager.start()
    }

    // MARK: - Touch Events
    
    @IBAction func didTouchStartButton(_ sender: UIButton) {
        startManager()
    }

    @IBAction func didTouchStopButton(_ sender: UIButton) {
        manager.stop()
    }
    
    // MARK: - PNEReaderPresenter methods
    
    func stateChanged(_ aEvent: PNEReaderEvent!) {
        NSLog("stateChanged: \(aEvent)")
        label.text = aEvent.description;
    }
    
    func onCard(_ aCard: PNECard!) -> PNEProcessingContinuation! {
        NSLog("Card is \(aCard)")
        return PNEProcessingContinuation(
            baseUrl: "https://paynet-qa.payneteasy.com/paynet"
            , merchantLogin: "merchant"
            , merchantKey: "123"
            , merchantEndPointId: 1
            , orderInvoiceNumber: UUID().uuidString)
    }
    
    func onCardError(_ aError: PNECardError!) {
        NSLog("onCardError: \(aError)")
        label.text = aError.description;
    }
    
    func onProcessingEvent(_ aEvent: PNEProcessingEvent!) {
        NSLog("onProcessingEvent: \(aEvent)")
        label.text = aEvent.description;
    }
    
    func onConfiguration() -> PNEConfigurationContinuation! {
        return PNEConfigurationContinuationBuilder.configurationContinuation()
            .withBaseUrl("https://gate.payneteasy.com/rki")
            .withMerchantEndPointId(1)
            .withMerchantKey("123")
            .withMerchantName("merchant name")
            .withMerchantLogin("merchant")
            .build();
    }

}

