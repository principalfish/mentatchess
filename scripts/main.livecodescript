script "main"
------------------------------------------------------
-- Debugging 
------------------------------------------------------

on libraryStack
   put  "here" & LF after msg
   _setupStack
end libraryStack



------------------------------------------------------
-- Debugging 
------------------------------------------------------

on restartStack
   send "openStack" to mainCard()
end restartStack
