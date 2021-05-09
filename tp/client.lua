
function rota(  )

if isPedDead ( localPlayer ) then
	outputChatBox("No puedes usar el comando, muerto.",255,0,0,true)
  else
  x,y,z = getElementRotation (localPlayer)
outputChatBox("Tu rotacion es: "..x.."  "..y.."  "..z..".")
  end
end
addCommandHandler("pos",rota)


