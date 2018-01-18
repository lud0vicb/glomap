import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
-- load config or init if no saved config found
GloSaveData = {x=0;y=0;};
GloData = Turbine.PluginData.Load(Turbine.DataScope.Account, "Glorom", function()
end);
if (GloData) then
	DeepTableCopy(GloData, GloSaveData);
	Turbine.Shell.WriteLine("GloLoad done");
else
	Turbine.Shell.WriteLine("GloButtonWindow initialized (0,0)");
end
--[[
Turbine.PluginData.Load(Turbine.DataScope.Account, "Glorom", function(GloData)
	if (GloData) then
		GloData = ImportTable(GloData);
		DeepTableCopy(GloData, GloSaveData);
		Turbine.Shell.WriteLine("GloLoad done");
	else
		Turbine.Shell.WriteLine("GloButtonWindow initialized (0,0)");
	end
end);
]]
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
-- save config when the plugin stops
function GloSave()
    GloSaveData.x,GloSaveData.y = GloButtonWindow:GetPosition();
	--local tmpData = ExportTable(GloSaveData);    
    Turbine.PluginData.Save(Turbine.DataScope.Account, "Glorom", GloSaveData, function()
		Turbine.Shell.WriteLine("GloSave done");
    end);
end
Turbine.Plugin.Unload = GloSave;