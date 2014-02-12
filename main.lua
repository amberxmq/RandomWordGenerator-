--Mengqi Xu
--Shake to get a random sentence


display.setStatusBar( display.HiddenStatusBar )

local background = display.newImage( "industrialBackground.jpg", 160, 240 )
local Names={"Lily","Amanda","Cindy","Christine"}
local Verbs={"eating.","sleeping.","reading.","singing.","laughing."}
local myText = display.newText("Shake to get a random sentence",162,100,"Handwriting-Dakota",20)
	  myText:setTextColor(255,0,0,10)

local function onShake(event)
	
	if event.isShake then

	local namesIndex=math.random(1,4)
	local verbsIndex=math.random(1,5)
	local randomName = display.newText(Names[namesIndex], 160,200,"Chalkduster",50)
	randomName:setTextColor(255,255,0,255)
	local Be = display.newText("is",170,250,"Ayuthaya",45)
	Be:setTextColor(0,255,55,255)
	local randomVerb = display.newText(Verbs[verbsIndex], 180,300,"Casual",40)
	randomVerb:setTextColor(255,0,55,55)

	local widget = require( "widget" )
	-- Function to handle button events
	local function handleButtonEvent( event )

    	if ( "ended" == event.phase ) then
       	 	randomName:removeSelf()
			randomName = nil   
			randomVerb:removeSelf()
			randomVerb = nil   
			Be:removeSelf()
			Be = nil 
    	end
	end

	-- Create the widget
	local button1 = widget.newButton
	{
    	left = 100,
    	top = 400,
    	id = "button1",
    	label = "Click Me before Shake Again",
    	onEvent = handleButtonEvent
	}

	end

end

Runtime:addEventListener("accelerometer",onShake,0)


