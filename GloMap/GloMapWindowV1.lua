-- version 1 avec deux boutons pour afficher eriador ou moria
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
	
	self:SetSize(1050, 670);
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
	image:SetSize(1024, 576);
	image:SetPosition (15,40);
	image:SetBackground ("GloMap/GloMap/Resources/SoAp.jpg");
	image:SetVisible(true);
	image:SetStretchMode(1);
	
	btn1 = Turbine.UI.Button();
	btn1:SetParent(self);
	btn1:SetSize ( 100, 30 );
	btn1:SetPosition ( 20, 620 );
	btn1:SetVisible(true);
	btn1:SetText ("SOA");
	btn1:SetBackColor ( Turbine.UI.Color (1,0,0));
	btn1:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn1.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/SoAp.jpg");
	end

	btn2 = Turbine.UI.Button();
	btn2:SetParent(self);
	btn2:SetSize ( 100, 30 );
	btn2:SetPosition ( 140, 620 );
	btn2:SetVisible(true);
	btn2:SetText ("MOM");
	btn2:SetBackColor (Turbine.UI.Color (0,0,1));
	btn2:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn2.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/MoMp.jpg");
	end
	
end
