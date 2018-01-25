import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";

GloWindow = class( Turbine.UI.Extensions.Window );	

function GloWindow:Constructor()
	Turbine.UI.Extensions.Window.Constructor( self );
	self:SetVisible (false);
	self:SetSize (10,10);
	self:SetPosition (500,0);
	self:SetOpacity (1);
	self:SetFadeSpeed (1);
	--self:SetStretchMode(1);

	self.MouseEnter = function( sender, args )
		sender:SetOpacity( 1 );
	end
	self.MouseLeave = function( sender, args )
		sender:SetOpacity( 0.3 );
	end

	self.KeyDown = function( sender, args )
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			sender:SetVisible( false ) 
		end
	end
	-- resize main window
	self.resizeHandle = Turbine.UI.Control();
	self.resizeHandle:SetParent( self );
	self.resizeHandle:SetZOrder( 100 );
	self.resizeHandle:SetSize( 20, 20 );
	self.resizeHandle:SetPosition( self:GetWidth() - self.resizeHandle:GetWidth(), self:GetHeight() - self.resizeHandle:GetHeight() );

	self.resizeHandle.MouseDown = function( sender, args )
		sender.dragStartX = args.X;
		sender.dragStartY = args.Y;
		sender.dragging = true;
	end
	local GloMap = self;
	local mainWindow = self;

	self.resizeHandle.MouseMove = function( sender, args )
		local width = mainWindow:GetWidth();
		local height = mainWindow:GetHeight();

		if ( sender.dragging ) then
			mainWindow:SetSize( width + ( args.X - sender.dragStartX ), height + ( args.Y - sender.dragStartY ) );
			sender:SetPosition( mainWindow:GetWidth() - sender:GetWidth(), mainWindow:GetHeight() - sender:GetHeight() )
			GloMap:PerformLayout()
		end
	end

	self.resizeHandle.MouseUp = function( sender, args )
		sender.dragging = false;
	end
end