import "Turbine";
import "Turbine.UI";
import "Turbine.UI.Lotro";
--import "Turbine.UI.Gameplay";
import "GloMap.GloMap.GloMapWindow"


--Plugin Starts Here
GloMap = GloMapWindow();
GloMap:SetVisible (true);

GloMapCommand = Turbine.ShellCommand();

function GloMapCommand:Execute( command, arguments )
	if ( arguments == "show" ) then
		GloMap:SetVisible( true );
	elseif ( arguments == "hide" ) then
		GloMap:SetVisible( false );
	elseif ( arguments ~= nil ) then
		local opacity = tonumber( arguments )
		if ( ( opacity ~= nil ) and ( opacity > 0 ) ) then
			GloMap:SetOpacity( opacity );
		end
	end
end

function GloMapCommand:GetHelp()
	return "Affiche une fenetre des trajets rapide en monture en Eriador";
end

Turbine.Shell.AddCommand( "glo;glomap", GloMapCommand );

listCommandsCommand = Turbine.ShellCommand();

