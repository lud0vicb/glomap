import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
-- load config or init if no saved config found
GloSaveData = {x=0;y=0;};
GloData = Turbine.PluginData.Load(Turbine.DataScope.Account, "Glorom", function()
end);
Turbine.Shell.WriteLine (GloData);
if (GloData) then
	GloSaveData.x = GloData.x;
	GloSaveData.y = GloData.y;
	Turbine.Shell.WriteLine("GloLoad done");
else
	Turbine.Shell.WriteLine("GloButtonWindow initialized (0,0)");
end
-- movable windows to hold buttons
GloButtonWindow = Turbine.UI.Lotro.Window();
GloButtonWindow:SetSize(40, 40);
GloButtonWindow:SetVisible (true);
GloButtonWindow:SetPosition (GloSaveData.x,GloSaveData.y);
GloButtonWindow:SetOpacity (1);
GloButtonWindow:SetText ("Glo");
GloButtonWindow.Closed = function (sender, args)
	GloButtonWindow:SetVisible (true);
end
GloButtonWindow.MouseEnter = function( sender, args )
	sender:SetOpacity( 1 );
end
GloButtonWindow.MouseLeave = function( sender, args )
	sender:SetOpacity( 0.3 );
end
-- button to hide/show main map : GloMapWindow
btnM = Turbine.UI.Button();
btnM:SetParent(GloButtonWindow);
btnM:SetSize (40,40);
btnM:SetPosition (20,35);
btnM:SetVisible(true);
btnM:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
btnM:SetText("MAP\nON")
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
-- button to hide/show main map : GloMapWindow
btnMI = Turbine.UI.Button();
btnMI:SetParent(GloButtonWindow);
btnMI:SetSize (40,40);
btnMI:SetPosition (60,35);
btnMI:SetVisible(true);
btnMI:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
btnMI:SetText("MI\nON")
btnMI:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
btnMI.MouseClick = function (sender, args)
	if GloMIWindow:IsVisible() then
		GloMIWindow:SetVisible (false);
		btnMI:SetBackground("GloMap/GloMap/Resources/redicon.jpg");
		btnMI:SetText("MI\nON")
	else
		GloMIWindow:SetVisible (true);
		btnMI:SetBackground("GloMap/GloMap/Resources/greenicon.jpg");
		btnMI:SetText("MI\nOFF")
	end
end
-- save config when the plugin stops
function GloSave()
    GloSaveData.x,GloSaveData.y = GloButtonWindow:GetPosition();
    Turbine.PluginData.Save(Turbine.DataScope.Account, "Glorom", GloSaveData, function()
		Turbine.Shell.WriteLine("GloSave done");
    end);
end
Turbine.Plugin.Unload = GloSave;