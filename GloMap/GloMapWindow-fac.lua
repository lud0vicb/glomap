-- version carte generale decoupee en 4 zones zoomable par click
-- clic pour retour a la generale
-- tentative d'utiliser des methodes pour factoriser les commandes lors d'un clic
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

	Bouton = class( Turbine.UI.Button );
		  
	function Bouton:Constructor()
			Turbine.UI.Button.Constructor( self );
		--self:SetParent(self);
		self:SetSize ( 637, 420 );
		self:SetVisible(true);
		self:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		self:SetBackColor ( Turbine.UI.Color (1,0,0));
	end

	function Bouton:Zoom( )
		btn5:SetSize ( 1274, 840 );
		btn1:SetSize ( 0, 0 );
		btn2:SetSize ( 0, 0 );
		btn3:SetSize ( 0, 0 );
		btn4:SetSize ( 0, 0 );
		btn1:SetVisible(false);
		btn2:SetVisible(false);
		btn3:SetVisible(false);
		btn4:SetVisible(false);
		btn4:SetVisible(true);
	end

	btn1 = Bouton();
	btn1:SetPosition ( 15,40 );
	btn1:SetText ("1");
	btn1.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/1.jpg");
		btn1:Zoom();
	end

	btn2 = Bouton();
	btn2:SetPosition ( 15+637, 40+0 );
	btn2:SetText ("2");
	btn2.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/2.jpg");
		btn2:Zoom();
	end

	btn3 = Bouton();
	btn3:SetPosition ( 15+0,40+420 );
	btn3:SetText ("3");
	btn3.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/3.jpg");
		btn3:Zoom();
	end

	btn4 = Bouton();
	btn4:SetPosition ( 15+637, 40+420 );
	btn4:SetText ("4");
	btn4.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/4.jpg");
		btn4:Zoom();
	end

	btn5 = Bouton();
	btn5:SetSize ( 0, 0 );
	btn5:SetPosition ( 15, 40 );
	btn5:SetText ("5");
	btn5.MouseClick = function (sender, args)
		image:SetBackground ("GloMap/GloMap/Resources/glomap2.jpg");
		btn5:SetSize ( 0, 0 );
		btn1:SetSize ( 637, 420 );
		btn2:SetSize ( 637, 420 );
		btn3:SetSize ( 637, 420 );
		btn4:SetSize ( 637, 420 );
		btn1:SetVisible(true);
		btn2:SetVisible(true);
		btn3:SetVisible(true);
		btn4:SetVisible(true);
		btn4:SetVisible(false);
	end
	
end
