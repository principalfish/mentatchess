﻿script "utils"
local sRootFolder

on libraryStack
   set the itemdel to slash
   if the short name of the target is "utils" then
      put item 1 to -3 of the fileName of this stack into sRootFolder
   end if
end libraryStack

------------------------------------------------------
-- stack / card handlers
------------------------------------------------------

function mainCard
   return the long id of card id 1002 of stack "mentatchess"
end mainCard

function mainStackRef
   put pathJoin(scriptFolder(), "main.livecodescript")
   return pathJoin(scriptFolder(), "main.livecodescript")
end mainStackRef


------------------------------------------------------
-- Path handlers
------------------------------------------------------

function root
   return sRootFolder
end root

function iconFolder
   return pathJoin(root(), "icons")
end iconFolder

function scriptFolder
   return pathJoin(root(), "scripts")
end scriptFolder

function behaviourFolder
   return pathJoin(scriptFolder(), "behaviours")
end behaviourFolder

--
-- Return true is pPath is absolute
--
function pathIsAbs pPath
   return codeunit 1 of pPath is "/"
end pathIsAbs

--
-- given paths a,b,...,z, join with '/' and return 
--
function pathJoin
   local tPath
   repeat with i = 1 to the paramCount
      local tComponent
      put param(i) into tComponent
      if tComponent is not empty and \
            i is not the paramCount then
         put slash after tComponent
      end if
      if pathIsAbs(tComponent) then
         put tComponent into tPath
      else
         put tComponent after tPath
      end if
   end repeat
   return tPath for value
end pathJoin
