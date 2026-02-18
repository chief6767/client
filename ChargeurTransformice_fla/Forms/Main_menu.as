package ChargeurTransformice_fla.Forms
{
   import ChargeurTransformice_fla.*;
   import coms.bit101.components.*;
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public dynamic class Main_menu extends MovieClip
   {
      
      public var instance:Main_menu = this;
      
      public var BadgeCount:int = 0;
      
      public var menu_ui:*;
      
      public var menuHeight:int = 238;
      
      public var menuList:Array = new Array();
      
      public var _Dict:Dictionary;
      
      public var Key_:*;
      
      public var set_shape:Function;
      
      public var imageLOC:* = "http://pgiex.space/tfm/images/";
      
      public var button_Genetic:*;
      
      public var button_Farm:*;
      
      public var hackClass:Hack_Class;
      
      public var tfm:*;
      
      public var chat_menu_ui:*;
      
      public var farm_helper:*;
      
      public var pgiex:Boolean = true;
      
      public function Main_menu(param1:*)
      {
         super();
         this._Dict = TransformiceChargeur.instance._Dict;
         this.tfm = TransformiceChargeur.instance.tfm;
         this.hackClass = this._Dict.hackClass;
         trace("main : " + this.hackClass);
         this.Key_ = this._Dict.Key_;
         this.create_Main_Menu();
      }
      
      public function create_Main_Menu() : *
      {
         var menu_uiClass:* = new TFM_Menu(388 - 5,238,377,66,true,"Pgiex TFM",function():*
         {
            menu_ui.parent.removeChild(menu_ui);
            stage.focus = stage;
         });
         this.menu_ui = menu_uiClass.menu_ui;
         menu_uiClass.set_shape(this.menu_ui,-4,this.menuHeight - 47,true,390);
         this.set_shape = menu_uiClass.set_shape;
         TransformiceChargeur.instance.stage.addChild(this.menu_ui);
         Dict.theDict.type = "Pro";
         Dict.theDict.mainMenuPart = this.menu_ui;
         this._Dict.form_Standard = new Standard(this);
         this._Dict.form_Farm = new Farm(this);
         this._Dict.settingsForm = new Settings(this);
         this.addMenuBadge(this.imageLOC + "Standard.png","Standard",this._Dict.form_Standard,!this.pgiex);
         this.addMenuBadge(this.imageLOC + "Farm.png","Farm",this._Dict.form_Farm,this.pgiex);
         this.addMenuBadge(this.imageLOC + "Settings.png?d=3","Settings",this._Dict.settingsForm);
      }
      
      public function addMenuBadge(param1:String, param2:String = "Standard", param3:Sprite = null, param4:Boolean = false) : *
      {
         var request:URLRequest;
         var menuButton:Sprite = null;
         var imageLoader:* = undefined;
         var imageURL:String = param1;
         var description:String = param2;
         var menuSprite:Sprite = param3;
         var _visible:Boolean = param4;
         menuSprite.visible = _visible;
         request = new URLRequest(imageURL);
         menuButton = new Sprite();
         try
         {
            if(imageURL != null)
            {
               imageLoader = new Loader();
               imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:*):*
               {
                  var e:* = param1;
                  menuList.push(menuSprite);
                  menuButton.addEventListener(MouseEvent.CLICK,function(param1:*):*
                  {
                     var _loc2_:* = undefined;
                     for each(_loc2_ in menuList)
                     {
                        _loc2_.visible = false;
                     }
                     menuSprite.visible = true;
                  });
                  menu_ui.addChild(menuButton);
                  Style.effetLumiere(menuButton,true,true);
                  new Tooltip(menuButton,description);
               });
               imageLoader.load(request);
               menuButton.addChild(imageLoader);
            }
            menuButton.y = this.menuHeight - 40;
            menuButton.x = this.BadgeCount;
            if(description == "Farm Helper")
            {
            }
            this.BadgeCount += 56;
         }
         catch(E:Error)
         {
         }
         return imageLoader;
      }
   }
}

