
### Problems (from Oliver Short)
#### 1 
After a solution is calculated and displayed, any number pressed is appended to the end of what is displayed

#### 2 
Label not limited to view while typing or for solutions

#### 3 
Except when operation is queued, hitting "=" gives invalid

#### 4 
when invalid is displayed, tapping numbers appends them to the word "invalid"



### Solutions (theoretical)
#### 1
* create new variable for result 
* display new variable
* if number -> reset
* if operator -> process as before

#### 2
* Storyboard option for autoshrink

#### 3
* prior to executing "=" button test that operation inputs are available

#### 4 
* prevent invalid display by testing operation inputs prior to "=", as above



### Implementation (semi sudo code)
#### 1 
* activate boolean variable - is user typing - as field has been filled with solution
* if displayLabel Text is coming from solution, activate boolean
* if number is tapped, and boolean is activated, number goes into display and brain is reset
* if anything else is tapped, deactivate boolean

#### 2
* In main.storyboard - attributes inspector
* AutoShrink - Minimum Font Size set to "1"

#### 3
* wrap equalTapped IBAction in if statement
* if statement tests whether crucial operationType component of operation is available and runs code if true
* else runs nothing

#### 4
* solution created by above actions





