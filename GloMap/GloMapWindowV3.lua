-- version 3 avec des images TGA en jouant sur la transparence pour afficher uniquement une image de trajets
-- par dessus l'image de la carte
import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";

GloMapWindow = class( Turbine.UI.Extensions.Window );
--GloMapWindow = class( Turbine.UI.Control);

function GloMapWindow:Constructor()

	Turbine.UI.Extensions.Window.Constructor( self );
	--Turbine.UI.Control.Constructor( self );
	
	self:SetSize(1310, 900);
	self:SetVisible (true);
	self:SetPosition (0,0);
	self:SetText ("Glorom's Map");
	self:SetOpacity (1);
	self:SetFadeSpeed (1);
	--self:SetBackColor( Turbine.UI.Color(0, 0, 0, 0) );
	--self:SetBackground ("GloMap/GloMap/Resources/GloMap.jpg");
	--self:SetBackColorBlendMode( 1 );
	self:SetStretchMode(1);
	
	self.MouseEnter = function( sender, args )
		sender:SetOpacity( 1 );
	end
	self.MouseLeave = function( sender, args )
		sender:SetOpacity( 0.4 );
	end
	
	self.KeyDown = function( sender, args )
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			sender:SetVisible( false ) 
		end
	end

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
	--self.MouseClick = function( sender, args )
        -- With each click, cycle through the various blend modes.
     --   self:SetBlendMode( ( self:GetBlendMode() + 1 ) % 9 );
    --end
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

	image = Turbine.UI.Control();
	image:SetParent(self);
	image:SetSize(1275, 840);
	image:SetPosition (15,40);
	image:SetBackground ("GloMap/GloMap/Resources/glomap.tga");
	image:SetVisible(true);
	image:SetStretchMode(1);
	
end
