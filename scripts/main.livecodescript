script "main"
local sMainCard

------------------------------------------------------
-- Initialization
------------------------------------------------------

on libraryStack
   put mainCard() into sMainCard
   _initialiseStack
   
end libraryStack

private command _initialiseStack
   lock screen
   _createBoard
   unlock screen
   --_createInfo
end _initialiseStack

------------------------------------------------------
-- Board handlers
------------------------------------------------------

private command _createBoard
   create group "board" in _mainCard()
   set the lockloc of it to true
   
   local tBoardSize
   
   set the width of it to _boardDimension()
   set the height of it to _boardDimension()
   
   local tColour = "black"
   local tSquareInfo
   
   repeat for each item tFile in "a,b,c,d,e,f,g,h"
      repeat with tRank = 1 to 8
         put empty into tSquareInfo
         
         local tSquareName
         put (tFile & tRank) into tSquareName
         create group (tSquareName) in _board()
         set the name of it to tSquareName
         set the behavior of it to behaviour("square")
         
         set the width of it to _squareDimension()
         set the height of it to _squareDimension()
         
         put tSquareName into tSquareInfo["name"]
         put tFile into tSquareInfo["file"]
         put tRank into tSquareInfo["rank"]
         
         if tColour = "black" then
            put "white" into tSquareInfo["colour"]
         else
            put "black" into tSquareInfo["colour"]
         end if
         
         set the squareInfo of _square(tFile, tRank) to tSquareInfo
         
      end repeat
   end repeat
   
   _setBoardState "white"
   
end _createBoard

private command _setBoardState pColour
   
end _setBoardState

------------------------------------------------------
-- Misc private handlers 
------------------------------------------------------

private function _mainCard
   return sMainCard
end _mainCard

private function _board
   return the long id of group "board" of _mainCard()
end _board

private function _squareDimension
   return 75
end _squareDimension

private function _labelDimension
   return 20
end _labelDimension

private function _boardDimension
   return 8 * _squareDimension() + _labelDimension()
end _boardDimension

private function _squareBehaviour
   return the long id of stack "square"
end _squareBehaviour
   
   ------------------------------------------------------
   -- Debugging 
   ------------------------------------------------------
on restartStack
   
   repeat with t=1 to the number of controls in mainCard()
      if there is a control t of mainCard() then
         delete control t of mainCard()
      end if
   end repeat
   
   local tRelaunchCommand, tRelaunchFile
   put pathJoin(root() & "/relaunch") into tRelaunchFile
   put "./mentatchess.livecode" into tRelaunchCommand
   put tRelaunchCommand into URL("binfile:" & tRelaunchFile )
   
end restartStack
