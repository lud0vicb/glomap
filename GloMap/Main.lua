import "Turbine";
import "Turbine.UI";
import "Turbine.UI.Lotro";
-- load config or init if no saved config found
GloSaveData = {
	x=0;y=0;
	xM=500;yM=0;
	xMI=400;yMI=0;
};
GloData = Turbine.PluginData.Load(Turbine.DataScope.Account, "Glorom", function()
end);
--Turbine.Shell.WriteLine (GloData);
if (GloData) then
	GloSaveData.x = GloData.x;
	GloSaveData.y = GloData.y;
	GloSaveData.xMI = GloData.xMI;
	GloSaveData.yMI = GloData.yMI;
	GloSaveData.xM = GloData.xM;
	GloSaveData.yM = GloData.yM;	
	Turbine.Shell.WriteLine("GloLoad done");
else
	Turbine.Shell.WriteLine("GloButtonWindow initialized (0,0)");
end
-- save config when the plugin stops
function GloSave()
    GloSaveData.x,GloSaveData.y = GloButtonWindow:GetPosition();
    GloSaveData.xM,GloSaveData.yM = GloMapWindow:GetPosition();
    GloSaveData.xMI,GloSaveData.yMI = GloMIWindow:GetPosition();
    Turbine.PluginData.Save(Turbine.DataScope.Account, "Glorom", GloSaveData, function()
		Turbine.Shell.WriteLine("GloSave done");
    end);
end
Turbine.Plugin.Unload = GloSave;

import "GloMap.GloMap.GloWindow"
import "GloMap.GloMap.GloMapWindow"
import "GloMap.GloMap.GloMIWindow"
import "GloMap.GloMap.GloButtonWindow"
