-- version carte generale decoupee en 4 zones zoomable par click
-- clic pour retour a la generale
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
	image:SetSize(1274, 840);
	image:SetPosition (15,40);
	image:SetBackground ("GloMap/GloMap/Resources/glomap2.jpg");
	image:SetVisible(true);
	image:SetStretchMode(1);

	btn1 = Turbine.UI.Button();
	btn1:SetParent(self);
	btn1:SetSize ( 637, 420 );
	btn1:SetPosition ( 15,40 );
	btn1:SetVisible(true);
	btn1:SetText ("1");
	btn1:SetBackColor ( Turbine.UI.Color (1,0,0));
	btn1:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn1.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/001.jpg");
		--btn5:SetSize ( 1274, 840 );
		--btn1:SetSize ( 0, 0 );
		--btn2:SetSize ( 0, 0 );
		--btn3:SetSize ( 0, 0 );
		--btn4:SetSize ( 0, 0 );
		btn1:SetVisible(false);
		btn2:SetVisible(false);
		btn3:SetVisible(false);
		btn4:SetVisible(false);
		btn5:SetVisible(true);
	end

	btn2 = Turbine.UI.Button();
	btn2:SetParent(self);
	btn2:SetSize ( 637, 420 );
	btn2:SetPosition ( 15+637, 40+0 );
	btn2:SetVisible(true);
	btn2:SetText ("2");
	btn2:SetBackColor (Turbine.UI.Color (0,0,1));
	btn2:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn2.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/002.jpg");
		btn1:SetVisible(false);
		btn2:SetVisible(false);
		btn3:SetVisible(false);
		btn4:SetVisible(false);
		btn5:SetVisible(true);
	end

	btn3 = Turbine.UI.Button();
	btn3:SetParent(self);
	btn3:SetSize ( 637, 420 );
	btn3:SetPosition ( 15+0,40+420 );
	btn3:SetVisible(true);
	btn3:SetText ("3");
	btn3:SetBackColor ( Turbine.UI.Color (1,0,0));
	btn3:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn3.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/003.jpg");
		btn1:SetVisible(false);
		btn2:SetVisible(false);
		btn3:SetVisible(false);
		btn4:SetVisible(false);
		btn5:SetVisible(true);
	end

	btn4 = Turbine.UI.Button();
	btn4:SetParent(self);
	btn4:SetSize ( 637, 420 );
	btn4:SetPosition ( 15+637, 40+420 );
	btn4:SetVisible(true);
	btn4:SetText ("4");
	btn4:SetBackColor (Turbine.UI.Color (0,0,1));
	btn4:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn4.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/004.jpg");
		btn1:SetVisible(false);
		btn2:SetVisible(false);
		btn3:SetVisible(false);
		btn4:SetVisible(false);
		btn5:SetVisible(true);
	end

	btn5 = Turbine.UI.Button();
	btn5:SetParent(self);
	btn5:SetSize ( 0, 0 );
	btn5:SetPosition ( 15, 40 );
	btn5:SetVisible(false);
	btn5:SetText ("5");
	btn5:SetBackColor (Turbine.UI.Color (0,0,1));
	btn5:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	btn5.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/glomap2.jpg");
		btn1:SetVisible(true);
		btn2:SetVisible(true);
		btn3:SetVisible(true);
		btn4:SetVisible(true);
		btn5:SetVisible(false);
	end
	btn5:SetSize ( 1274, 840 );
	btn1:SetSize ( 637, 420 );
	btn2:SetSize ( 637, 420 );
	btn3:SetSize ( 637, 420 );
	btn4:SetSize ( 637, 420 );

end
