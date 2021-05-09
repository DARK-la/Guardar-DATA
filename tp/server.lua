


marcador1 = createMarker ( 1555 , -1675.7, 15, "cylinder", 1.5, 0,  0, 255,  255,  getRootElement( )  )
marcador2 = createMarker ( 238.68115 , 139.1289, 1002, "cylinder", 1.5, 0,  0, 255,  255,  getRootElement( )  )

setElementDimension ( marcador2,0 )
setElementInterior ( marcador2,3 )

function puertaEntrar(hitElement)

     setElementDimension ( hitElement,0 )
     setElementInterior ( hitElement,3 )
     setElementPosition(hitElement,243,143,1003)
     setElementRotation (hitElement,0,0,3)
	outputChatBox("Entrado a comisaria.")
   end
 

addEventHandler("onMarkerHit", marcador1, puertaEntrar)


function puertaSalir(hitElement)
	
     setElementDimension ( hitElement,0 )
     setElementInterior ( hitElement,0 )
     setElementPosition(hitElement,1550,-1676,15)
     setElementRotation (hitElement,0,0,86)
     
	outputChatBox("Saliste de comisaria.")
end
addEventHandler("onMarkerHit", marcador2, puertaSalir)



function tp1(source)
	if isPedDead ( source ) then
	outputChatBox("No puedes usar el comando, muerto.",source,255,0,0,true)
  else
	setElementDimension (source,0 )
     setElementInterior (source,0)
	setElementPosition(source,1550,-1676,15)
	end
end
addCommandHandler("tp",tp1)


addEventHandler("onPlayerQuit",root, 
function() 
     local acc = getPlayerAccount(source) 
     if (acc) and not isGuestAccount(acc) then 
          local x,y,z = getElementPosition(source) 
          local money = getPlayerMoney(source) 
          local Dimension1 = getElementDimension (source)
          local Interior1 = getElementInterior ( source)
          local skin1 = getPlayerSkin (source)
          local armas1 = getPedWeapon ( source)
          local armadura =  getPedArmor (source)
          local vida1 =  getElementHealth (source)

          setAccountData(acc,"PosX",x) 
          setAccountData(acc,"PosY",y) 
          setAccountData(acc,"PosZ",z) 

          setAccountData(acc,"DIMEN",Dimension1)
          setAccountData(acc,"INTERIO",Interior1) 

          setAccountData(acc,"skinS",skin1)
          setAccountData(acc,"Money",money)
          setAccountData(acc,"armasJ",armas1)
          
          setAccountData(acc,"armadura",armadura)
          setAccountData(acc,"vida",vida1)
          
     end 
end) 
  
addEventHandler("onPlayerLogin",root, 
function(_,acc) 
     local x,y,z = getAccountData(acc,"PosX"),getAccountData(acc,"PosY"),getAccountData(acc,"PosZ") 
     local Money = getAccountData(acc,"Money") 

     local Dimension = getAccountData(acc,"DIMEN")
     local Interior = getAccountData(acc,"INTERIO")

     local tenerskin = getAccountData(acc,"skinS")
     local armasJuagador = getAccountData(acc,"armasJ")

     local Municion1 = getAccountData(acc,"Muncion")

     local armor = getAccountData(acc,"armadura")
    local vidaJ = getAccountData(acc,"vida")

     setPlayerMoney(source,Money)
     spawnPlayer(source,x,y,z,0,0,Interior,Dimension)
     setPlayerSkin ( source, tenerskin ) 
      setPedArmor (source,armor)
      setElementHealth (source,vidaJ)
     setCameraTarget(source)
     giveWeapon(source,armasJuagador)


     outputChatBox("Datos cargdos, Correctamente...",source,0,255,0,true)
end)

