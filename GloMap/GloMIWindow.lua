import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";
import "GloMap.GloMap.GloWindow"
import "GloMap.GloMap.GloWindow"

GloMIWindow = GloWindow(GloSaveData.xMI,GloSaveData.yMI) ;

GloMIWindow:SetSize(680, 620);
GloMIWindow:SetText ("Menaces itinérantes");
GloMIWindow.Closed = function( sender, args )
	btnMI:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
	btnMI:SetText("MI\nON")
end
GloMIWindow.MouseEnter = function( sender, args )
	sender:SetOpacity( 1 );
	mapMI:SetOpacity( 1 );
end
GloMIWindow.MouseLeave = function( sender, args )
	sender:SetOpacity( 0.5 );
	mapMI:SetOpacity( 0.5 );
end
mapMI = Turbine.UI.Control();
mapMI:SetParent(GloMIWindow);
mapMI:SetSize(640, 480);
mapMI:SetPosition (15,40);
mapMI:SetBackground ("GloMap/GloMap/Resources/angmar.jpg");
mapMI:SetVisible(true);
mapMI:SetStretchMode(1);

label = Turbine.UI.Label();
label:SetParent( GloMIWindow );
label:SetPosition( 20, 580 );
label:SetSize( 300, 20 );
label:SetBackColor( Turbine.UI.Color( 0, 0, 0 ) );
label:SetForeColor( Turbine.UI.Color( 1, 1, 1 ) );
label:SetText( "Maps from http://lotro-wiki.fr" );
label:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );

GloButton = class( Turbine.UI.Button );	

function GloButton:Constructor(parent, sx, sy, px, py, titre, file)
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
		mapMI:SetBackground (file);
		btnMI1:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI2:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI3:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI4:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI5:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI6:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI7:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI8:SetBackColor ( Turbine.UI.Color (1,0,0));
		btnMI9:SetBackColor ( Turbine.UI.Color (1,0,0));
		self:SetBackColor ( Turbine.UI.Color (0,1,0));
	end
end

btnMI1 = GloButton(GloMIWindow,100,20,20,530,"Angmar","GloMap/GloMap/Resources/Angmar.jpg");
btnMI2 = GloButton(GloMIWindow,100,20,140,530,"Evendim","GloMap/GloMap/Resources/Evendim.jpg");
btnMI3 = GloButton(GloMIWindow,100,20,260,530,"Forochel", "GloMap/GloMap/Resources/forochel.jpg");
btnMI4 = GloButton(GloMIWindow,100,20,380,530,"Gondor centre", "GloMap/GloMap/Resources/gondorcentre.jpg");
btnMI5 = GloButton(GloMIWindow,100,20,500,530,"Gondor centre", "GloMap/GloMap/Resources/gondorouest.jpg");
btnMI6 = GloButton(GloMIWindow,100,20,20,560,"Hauts du nord","GloMap/GloMap/Resources/hautsdunord.jpg");
btnMI7 = GloButton(GloMIWindow,100,20,140,560,"Ithilien sud","GloMap/GloMap/Resources/ithiliensud.jpg");
btnMI8 = GloButton(GloMIWindow,100,20,260,560,"Mont brumeux","GloMap/GloMap/Resources/montsbrumeux.jpg");
btnMI9 = GloButton(GloMIWindow,100,20,380,560,"Forêt noire","GloMap/GloMap/Resources/foretnoire.jpg");
