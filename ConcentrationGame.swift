//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Elisei Mishchenko on 25.05.2021.
//

import Foundation

struct ConcentrationGame {
    
   private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            
            return cards.indices.filter { cards[$0].isFaseUp }.oneAndOnly
   //         return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
    /*        var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaseUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex */
        }
        set {
            for index in cards.indices {
                cards[index].isFaseUp = (index == newValue)
                
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index]{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaseUp = true
            }else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "ConcentrationGam.init(\(numberOfPairsOfCards): must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
    }
    
}

extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
}





