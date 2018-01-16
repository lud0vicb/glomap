-- version 3 with TGA image files 
-- there is one TGA file containing the map and the names of town
-- there are several TGA files ; each contains only lines to join town
-- those lines are grouped by are ; example : Bree Nord, Moria
-- a button allows to draw or hide travel of an area
import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Extensions";
import "Turbine.UI.Lotro";

GloMapWindow = class( Turbine.UI.Extensions.Window );

function GloMapWindow:Constructor()

	Turbine.UI.Extensions.Window.Constructor( self );
	
	self:SetSize(1310, 950);
	self:SetVisible (true);
	self:SetPosition (500,0);
	self:SetText ("Glorom's Map");
	self:SetOpacity (1);
	self:SetFadeSpeed (1);
	self:SetStretchMode(1);
	
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
	-- map + town names
	map = Turbine.UI.Control();
	map:SetParent(self);
	map:SetSize(1275, 840);
	map:SetPosition (15,40);
	map:SetBackground ("GloMap/GloMap/Resources/glomap.tga");
	map:SetVisible(true);
	map:SetStretchMode(1);
-- TRAVELS	
	-- bree north
	breeN = Turbine.UI.Control();
	breeN:SetParent(map);
	breeN:SetSize(1275, 840);
	breeN:SetPosition (0,0);
	breeN:SetBackground ("GloMap/GloMap/Resources/glomap-breenord.tga");
	breeN:SetVisible(true);
	breeN:SetStretchMode(1);
	-- bree south
	breeS = Turbine.UI.Control();
	breeS:SetParent(map);
	breeS:SetSize(1275, 840);
	breeS:SetPosition (0,0);
	breeS:SetBackground ("GloMap/GloMap/Resources/glomap-breesud.tga");
	breeS:SetVisible(true);
	breeS:SetStretchMode(1);
	-- moria
	moria = Turbine.UI.Control();
	moria:SetParent(map);
	moria:SetSize(1275, 840);
	moria:SetPosition (0,0);
	moria:SetBackground ("GloMap/GloMap/Resources/glomap-moria.tga");
	moria:SetVisible(true);
	moria:SetStretchMode(1);
	-- eriador
	eriador = Turbine.UI.Control();
	eriador:SetParent(map);
	eriador:SetSize(1275, 840);
	eriador:SetPosition (0,0);
	eriador:SetBackground ("GloMap/GloMap/Resources/glomap-eriador.tga");
	eriador:SetVisible(true);
	eriador:SetStretchMode(1);
	-- rohan
	rohan = Turbine.UI.Control();
	rohan:SetParent(map);
	rohan:SetSize(1275, 840);
	rohan:SetPosition (0,0);
	rohan:SetBackground ("GloMap/GloMap/Resources/glomap-rohan.tga");
	rohan:SetVisible(true);
	rohan:SetStretchMode(1);
-- BUTTONS
	-- bree north
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
	-- bree south
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
	-- moria
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
	-- eriador
	btn4 = Turbine.UI.Button();
	btn4:SetParent(self);
	btn4:SetSize ( 100, 30 );
	btn4:SetPosition ( 380, 900 );
	btn4:SetVisible(true);
	btn4:SetText ("Eriador");
	btn4:SetBackColor ( Turbine.UI.Color (0,0,1));
	btn4:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn4.MouseClick = function (sender, args)
		if eriador:IsVisible() then
			eriador:SetVisible(false);
		else
			eriador:SetVisible(true);
		end
	end
	-- rohan
	btn5 = Turbine.UI.Button();
	btn5:SetParent(self);
	btn5:SetSize ( 100, 30 );
	btn5:SetPosition ( 500, 900 );
	btn5:SetVisible(true);
	btn5:SetText ("Rohan");
	btn5:SetBackColor ( Turbine.UI.Color (0,0,1));
	btn5:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn5.MouseClick = function (sender, args)
		if rohan:IsVisible() then
			rohan:SetVisible(false);
		else
			rohan:SetVisible(true);
		end
	end
end
