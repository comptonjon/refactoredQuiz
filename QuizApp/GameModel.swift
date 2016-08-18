//
//  GameModel.swift
//  TrueFalseStarter
//
//  Created by Jonathan Compton on 8/13/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit

struct GameModel {
    let questionArray:[Question]
    let numberOfQuestions = 6
    var questionsLeft:Int
    let questions = QuestionModel()
    var usedNumber:[Int] = []
    var correctQuestions:Int
    init(){
        //Assign values upon construction/initializaion
        questionArray = questions.getQuestionArray()
        questionsLeft = numberOfQuestions
        correctQuestions = 0
    }
    mutating func getQuestion()->Question{
        //return a random question from array
        let randomNumber = getRandomNumber()
        return questionArray[randomNumber]
        
        
    }
    
    mutating func getRandomNumber()->Int{
        var randomNumber = 0
        var needNumber = true
        while needNumber{
            randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(questionArray.count)
            //Check to see if random number has been used and appended to usedNumber array
            if !usedNumber.contains(randomNumber){
                //If new number, add to array
                usedNumber.append(randomNumber)
                //once question index selected, update questionsLeft
                questionsLeft -= 1
                needNumber = false
            }
        }
        
        return randomNumber
    }
    
    mutating func pointScored(){
        //update player score
        correctQuestions += 1
    }
    
    mutating func reset(){
        //return to original state for new game play
        questionsLeft = questionArray.count
        usedNumber = []
        correctQuestions = 0
    }
    
    func getScore()->Int{
        //return player score
        return correctQuestions
    }
}