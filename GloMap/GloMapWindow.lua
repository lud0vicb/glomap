import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";
import "GloMap.GloMap.GloWindow"

GloMapWindow = GloWindow(GloSaveData.xM,GloSaveData.yM) ;

GloMapWindow:SetSize(1310, 950);
GloMapWindow:SetText ("Trajets");
GloMapWindow.Closed = function( sender, args )
	btnM:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
	btnM:SetText("MAP\nON")
end
GloMapWindow.MouseEnter = function( sender, args )
	sender:SetOpacity( 1 );
	map:SetOpacity( 1 );
	breeN:SetOpacity( 1 );
	breeS:SetOpacity( 1 );
	eriador:SetOpacity( 1 );
	moria:SetOpacity( 1 );
	rohan:SetOpacity( 1 );	
end
GloMapWindow.MouseLeave = function( sender, args )
	sender:SetOpacity( 0.3 );
	map:SetOpacity( 0.3 );
	breeN:SetOpacity( 0.3 );
	breeS:SetOpacity( 0.3 );
	eriador:SetOpacity( 0.3 );
	moria:SetOpacity( 0.3 );
	rohan:SetOpacity( 0.3 );	
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
GloMapButton = class( Turbine.UI.Button );	

function GloMapButton:Constructor(parent, sx, sy, px, py, titre, trajets)
	Turbine.UI.Button.Constructor( self );
	self:SetParent(parent);
	self:SetSize ( sx, sy );
	self:SetPosition ( px, py );
	self:SetVisible(true);
	self:SetText (titre);
	self:SetBackColor ( Turbine.UI.Color (0,1,0));
	self:SetForeColor ( Turbine.UI.Color (0,0,0));
	self:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	self.MouseClick = function (sender, args)
		if trajets:IsVisible() then
			trajets:SetVisible(false);
			self:SetBackColor ( Turbine.UI.Color (1,0,0));
		else
			trajets:SetVisible(true);
			self:SetBackColor ( Turbine.UI.Color (0,1,0));
		end
	end
end
btn1 = GloMapButton(GloMapWindow,100,30,20,900,"Bree N",breeN);
btn2 = GloMapButton(GloMapWindow,100,30,140,900,"Bree S",breeS);
btn3 = GloMapButton(GloMapWindow,100,30,260,900,"Moria",moria);
btn4 = GloMapButton(GloMapWindow,100,30,380,900,"Eriador",eriador);
btn5 = GloMapButton(GloMapWindow,100,30,500,900,"Rohan",rohan);
