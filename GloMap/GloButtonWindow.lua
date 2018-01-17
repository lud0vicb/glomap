import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";

GloButton = Turbine.UI.Control();

GloButton:SetSize(500, 200);
GloButton:SetVisible (true);
GloButton:SetPosition (0,0);
--GloButton:SetText ("GloMap");
GloButton:SetOpacity (1);
GloButton:SetBackColor("blue");

btnM = Turbine.UI.Button();
btnM:SetParent(GloButton);
btnM:SetSize (50,30);
btnM:SetPosition (30,30);
btnM:SetVisible(true);
btnM:SetText ("GloMap");
btnM:SetBackColor ( Turbine.UI.Color (0,0,1));
btnM:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btnM.MouseClick = function (sender, args)
	if GloMap:IsVisible() then
		GloMap:SetVisible (false);
	else
		GloMap:SetVisible (true);
	end
end
