//
//  CardViewController.swift
//  cardgame
//
//  Created by calvin.chang on 2018/4/10.
//  Copyright © 2018年 calvin.chang. All rights reserved.
//

import UIKit
import GameplayKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var CardBt1: UIButton!
    @IBOutlet weak var CardBt2: UIButton!
    @IBOutlet weak var CardBt3: UIButton!
    @IBOutlet weak var CardBt4: UIButton!
    @IBOutlet weak var CardBt5: UIButton!
    @IBOutlet weak var CardBt6: UIButton!
    @IBOutlet weak var CardBt7: UIButton!
    @IBOutlet weak var CardBt8: UIButton!
    @IBOutlet weak var CardBt9: UIButton!
    @IBOutlet weak var CardBt10: UIButton!
    @IBOutlet weak var CardBt11: UIButton!
    @IBOutlet weak var CardBt12: UIButton!
    @IBOutlet weak var CardBt13: UIButton!
    @IBOutlet weak var CardBt14: UIButton!
    @IBOutlet weak var CardBt15: UIButton!
    @IBOutlet weak var CardBt16: UIButton!
    @IBOutlet weak var CardBt17: UIButton!
    @IBOutlet weak var CardBt18: UIButton!
    @IBOutlet weak var CardBt19: UIButton!
    @IBOutlet weak var CardBt20: UIButton!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var countdownLable: UILabel!
    
    var CardBt : [UIButton] = [UIButton]()
    
    let CardImage: [[UIImage]] = [
        [
            UIImage(named: "NBA")!,
            UIImage(named: "76ers.png")!,
            UIImage(named: "bucks.png")!,
            UIImage(named: "bulls.png")!,
            UIImage(named: "cavaliers.png")!,
            UIImage(named: "celtics.png")!,
            UIImage(named: "clippers.png")!,
            UIImage(named: "grizzlies.png")!,
            UIImage(named: "hawks.png")!,
            UIImage(named: "hornets.png")!,
            UIImage(named: "knicks.png")!,
            UIImage(named: "lakers.png")!,
            UIImage(named: "nets.png")!,
            UIImage(named: "nuggets.png")!,
            UIImage(named: "pacers.png")!,
            UIImage(named: "pelicans.png")!,
            UIImage(named: "pistons.png")!,
            UIImage(named: "thunder.png")!,
            UIImage(named: "timberwolves.png")!,
            UIImage(named: "warriors.png")!,
            UIImage(named: "wizards.png")!,
        ],
        [
            UIImage(named: "headcoach")!,
            UIImage(named: "1")!,
            UIImage(named: "2")!,
            UIImage(named: "3")!,
            UIImage(named: "4")!,
            UIImage(named: "5")!,
            UIImage(named: "6")!,
            UIImage(named: "7")!,
            UIImage(named: "8")!,
            UIImage(named: "9")!,
            UIImage(named: "10")!,
            UIImage(named: "11")!,
            UIImage(named: "12")!,
            UIImage(named: "13")!,
            UIImage(named: "14")!,
            UIImage(named: "15")!,
            UIImage(named: "16")!,
            UIImage(named: "17")!,
            UIImage(named: "18")!,
            UIImage(named: "19")!,
            UIImage(named: "20")!,
        ],
        [
            UIImage(named: "animal")!,
            UIImage(named: "a1")!,
            UIImage(named: "a2")!,
            UIImage(named: "a3")!,
            UIImage(named: "a4")!,
            UIImage(named: "a5")!,
            UIImage(named: "a6")!,
            UIImage(named: "a7")!,
            UIImage(named: "a8")!,
            UIImage(named: "a9")!,
            UIImage(named: "a10")!,
            UIImage(named: "a11")!,
            UIImage(named: "a12")!,
            UIImage(named: "a13")!,
            UIImage(named: "a14")!,
            UIImage(named: "a15")!,
        ],
        [
            UIImage(named: "lakers")!,
            UIImage(named: "l1")!,
            UIImage(named: "l2")!,
            UIImage(named: "l3")!,
            UIImage(named: "l4")!,
            UIImage(named: "l5")!,
            UIImage(named: "l6")!,
            UIImage(named: "l7")!,
            UIImage(named: "l8")!,
            UIImage(named: "l9")!,
            UIImage(named: "l10")!,
        ],
    ]

    
    var AnswerCard: [Int] = [Int]()
    var gameStep:Int = 0
    var fristCard:Int = 0
    var secondCard:Int = 0
    var bingoNumber = 0
    var theme = 0
    
    var counter = 0.0
    var timer = Timer()
    var score = 0;
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        CardBt.append(CardBt1)
        CardBt.append(CardBt2)
        CardBt.append(CardBt3)
        CardBt.append(CardBt4)
        CardBt.append(CardBt5)
        CardBt.append(CardBt6)
        CardBt.append(CardBt7)
        CardBt.append(CardBt8)
        CardBt.append(CardBt9)
        CardBt.append(CardBt10)
        CardBt.append(CardBt11)
        CardBt.append(CardBt12)
        CardBt.append(CardBt13)
        CardBt.append(CardBt14)
        CardBt.append(CardBt15)
        CardBt.append(CardBt16)
        CardBt.append(CardBt17)
        CardBt.append(CardBt18)
        CardBt.append(CardBt19)
        CardBt.append(CardBt20)
        
        creatTopic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func reStart(_ sender: Any) {
        creatTopic()
    }
    
    @IBAction func cardSelect(_ sender: UIButton) {
        var cardNumber:Int = 0
        
        for i in 0...(CardBt.count-1){
            if(sender.restorationIdentifier! == CardBt[i].restorationIdentifier!){
                cardNumber = i
                break
            }
        }

        switch gameStep{
        case 1:
            fristCard = cardNumber
            CardBt[fristCard].setImage(CardImage[theme][AnswerCard[fristCard]],for: UIControlState.normal)
            gameStep=2
        case 2:
            if(fristCard != cardNumber){
                secondCard = cardNumber
                CardBt[secondCard].setImage(CardImage[theme][AnswerCard[secondCard]],for: UIControlState.normal)
                gameStep=3
                
                if(AnswerCard[fristCard] == AnswerCard[secondCard]){
                    score+=100
                    bingoNumber+=1
                    
                    print("bingoNumber=\(bingoNumber)")
                    if(bingoNumber >= 10){
                        timer.invalidate()
                        gameStep=0
                        
                        for i in 0...(CardBt.count-1){
                            CardBt[i].setImage(CardImage[theme][AnswerCard[i]],for: UIControlState.normal)
                            CardBt[i].backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
                            CardBt[i].isEnabled = true
                        }
                        
                        
                        let minutesLeft = Int(counter / 60) % 60
                        let secondsLeft = Int(counter) % 60
                        let minisecondsLeft = Int(counter*10) % 10
                        let total = score - Int(counter)
                        resultLable.isHidden=false
                        resultLable.text=String(format: "RESULT\nTIME\n%02d:%02d.%01d\n\nSCORE\n%d\n\nTOTAL\n%d", minutesLeft ,secondsLeft, minisecondsLeft,score,total)
                    }
                }else{
                    score-=10
                }
                scoreLable.text = String(format: "SCORE\n%04d", score)
            }
                            
        case 3:
            if(AnswerCard[fristCard] == AnswerCard[secondCard]){
                CardBt[fristCard].backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
                CardBt[fristCard].setImage(nil,for: UIControlState.normal)
                CardBt[fristCard].isEnabled=false
                CardBt[secondCard].backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
                CardBt[secondCard].setImage(nil,for: UIControlState.normal)
                CardBt[secondCard].isEnabled=false
                
                if((cardNumber != fristCard) && (cardNumber != secondCard)){
                    fristCard = cardNumber
                    CardBt[fristCard].setImage(CardImage[theme][AnswerCard[fristCard]],for: UIControlState.normal)
                    gameStep=2
                }
            }else{
                CardBt[fristCard].setImage(CardImage[theme][0],for: UIControlState.normal)
                CardBt[secondCard].setImage(CardImage[theme][0],for: UIControlState.normal)
                
                
                fristCard = cardNumber
                CardBt[fristCard].setImage(CardImage[theme][AnswerCard[fristCard]],for: UIControlState.normal)
                gameStep=2
            }
            
        default:
            gameStep = 0
        }
    }
    
    func creatTopic(){
        var cardBuf:[Int] = [Int]()
        let randomDistribution1 = GKRandomDistribution(lowestValue: 0, highestValue: CardImage.count - 1)
        theme = randomDistribution1.nextInt()
        
        let randomDistribution2 = GKShuffledDistribution(lowestValue: 1, highestValue:CardImage[theme].count-1)
        //產生十個問題index
        for _ in 0...9{
            cardBuf.append(randomDistribution2.nextInt())
        }
        
        //copy 十個問題index
        for i in 0...9{
            cardBuf.append(cardBuf[i])
        }
        
        //亂數排序問題
        AnswerCard.removeAll()
        let randomDistribution3 = GKShuffledDistribution(lowestValue: 0, highestValue:cardBuf.count-1)
        for _ in 0...(cardBuf.count-1){
            AnswerCard.append(cardBuf[randomDistribution3.nextInt()])
        }
        
        gameStep = 0
        bingoNumber = 0
        counter = 0.0
        score = 0
        resultLable.isHidden=true
        
        countdownLable.isHidden=false
        

        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timeLable.text = String(format: "TIME\n%02d:%02d.%01d", 0 ,0, 0)
        scoreLable.text = String(format: "SCORE\n%04d", 0)
        
          for i in 0...(CardBt.count-1){
//            CardBt[i].setImage(CardImage[theme][0],for: UIControlState.normal)
            CardBt[i].setImage(CardImage[theme][AnswerCard[i]],for: UIControlState.normal)
            CardBt[i].backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            CardBt[i].isEnabled=true
            
            if(theme == 3){
                CardBt[i].imageView!.contentMode = UIViewContentMode.scaleToFill
            }else{
                CardBt[i].imageView!.contentMode = UIViewContentMode.scaleAspectFit
            }
        }

        for bt in CardBt{
            bt.isEnabled=true
        }
    }
    
    @objc func updateTimer() {
        counter+=0.1
        
        if(gameStep > 0){
            let minutesLeft = Int(counter / 60) % 60
            let secondsLeft = Int(counter) % 60
            let minisecondsLeft = Int(counter*10) % 10
            timeLable.text = String(format: "TIME\n%02d:%02d.%01d", minutesLeft ,secondsLeft, minisecondsLeft)
        }else if(counter > 5.5) && (gameStep == 0){
            counter = 0.0
            gameStep = 1
            for i in 0...(CardBt.count-1){
               CardBt[i].setImage(CardImage[theme][0],for: UIControlState.normal)
            }
            countdownLable.isHidden=true
        }
        else{
             countdownLable.text = String(5 - Int(counter))
        }
    }
}
