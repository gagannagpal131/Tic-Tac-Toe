//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Gagandeep Nagpal on 26/06/16.
//  Copyright © 2016 Gagandeep Nagpal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var player = 1 // 1 =  cross and 2 = circle
    
    @IBOutlet var result: UILabel!
    
    @IBOutlet var button: UIButton!
    
    
    @IBOutlet var PlayAgainButton: UIButton!
    
    var active = true
    
    var buttonState = [-1,0,0,0,0,0,0,0,0,0] // 0 = empty and 1 = cross and 2 = cross
    
    
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        
        
        if (buttonState[sender.tag] == 0 && active == true)
            
        {
        
        if player ==  1{
        
        sender.setImage(UIImage(named:"cross.png"), forState: .Normal)
          
          buttonState[sender.tag] = 1
            
          player = 2
            
        }
        
        else{
            
            
            sender.setImage(UIImage(named: "nought.png"), forState:.Normal)
            
            player = 1
            
            buttonState[sender.tag] = 2
        }
            
          
            
            
        }
        
      
    checkForDraw()
    checkWinner()
        
        
    }
    
    
    func checkWinner() -> Void{
        
        
        let winningComnbinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[1,5,9],[3,5,7]]
        
        for var i in winningComnbinations{
            
            
            if (buttonState[i[0]] != 0 && buttonState[i[0]] == buttonState[i[1]] && buttonState[i[1]] == buttonState[i[2]])
            {
                
                active = false
                
                if (buttonState[i[0]] == 1 ){
                
                    result.hidden = false
                    
                    UIView.animateWithDuration(1, animations: {
                        
                        self.result.alpha = 1
                        self.PlayAgainButton.hidden = false
                        self.PlayAgainButton.alpha = 1
                        
                        
                    })
                    result.text = " Crosses have won "
                    
                }
                
                else{
                    
                    result.hidden =  false
                    
                    
                    UIView.animateWithDuration(1, animations: {
                        
                        self.result.alpha = 1
                        self.PlayAgainButton.hidden = false
                        self.PlayAgainButton.alpha = 1
                        
                        
                    })

                    
                    result.text = "circles have won"
                    
                }
               
                
              
                
            }
            
            
        }
        
        
        
    }
    
        func checkForDraw() ->Void{
            
            
            
            var flag = 0
            
            for i in 1...9{
                
                if buttonState[i] == 0{
                    
                    flag = 1
                }
                
            }
            
            
            if (flag == 0){
                
                active = false
                
                result.hidden = false
                
                UIView.animateWithDuration(1, animations: {
                    
                    self.result.alpha = 1
                    self.result.text = "It's a Draw"
                    
                     self.PlayAgainButton.hidden = false
                    self.PlayAgainButton.alpha = 1
                    
                    
                    
                })
                
                
                
                
                
            }
            
            
            
    }
    

    
    @IBAction func newGame(sender: AnyObject) {
        
        
        var resetbutton:UIButton
        
        for i in 1...9 {
            
         
          resetbutton = view.viewWithTag(i) as! UIButton
            
          resetbutton.setImage(nil, forState: .Normal)
            
        }
        
        
        PlayAgainButton.hidden = true
        PlayAgainButton.alpha = 0
        
         result.hidden = true
         result.alpha = 0
        
        buttonState = [-1,0,0,0,0,0,0,0,0,0]
        
        active  = true
        
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.hidden = true
        result.alpha = 0
        
        PlayAgainButton.hidden = true
        
        PlayAgainButton.alpha = 0
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

