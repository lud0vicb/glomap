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
	
	self:SetSize(1310, 950);
	self:SetVisible (true);
	self:SetPosition (500,0);
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
	-- carte generale
	image = Turbine.UI.Control();
	image:SetParent(self);
	image:SetSize(1275, 840);
	image:SetPosition (15,40);
	image:SetBackground ("GloMap/GloMap/Resources/glomap.tga");
	image:SetVisible(true);
	image:SetStretchMode(1);
	-- trajets bree nort
	breeN = Turbine.UI.Control();
	breeN:SetParent(image);
	breeN:SetSize(1275, 840);
	breeN:SetPosition (0,0);
	breeN:SetBackground ("GloMap/GloMap/Resources/glomap-breenord.tga");
	breeN:SetVisible(true);
	breeN:SetStretchMode(1);
	-- trajets bree sud
	breeS = Turbine.UI.Control();
	breeS:SetParent(image);
	breeS:SetSize(1275, 840);
	breeS:SetPosition (0,0);
	breeS:SetBackground ("GloMap/GloMap/Resources/glomap-breesud.tga");
	breeS:SetVisible(true);
	breeS:SetStretchMode(1);
	-- trajets moria
	moria = Turbine.UI.Control();
	moria:SetParent(image);
	moria:SetSize(1275, 840);
	moria:SetPosition (0,0);
	moria:SetBackground ("GloMap/GloMap/Resources/glomap-moria.tga");
	moria:SetVisible(true);
	moria:SetStretchMode(1);
	-- bouton pour trajets bree nord
	btn1 = Turbine.UI.Button();
	btn1:SetParent(self);
	btn1:SetSize ( 100, 30 );
	btn1:SetPosition ( 20, 900 );
	btn1:SetVisible(true);
	btn1:SetText ("Bree N");
	btn1:SetBackColor ( Turbine.UI.Color (0,0,1));
	btn1:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn1.MouseClick = function (sender, args)
		if breeN:IsVisible() then
			breeN:SetVisible(false);
		else
			breeN:SetVisible(true);
		end
	end
	-- bouton pour trajet bree sud
	btn2 = Turbine.UI.Button();
	btn2:SetParent(self);
	btn2:SetSize ( 100, 30 );
	btn2:SetPosition ( 140, 900 );
	btn2:SetVisible(true);
	btn2:SetText ("Bree S");
	btn2:SetBackColor ( Turbine.UI.Color (0,0,1));
	btn2:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn2.MouseClick = function (sender, args)
		if breeS:IsVisible() then
			breeS:SetVisible(false);
		else
			breeS:SetVisible(true);
		end
	end
	-- bouton pour trajet moria
	btn3 = Turbine.UI.Button();
	btn3:SetParent(self);
	btn3:SetSize ( 100, 30 );
	btn3:SetPosition ( 260, 900 );
	btn3:SetVisible(true);
	btn3:SetText ("Moria");
	btn3:SetBackColor ( Turbine.UI.Color (0,0,1));
	btn3:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn3.MouseClick = function (sender, args)
		if moria:IsVisible() then
			moria:SetVisible(false);
		else
			moria:SetVisible(true);
		end
	end

	
end
