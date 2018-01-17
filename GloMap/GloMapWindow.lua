import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";

GloMapWindow = Turbine.UI.Extensions.Window() ;

GloMapWindow:SetSize(1310, 950);
GloMapWindow:SetVisible (true);
GloMapWindow:SetPosition (500,0);
GloMapWindow:SetText ("Glorom's Map");
GloMapWindow:SetOpacity (1);
GloMapWindow:SetFadeSpeed (1);
GloMapWindow:SetStretchMode(1);

GloMapWindow.MouseEnter = function( sender, args )
	sender:SetOpacity( 1 );
end
GloMapWindow.MouseLeave = function( sender, args )
	sender:SetOpacity( 0.3 );
end

GloMapWindow.KeyDown = function( sender, args )
	if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
		sender:SetVisible( false ) 
	end
end

GloMapWindow.resizeHandle = Turbine.UI.Control();
GloMapWindow.resizeHandle:SetParent( GloMapWindow );
GloMapWindow.resizeHandle:SetZOrder( 100 );
GloMapWindow.resizeHandle:SetSize( 20, 20 );
GloMapWindow.resizeHandle:SetPosition( GloMapWindow:GetWidth() - GloMapWindow.resizeHandle:GetWidth(), GloMapWindow:GetHeight() - GloMapWindow.resizeHandle:GetHeight() );

GloMapWindow.resizeHandle.MouseDown = function( sender, args )
	sender.dragStartX = args.X;
	sender.dragStartY = args.Y;
	sender.dragging = true;
end
local GloMap = GloMapWindow;
local mainWindow = GloMapWindow;

GloMapWindow.resizeHandle.MouseMove = function( sender, args )
	local width = mainWindow:GetWidth();
	local height = mainWindow:GetHeight();

	if ( sender.dragging ) then
		mainWindow:SetSize( width + ( args.X - sender.dragStartX ), height + ( args.Y - sender.dragStartY ) );
		sender:SetPosition( mainWindow:GetWidth() - sender:GetWidth(), mainWindow:GetHeight() - sender:GetHeight() )
		GloMap:PerformLayout()
	end
end

GloMapWindow.resizeHandle.MouseUp = function( sender, args )
	sender.dragging = false;
end
-- map + town names
map = Turbine.UI.Control();
map:SetParent(GloMapWindow);
map:SetSize(1275, 840);
map:SetPosition (15,40);
map:SetBackground ("GloMap/GloMap/Resources/glomap.tga");
map:SetVisible(true);
map:SetStretchMode(1);
-- TRAVELS	
-- bree north
breeN = Turbine.UI.Control();
breeN:SetParent(map);
breeN:SetSize(1275, 840);
breeN:SetPosition (0,0);
breeN:SetBackground ("GloMap/GloMap/Resources/glomap-breenord.tga");
breeN:SetVisible(true);
breeN:SetStretchMode(1);
-- bree south
breeS = Turbine.UI.Control();
breeS:SetParent(map);
breeS:SetSize(1275, 840);
breeS:SetPosition (0,0);
breeS:SetBackground ("GloMap/GloMap/Resources/glomap-breesud.tga");
breeS:SetVisible(true);
breeS:SetStretchMode(1);
-- moria
moria = Turbine.UI.Control();
moria:SetParent(map);
moria:SetSize(1275, 840);
moria:SetPosition (0,0);
moria:SetBackground ("GloMap/GloMap/Resources/glomap-moria.tga");
moria:SetVisible(true);
moria:SetStretchMode(1);
-- eriador
eriador = Turbine.UI.Control();
eriador:SetParent(map);
eriador:SetSize(1275, 840);
eriador:SetPosition (0,0);
eriador:SetBackground ("GloMap/GloMap/Resources/glomap-eriador.tga");
eriador:SetVisible(true);
eriador:SetStretchMode(1);
-- rohan
rohan = Turbine.UI.Control();
rohan:SetParent(map);
rohan:SetSize(1275, 840);
rohan:SetPosition (0,0);
rohan:SetBackground ("GloMap/GloMap/Resources/glomap-rohan.tga");
rohan:SetVisible(true);
rohan:SetStretchMode(1);
-- BUTTONS
-- bree north
btn1 = Turbine.UI.Button();
btn1:SetParent(GloMapWindow);
btn1:SetSize ( 100, 30 );
btn1:SetPosition ( 20, 900 );
btn1:SetVisible(true);
btn1:SetText ("Bree N");
btn1:SetBackColor ( Turbine.UI.Color (0,0,1));
btn1:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btn1.MouseClick = function (sender, args)
	if breeN:IsVisible() then
		breeN:SetVisible(false);
	else
		breeN:SetVisible(true);
	end
end
-- bree south
btn2 = Turbine.UI.Button();
btn2:SetParent(GloMapWindow);
btn2:SetSize ( 100, 30 );
btn2:SetPosition ( 140, 900 );
btn2:SetVisible(true);
btn2:SetText ("Bree S");
btn2:SetBackColor ( Turbine.UI.Color (0,0,1));
btn2:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btn2.MouseClick = function (sender, args)
	if breeS:IsVisible() then
		breeS:SetVisible(false);
	else
		breeS:SetVisible(true);
	end
end
-- moria
btn3 = Turbine.UI.Button();
btn3:SetParent(GloMapWindow);
btn3:SetSize ( 100, 30 );
btn3:SetPosition ( 260, 900 );
btn3:SetVisible(true);
btn3:SetText ("Moria");
btn3:SetBackColor ( Turbine.UI.Color (0,0,1));
btn3:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btn3.MouseClick = function (sender, args)
	if moria:IsVisible() then
		moria:SetVisible(false);
	else
		moria:SetVisible(true);
	end
end
-- eriador
btn4 = Turbine.UI.Button();
btn4:SetParent(GloMapWindow);
btn4:SetSize ( 100, 30 );
btn4:SetPosition ( 380, 900 );
btn4:SetVisible(true);
btn4:SetText ("Eriador");
btn4:SetBackColor ( Turbine.UI.Color (0,0,1));
btn4:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btn4.MouseClick = function (sender, args)
	if eriador:IsVisible() then
		eriador:SetVisible(false);
	else
		eriador:SetVisible(true);
	end
end
-- rohan
btn5 = Turbine.UI.Button();
btn5:SetParent(GloMapWindow);
btn5:SetSize ( 100, 30 );
btn5:SetPosition ( 500, 900 );
btn5:SetVisible(true);
btn5:SetText ("Rohan");
btn5:SetBackColor ( Turbine.UI.Color (0,0,1));
btn5:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btn5.MouseClick = function (sender, args)
	if rohan:IsVisible() then
		rohan:SetVisible(false);
	else
		rohan:SetVisible(true);
	end
end

GloMapCommand = Turbine.ShellCommand();
function GloMapCommand:Execute( command, arguments )
	if ( arguments == "show" ) then
		GloMapWindow:SetVisible( true );
	elseif ( arguments == "hide" ) then
		GloMapWindow:SetVisible( false );
	elseif ( arguments ~= nil ) then
		local opacity = tonumber( arguments )
		if ( ( opacity ~= nil ) and ( opacity > 0 ) ) then
			GloMapWindow:SetOpacity( opacity );
		end
	end
end

function GloMapCommand:GetHelp()
	return "Affiche une fenetre des trajets rapide en monture en Eriador";
end
Turbine.Shell.AddCommand( "glo;glomap", GloMapCommand );
listCommandsCommand = Turbine.ShellCommand();


