import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";
import "GloMap.GloMap.GloWindow"

GloMIWindow = GloWindow() ;

GloMIWindow:SetSize(840, 750);
GloMIWindow:SetText ("Menaces itinérantes");
GloMIWindow.Closed = function( sender, args )
	btnMI:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
	btnMI:SetText("MI\nON")
end

mapMI = Turbine.UI.Control();
mapMI:SetParent(GloMIWindow);
mapMI:SetSize(800, 600);
mapMI:SetPosition (15,40);
mapMI:SetBackground ("GloMap/GloMap/Resources/angmar.jpg");
mapMI:SetVisible(true);
mapMI:SetStretchMode(1);

label = Turbine.UI.Label();
label:SetParent( GloMIWindow );
label:SetPosition( 20, 690 );
label:SetSize( 300, 20 );
label:SetBackColor( Turbine.UI.Color( 0, 0, 0 ) );
label:SetForeColor( Turbine.UI.Color( 1, 1, 1 ) );
label:SetText( "Maps from http://lotro-wiki.fr" );
label:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );

btnMI1 = Turbine.UI.Button();
btnMI1:SetParent(GloMIWindow);
btnMI1:SetSize ( 100, 30 );
btnMI1:SetPosition ( 20, 650 );
btnMI1:SetVisible(true);
btnMI1:SetText ("Angmar");
btnMI1:SetBackColor ( Turbine.UI.Color (0,1,0));
btnMI1:SetForeColor ( Turbine.UI.Color (0,0,0));
btnMI1:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btnMI1.MouseClick = function (sender, args)
	mapMI:SetBackground ("GloMap/GloMap/Resources/Angmar.jpg");
	btnMI1:SetBackColor ( Turbine.UI.Color (0,1,0));
	btnMI2:SetBackColor ( Turbine.UI.Color (1,0,0));
end

btnMI2 = Turbine.UI.Button();
btnMI2:SetParent(GloMIWindow);
btnMI2:SetSize ( 100, 30 );
btnMI2:SetPosition ( 140, 650 );
btnMI2:SetVisible(true);
btnMI2:SetText ("Evendim");
btnMI2:SetBackColor ( Turbine.UI.Color (1,0,0));
btnMI2:SetForeColor ( Turbine.UI.Color (0,0,0));
btnMI2:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btnMI2.MouseClick = function (sender, args)
	mapMI:SetBackground ("GloMap/GloMap/Resources/Evendim.jpg");
	btnMI1:SetBackColor ( Turbine.UI.Color (1,0,0));
	btnMI2:SetBackColor ( Turbine.UI.Color (0,1,0));
end
