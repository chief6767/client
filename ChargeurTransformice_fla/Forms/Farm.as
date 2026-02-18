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
   
   public dynamic class Farm extends MovieClip
   {
      
      public var Key_:Object;
      
      public var tfm:*;
      
      public var hackClass:*;
      
      public var mainForm:Main_menu;
      
      public var main_:TransformiceChargeur;
      
      public var timerFarm:int = 5400;
      
      public var gn_sprite:Sprite;
      
      public var _sprite:Sprite;
      
      public var page_1:Sprite;
      
      public var page_2:Sprite;
      
      public var cb_AutoWin:CheckBox;
      
      public var cb_AutoDie:CheckBox;
      
      public var cb_AutoMove:CheckBox;
      
      public var cb_AutoWin_ShaDie:CheckBox;
      
      public var cb_AutoDie_ShaWin:CheckBox;
      
      public var cb_ShamanLoyalty:CheckBox;
      
      public var cb_MinMice:CheckBox;
      
      public var cb_MaxMice:CheckBox;
      
      public var cb_MaxWin:CheckBox;
      
      public var cb_DefilanteWin:CheckBox;
      
      public var cb_DefilanteDie:CheckBox;
      
      public var cb_KillMap:CheckBox;
      
      public var cb_Alarm:CheckBox;
      
      public var cb_StopFarm:CheckBox;
      
      public var cb_ChangeRoom:CheckBox;
      
      public var cb_Exit:CheckBox;
      
      public var ip_MinMice:InputText;
      
      public var ip_MaxMice:InputText;
      
      public var ip_MaxWin:InputText;
      
      public var ip_KillMap:InputText;
      
      public var ip_Alarm:InputText;
      
      public var ip_ShamanLoyalty:InputText;
      
      public var ip_FarmTime:InputText;
      
      public var lb_FarmTime:Label;
      
      public var lb_WinCount:Label;
      
      public var winCount:int = 0;
      
      public var pb_Start:PushButton;
      
      public var isStarted:Boolean = false;
      
      public var isModeDef:Boolean = false;
      
      public var isAlarmStarted:Boolean = false;
      
      public var pb_ShowPage1:PushButton;
      
      public var pb_ShowPage2:PushButton;
      
      public var lastMap:int = 0;
      
      public var setMoveTime:int = 0;
      
      public var pgiex:Boolean = true;
      
      public function Farm(param1:*)
      {
         var pb_trade:PushButton;
         var fc_ForRules:*;
         var splitRL:Shape;
         var shape1:*;
         super();
         this.Key_ = param1.Key_;
         this.tfm = param1.tfm;
         this.mainForm = param1;
         this.hackClass = param1.hackClass;
         this.main_ = TransformiceChargeur.instance;
         this.gn_sprite = new Sprite();
         this._sprite = new Sprite();
         this.page_1 = new Sprite();
         this.page_2 = new Sprite();
         param1.menu_ui.addChild(this);
         this.addChild(this._sprite);
         this._sprite.addChild(this.page_1);
         this._sprite.addChild(this.page_2);
         this.page_2.addChild(this.gn_sprite);
         this.page_2.visible = false;
         Dict.theDict.updateWinCount = this.updateWinCount;
         this.cb_AutoWin = new CheckBox(this.page_1,10,10,Language.getText("AutoWin"),function():*
         {
            radio = cb_AutoWin;
         },false);
         this.cb_AutoWin.selected = this.pgiex;
         this.cb_AutoDie = new CheckBox(this.page_1,10,30,Language.getText("AutoDie"),function():*
         {
            radio = cb_AutoDie;
         },false);
         this.cb_AutoMove = new CheckBox(this.page_1,10,50,Language.getText("AutoMove"),function():*
         {
            radio = cb_AutoMove;
         },false);
         this.cb_AutoWin_ShaDie = new CheckBox(this.page_1,10,70,Language.getText("AutoWin_ShaDie"),function():*
         {
            radio = cb_AutoWin_ShaDie;
         },false);
         this.cb_AutoDie_ShaWin = new CheckBox(this.page_1,10,90,Language.getText("AutoDie_ShaWin"),function():*
         {
            radio = cb_AutoDie_ShaWin;
         },false);
         this.cb_ShamanLoyalty = new CheckBox(this.page_1,10,110,Language.getText("ShamanLoyalty") + ":",function():*
         {
            radio = cb_ShamanLoyalty;
         },false);
         this.ip_ShamanLoyalty = new InputText(this.page_1,this.cb_ShamanLoyalty.x + this.cb_ShamanLoyalty.width + 5,108,"Shaman#0000");
         this.pb_Start = new PushButton(this.page_1,225,10,Language.getText("Start"),function():*
         {
            isStarted = !isStarted;
            Dict.theDict.isStarted = isStarted;
            timerFarm = getTimer();
            pb_Start.basili2 = isStarted;
         });
         this.pb_Start.width = 150;
         this.cb_DefilanteWin = new CheckBox(this.page_1,this.cb_AutoWin.width + 15,10,"DefWin");
         this.cb_DefilanteDie = new CheckBox(this.page_1,this.cb_AutoDie.width + 15,30,"DefDie");
         this.cb_DefilanteWin.visible = this.isModeDef;
         this.cb_DefilanteDie.visible = this.isModeDef;
         this.lb_FarmTime = new Label(this.page_1,225,30,Language.getText("Far" + "mTime") + ":");
         this.ip_FarmTime = new InputText(this.page_1,this.lb_FarmTime.x + this.lb_FarmTime.width + 5,30,this.pgiex ? 4800 : 5400);
         this.ip_FarmTime.width = 142 - this.lb_FarmTime.width;
         this.lb_WinCount = new Label(this.page_1,225,50,Language.getText("win") + ":" + 0);
         this.pb_ShowPage1 = new PushButton(this._sprite,174,165,Language.getText("Fa" + "rm"),function():*
         {
            page_1.visible = true;
            page_2.visible = false;
            pb_ShowPage1.basili2 = true;
            pb_ShowPage2.basili2 = false;
         });
         this.pb_ShowPage1.basili2 = true;
         this.pb_ShowPage2 = new PushButton(this._sprite,275,165,Language.getText("Rules"),function():*
         {
            page_1.visible = false;
            page_2.visible = true;
            pb_ShowPage1.basili2 = false;
            pb_ShowPage2.basili2 = true;
         });
         pb_trade = this.pgiex ? new PushButton(this.page_1,275,140,"reset win count",function():*
         {
            winCount = 0;
         }) : null;
         fc_ForRules = function(param1:* = 1):*
         {
            if(cb_MinMice.selected || cb_MaxMice.selected || cb_MaxWin.selected)
            {
               gn_sprite.mouseEnabled = true;
               gn_sprite.mouseChildren = true;
               gn_sprite.alpha = 1;
            }
            else
            {
               gn_sprite.mouseEnabled = false;
               gn_sprite.mouseChildren = false;
               gn_sprite.alpha = 0.5;
            }
         };
         this.cb_MinMice = new CheckBox(this.page_2,10,10,Language.getText("MinMice") + ":",fc_ForRules);
         this.cb_MaxMice = new CheckBox(this.page_2,10,30,Language.getText("MaxMice") + ":",fc_ForRules);
         this.cb_MaxWin = new CheckBox(this.page_2,10,50,Language.getText("MaxWin") + ":",fc_ForRules);
         this.cb_MaxWin.selected = true;
         fc_ForRules();
         Dict.theDict.cb_CollectBox = new CheckBox(this.page_2,10,70,"Collect gift box");
         if(Dict.currentEvent != "Christmas")
         {
            Dict.theDict.cb_CollectBox.visible = false;
         }
         Dict.theDict.cb_CollectBox.selected = this.pgiex;
         this.ip_MinMice = new InputText(this.page_2,this.cb_MinMice.width + 20,10,0);
         this.ip_MaxMice = new InputText(this.page_2,this.cb_MaxMice.width + 20,30,0);
         this.ip_MaxWin = new InputText(this.page_2,this.cb_MaxWin.width + 20,50,260);
         this.mainForm.set_shape(this.page_2,-3,100,true,388);
         this.cb_KillMap = new CheckBox(this.page_2,10,110,Language.getText("KillMap") + ":");
         this.ip_KillMap = new InputText(this.page_2,10,130,"@7663213,@7663214,@7664119,@7664127,@7664269,@7664271,@7664278,@7664280,@701,@2023,@800,@2025,@0");
         this.ip_KillMap.maxChars = 99999;
         this.ip_KillMap.width = this.cb_KillMap.width;
         this.cb_KillMap.selected = this.pgiex;
         splitRL = this.mainForm.set_shape(this.page_2,this.cb_KillMap.width + 25,112,false,30);
         this.cb_Alarm = new CheckBox(this.page_2,splitRL.x + 10,110,Language.getText("AlarmpMap") + ":");
         this.ip_Alarm = new InputText(this.page_2,splitRL.x + 10,130,"@2023");
         this.ip_Alarm.width = this.cb_Alarm.width;
         this.ip_MinMice.width -= 55;
         this.ip_MaxMice.width -= 55;
         this.ip_MaxWin.width -= 55;
         if(this.ip_MaxMice.x >= this.ip_MaxWin.x && this.ip_MaxMice.x >= this.ip_MinMice.x)
         {
            this.ip_MaxWin.x = this.ip_MaxMice.x;
            this.ip_MinMice.x = this.ip_MaxMice.x;
         }
         if(this.ip_MaxWin.x >= this.ip_MaxMice.x && this.ip_MaxWin.x >= this.ip_MinMice.x)
         {
            this.ip_MaxMice.x = this.ip_MaxWin.x;
            this.ip_MinMice.x = this.ip_MaxWin.x;
         }
         if(this.ip_MinMice.x >= this.ip_MaxMice.x && this.ip_MinMice.x >= this.ip_MaxWin.x)
         {
            this.ip_MaxMice.x = this.ip_MinMice.x;
            this.ip_MaxWin.x = this.ip_MinMice.x;
         }
         shape1 = param1.set_shape(this.page_2,this.ip_MaxWin.x + this.ip_MaxWin.width + 15,17,false,43);
         this.cb_StopFarm = new CheckBox(this.gn_sprite,shape1.x + shape1.width + 15,10,Language.getText("StopFarm"),null,false);
         this.cb_ChangeRoom = new CheckBox(this.gn_sprite,shape1.x + shape1.width + 15,30,Language.getText("ChangeRoom"),null,false);
         this.cb_Exit = new CheckBox(this.gn_sprite,shape1.x + shape1.width + 15,50,Language.getText("Exit"),null,false);
         this.cb_StopFarm.enabled = false;
         fc_ForRules();
         this.cb_StopFarm.selected = true;
         if(Dict.theDict.type.indexOf("Pro") == -1)
         {
            this.page_1.mouseChildren = false;
            this.page_2.mouseChildren = false;
            this.pb_Start.mouseEnabled = false;
            this.Key_.ui_manager_class[this.Key_.on_mouse_box](this.page_1,"Premium");
            this.Key_.ui_manager_class[this.Key_.on_mouse_box](this.page_2,"Premium");
            this.Key_.ui_manager_class[this.Key_.on_mouse_box](this.pb_Start,"Premium");
         }
         Dict.theDict.farmLoop = function():*
         {
            if(!isStarted)
            {
               return;
            }
            if(cb_MinMice.selected && Dict.theDict.miceCount < int(ip_MinMice.text))
            {
               fc_forRules_x("[" + "MinMice" + "]\n\n" + "Users" + ":" + Dict.theDict.miceCount + "\n" + miceNames);
            }
            if(cb_MaxMice.selected && Dict.theDict.miceCount > int(ip_MaxMice.text))
            {
               fc_forRules_x("[" + "MaxMice" + "]\n\n" + "Users" + ":" + Dict.theDict.miceCount + "\n" + miceNames);
            }
            if(cb_MaxWin.selected && winCount > int(ip_MaxWin.text))
            {
               fc_forRules_x("[" + "MaxWin" + "]\n\n" + "win" + ":" + winCount);
            }
            if(cb_KillMap.selected && ip_KillMap.text.indexOf("@" + Dict.theDict.map_code_int) != -1 && !hackClass.isDead)
            {
               hackClass.InstantDeath();
            }
            if(cb_Alarm.selected && ip_Alarm.text.indexOf("@" + Dict.theDict.map_code_int) != -1 && lastMap != Dict.theDict.map_code_int)
            {
               lastMap = Dict.theDict.map_code_int;
               TransformiceChargeur.instance.Sound_NP.play(0,4);
            }
            else
            {
               lastMap = Dict.theDict.map_code_int;
            }
            if(isStarted && !hackClass.isDead && (cb_AutoWin.selected || cb_AutoDie.selected || cb_AutoMove.selected || cb_ShamanLoyalty.selected))
            {
               setMoveTime = 400;
               if(true || Boolean(Dict.theDict.cb_CollectBox.selected))
               {
                  setMoveTime = 1400;
               }
               if(getTimer() - timerFarm >= int(ip_FarmTime.text) - setMoveTime && !cb_AutoMove.selected)
               {
                  hackClass.setMoveRight();
                  if(true || Boolean(Dict.theDict.cb_CollectBox.selected))
                  {
                     tfm.tempsPartieZero = int.MAX_VALUE;
                     Key_.LeveC[Key_.movingFunction1](39);
                     Key_.LeveC[Key_.movingFunction2](39);
                  }
               }
               if(getTimer() - timerFarm >= int(ip_FarmTime.text) - 650 || Boolean(Dict.theDict.cb_CollectBox.selected))
               {
                  Key_.LeveC[Key_.movingFunction1](38);
                  Key_.LeveC[Key_.movingFunction2](38);
               }
               if(getTimer() - timerFarm >= int(ip_FarmTime.text) - 500 && Boolean(Dict.theDict.cb_CollectBox.selected))
               {
                  collectBox(tfm);
               }
               if(getTimer() - timerFarm >= int(ip_FarmTime.text))
               {
                  timerFarm = getTimer();
                  if(cb_AutoWin.selected || cb_ShamanLoyalty.selected && Boolean(Dict.theDict.LoyaltyWin))
                  {
                     hackClass.TeleWin();
                  }
                  else if(cb_AutoDie.selected)
                  {
                     hackClass.InstantDeath();
                  }
                  else if(cb_AutoMove.selected)
                  {
                     hackClass.setMoveRight();
                  }
               }
            }
            else if(hackClass.isDead)
            {
               timerFarm = getTimer();
            }
         };
      }
      
      public function jumpMouse() : *
      {
         if(true || Boolean(Dict.theDict.cb_CollectBox.selected))
         {
            this.tfm.tempsPartieZero = int.MAX_VALUE;
            this.Key_.LeveC[this.Key_.movingFunction1](39);
            this.Key_.LeveC[this.Key_.movingFunction2](39);
         }
      }
      
      public function get miceNames() : String
      {
         var _loc1_:String = "";
         for each(users in this.tfm[this.Key_.ListeJoueur])
         {
            if(_loc1_ == "")
            {
               _loc1_ = users[this.Key_.GameName];
            }
            else
            {
               _loc1_ += "," + users[this.Key_.GameName];
            }
         }
         return _loc1_;
      }
      
      public function set radio(param1:CheckBox) : *
      {
         var _loc2_:Boolean = param1.selected;
         this.cb_AutoWin.selected = false;
         this.cb_AutoDie.selected = false;
         this.cb_AutoMove.selected = false;
         this.cb_AutoWin_ShaDie.selected = false;
         this.cb_AutoDie_ShaWin.selected = false;
         this.cb_ShamanLoyalty.selected = false;
         param1.selected = _loc2_;
      }
      
      public function updateWinCount() : *
      {
         ++this.winCount;
         this.lb_WinCount.text = "win" + ":" + this.winCount;
      }
      
      public function collectBox(param1:DisplayObjectContainer) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:* = param1.numChildren;
         var _loc3_:* = 0;
         try
         {
            while(_loc3_ < _loc2_)
            {
               _loc4_ = param1.getChildAt(_loc3_);
               if(_loc4_.width == 37 && _loc4_.height == 39)
               {
                  if(_loc4_.x < 10 || _loc4_.y < 10)
                  {
                     return;
                  }
                  Dict.theDict.hackClass.SetPlayerFakePosition(_loc4_.x,_loc4_.y);
               }
               if(_loc4_ is DisplayObjectContainer && _loc4_.numChildren > 0)
               {
                  try
                  {
                     this.collectBox(_loc4_);
                  }
                  catch(E:Error)
                  {
                  }
               }
               _loc3_ += 1;
            }
         }
         catch(E:Error)
         {
         }
      }
      
      public function _56846124213(param1:int, param2:Function, param3:int = 1) : *
      {
         var _loc4_:* = new Timer(param1,param3);
         _loc4_.addEventListener(TimerEvent.TIMER,param2);
         _loc4_.start();
      }
      
      public function fc_forRules_x(param1:* = "") : *
      {
         if(this.cb_MinMice.selected || this.cb_MaxMice.selected || this.cb_MaxWin.selected)
         {
            if(this.cb_ChangeRoom.selected)
            {
               this.hackClass.chatCommand("room @" + Randomize.GetRandomRoomName() + " " + Randomize.GetRandomCha2(Randomize.randomNumberGenerator(4,15)));
            }
            if(this.cb_Exit.selected)
            {
               this.tfm[this.Key_.get_disconnect](null,param1 + "\nTime = " + (new Date().hours + ":" + new Date().minutes));
            }
            this.isStarted = false;
            this.pb_Start.basili2 = this.isStarted;
         }
      }
   }
}

