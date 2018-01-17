import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";

GloButton = Turbine.UI.Lotro.Window();

GloButton:SetSize(40, 40);
GloButton:SetVisible (true);
GloButton:SetPosition (0,0);
GloButton:SetOpacity (1);
GloButton:SetText ("Glo");
GloButton.Closed = function (sender, args)
	GloButton:SetVisible (true);
end
GloButton.MouseEnter = function( sender, args )
	sender:SetOpacity( 1 );
end
GloButton.MouseLeave = function( sender, args )
	sender:SetOpacity( 0.3 );
end


btnM = Turbine.UI.Button();
btnM:SetParent(GloButton);
btnM:SetSize (40,40);
btnM:SetPosition (20,35);
btnM:SetVisible(true);
btnM:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
btnM:SetText("MAP\nON")
--btnM:SetBackColor ( "grey");
btnM:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btnM.MouseClick = function (sender, args)
	if GloMapWindow:IsVisible() then
		GloMapWindow:SetVisible (false);
		btnM:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
		btnM:SetText("MAP\nON")
	else
		GloMapWindow:SetVisible (true);
		btnM:SetBackground("GloMap/GloMap/Resources/greenicon.jpg");
		btnM:SetText("MAP\nOFF")
	end
end

