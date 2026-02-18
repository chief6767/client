package ChargeurTransformice_fla
{
   import ChargeurTransformice_fla.Forms.*;
   import coms.bit101.components.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public dynamic class TransformiceChargeur extends MovieClip
   {
      
      public static var instance:TransformiceChargeur;
      
      private static const _decodeChars:Vector.<int> = _initDecodeChar();
      
      public var hackedAppDomain:LoaderInfo;
      
      public var _C:MovieClip;
      
      public var Charge:Number;
      
      public var Chargeur2:Loader;
      
      public var P:Number;
      
      public var date:Date;
      
      public var tfm:Object;
      
      public var tfm2:Object;
      
      public var last_bulle_socket_instance:Object;
      
      public var last_main_socket_instance:Object;
      
      public var timerinit:int = 0;
      
      public var isAIR:Boolean = false;
      
      public var Packets:FPacket;
      
      public var send_bulle:*;
      
      public var menu_ui:*;
      
      public var chat_menu_ui:*;
      
      public var mainMenu:Main_menu;
      
      internal var so:SharedObject = SharedObject.getLocal("userData");
      
      public var pgiex:Boolean = false;
      
      public var userId:String = "";
      
      public var VERSION:String = "PUBLIC_SOURCE_NONOBFUSCATED";
      
      public var datestr:String = "";
      
      public var manualUpdate:Boolean = false;
      
      public var isTradeStarted:Boolean = false;
      
      public var isTradeCompleted:Boolean = false;
      
      public var isTradeCanceled:Boolean = false;
      
      public var isTradeConfirmed:Boolean = false;
      
      public var newDate_x:*;
      
      internal var asqw:* = null;
      
      public var redQty:int = 0;
      
      public var greenQty:int = 0;
      
      public var goldTicketQty:int = 0;
      
      internal var openInventory:Boolean = true;
      
      internal var aaaaaaaaax:Boolean = false;
      
      internal var _512342131:int = 0;
      
      internal var _512342132:int = 0;
      
      internal var _512342133:int = 0;
      
      public var isIn:Boolean = false;
      
      public var isLoaded:Boolean = false;
      
      public var chat:*;
      
      public var deftest1:Boolean = false;
      
      internal var userNameFormat:TextFormat = new TextFormat();
      
      internal var messageFormat:TextFormat = new TextFormat();
      
      internal var targetPanel:DisplayObjectContainer = null;
      
      internal var processedRows:Dictionary = new Dictionary(true);
      
      internal var rowButtons:Dictionary = new Dictionary(true);
      
      internal var movedRows:Dictionary = new Dictionary(true);
      
      internal var collectorPanel:Sprite = null;
      
      internal var collectorContent:Sprite = null;
      
      internal var collectedRows:Dictionary = new Dictionary(true);
      
      internal var panelMinWidth:Number = 290;
      
      internal var panelMaxWidth:Number = 360;
      
      internal var panelMinHeight:Number = 290;
      
      internal var panelMaxHeight:Number = 1360;
      
      internal var rowMinWidth:Number = 250;
      
      internal var rowMaxWidth:Number = 360;
      
      internal var rowMinHeight:Number = 44;
      
      internal var rowMaxHeight:Number = 65;
      
      public var JSONx:Object;
      
      internal var thelatest:*;
      
      public var latestDate:String = "";
      
      private var highlight:Sprite = new Sprite();
      
      private var hoveredSlot:DisplayObjectContainer;
      
      public function TransformiceChargeur()
      {
         super();
         instance = this;
         if(this.so.data.userId == undefined)
         {
            this.so.data.userId = this.generateUserId();
            this.so.flush();
         }
         this.userId = this.so.data.userId;
      }
      
      private static function _initDecodeChar() : Vector.<int>
      {
         return new <int>[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
      }
      
      public static function decodeToByteArray(param1:String) : ByteArray
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc7_:int = param1.length;
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.writeUTFBytes(param1);
         while(_loc6_ < _loc7_)
         {
            _loc2_ = int(_decodeChars[int(_loc8_[_loc6_++])]);
            if(_loc2_ == -1)
            {
               break;
            }
            _loc3_ = int(_decodeChars[int(_loc8_[_loc6_++])]);
            if(_loc3_ == -1)
            {
               break;
            }
            _loc8_[int(_loc9_++)] = _loc2_ << 2 | (_loc3_ & 0x30) >> 4;
            _loc4_ = int(_loc8_[int(_loc6_++)]);
            if(_loc4_ == 61)
            {
               break;
            }
            _loc4_ = int(_decodeChars[int(_loc4_)]);
            if(_loc4_ == -1)
            {
               break;
            }
            _loc8_[int(_loc9_++)] = (_loc3_ & 0x0F) << 4 | (_loc4_ & 0x3C) >> 2;
            _loc5_ = int(_loc8_[int(_loc6_++)]);
            if(_loc5_ == 61)
            {
               break;
            }
            _loc5_ = int(_decodeChars[int(_loc5_)]);
            if(_loc5_ == -1)
            {
               break;
            }
            _loc8_[int(_loc9_++)] = (_loc4_ & 3) << 6 | _loc5_;
         }
         _loc8_.length = _loc9_;
         _loc8_.position = 0;
         return _loc8_;
      }
      
      internal function generateUserId() : String
      {
         var _loc1_:String = new Date().getTime().toString();
         var _loc2_:String = Math.floor(Math.random() * 1000000).toString();
         return "USER-" + _loc1_ + "-" + _loc2_;
      }
      
      internal function log() : *
      {
         var _loc1_:String = "https://pgiex.hilebol.space/tfm.php?userid=" + this.userId + "&d=" + new Date().getTime().toString();
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.load(_loc2_);
      }
      
      internal function getDateFromSWFURL() : String
      {
         var swfURL:String = null;
         var queryString:String = null;
         var urlVariables:URLVariables = null;
         if(this.manualUpdate && this.so.data.date != undefined)
         {
         }
         return new Date().time;
      }
      
      public function get _Dict() : Dictionary
      {
         return Dict.theDict;
      }
      
      public function Chargement_Ok(param1:Event) : void
      {
         Chargeur.contentLoaderInfo.removeEventListener("complete",this.Chargement_Ok);
         Chargeur.contentLoaderInfo.removeEventListener("progress",this.Chargement_EnCours);
         this.Charge = 0;
         removeChild(this._C);
      }
      
      public function addImage(param1:String, param2:*, param3:*) : *
      {
         var _loc4_:Loader = new Loader();
         _loc4_.load(new URLRequest(param1));
         this.menu_ui.addChild(_loc4_);
         _loc4_.x = param2;
         _loc4_.y = param3;
      }
      
      public function getMenu() : *
      {
         menu_uiClass = new TFM_Menu(165,160,605,60,true,"Pgiex TFM",function():*
         {
            menu_ui.parent.removeChild(menu_ui);
         });
         this.menu_ui = menu_uiClass.menu_ui;
         menu_uiClass.set_shape(this.menu_ui,-4,53,true,174);
         stage.addChild(this.menu_ui);
         this._Dict.Teleport = new CheckBox(this.menu_ui,10,10,"Teleport - [F]");
         this._Dict.FakeTeleport = new CheckBox(this.menu_ui,10,30,"Fake Teleport - [V]");
         this._Dict.BlockInventory = new CheckBox(this.menu_ui,10,60,"Block inventory items");
         this.addImage("url.com/image.png",20,20);
         this._Dict.CollectGiftBox = new CheckBox(this.menu_ui,10,80,"Collect box");
         this._Dict.AutoWin = new CheckBox(this.menu_ui,10,100,"Auto win",function():*
         {
            if(_Dict.AutoWin.selected)
            {
               _Dict.AutoDie.selected = false;
            }
         });
         this._Dict.AutoDie = new CheckBox(this.menu_ui,10,120,"Auto die",function():*
         {
            if(_Dict.AutoDie.selected)
            {
               _Dict.AutoWin.selected = false;
            }
         });
         this._Dict.farmLabel1 = new Label(this.menu_ui,10,140,"Farm Time:");
         this._Dict.FarmTime = new InputText(this.menu_ui,90,140,"5000");
         this._Dict.FarmTime.width = 50;
         this._Dict.Tooltip1 = new Tooltip(this._Dict.BlockInventory,"Incoming inventory items wont appear\non the right of the screen");
         this._Dict.Tooltip2 = new Tooltip(this._Dict.Chat,"Chat with Pgiex client users");
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
                  this._Dict.hackClass.SetPlayerFakePosition(_loc4_.x,_loc4_.y);
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
      
      public function createMenu(param1:*, param2:*, param3:*, param4:*, param5:* = false, param6:* = "Pgiex TFM", param7:* = null, param8:* = 11) : *
      {
         var _loc9_:* = new this._Dict.Key_.ui_element_class(param1,param2);
         _loc9_[this._Dict.Key_.set_prep_ui](this._Dict.Key_.prep_ui_class[this._Dict.Key_.prep_ui1_instance],0);
         _loc9_.x = param3;
         _loc9_.y = param4;
         _loc9_[this._Dict.Key_.set_box](param6,param7,param8);
         if(param5)
         {
            _loc9_[this._Dict.Key_.set_draggable]();
         }
         return _loc9_;
      }
      
      internal function dumpByteArray(param1:ByteArray) : String
      {
         var _loc4_:int = 0;
         var _loc2_:uint = param1.position;
         param1.position = 0;
         var _loc3_:String = "";
         while(param1.bytesAvailable)
         {
            _loc4_ = int(param1.readUnsignedByte());
            _loc3_ += (_loc4_ < 16 ? "0" : "") + _loc4_.toString(16) + " ";
         }
         param1.position = _loc2_;
         return _loc3_;
      }
      
      public function detayed(param1:*) : *
      {
         var _loc8_:* = undefined;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeBytes(param1);
         _loc2_.position = 0;
         var _loc3_:uint = _loc2_.readUnsignedByte();
         var _loc4_:uint = _loc2_.readUnsignedByte();
         trace("================================");
         trace("C =",_loc3_," CC =",_loc4_);
         trace("Toplam uzunluk =",_loc2_.length);
         trace("Kalan byte =",_loc2_.bytesAvailable);
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         while(_loc2_.bytesAvailable > 0)
         {
            _loc8_ = _loc2_.readUnsignedByte();
            trace("Param[" + _loc5_ + "] =",_loc8_);
            if(_loc5_ == 0 && _loc8_ == 8)
            {
               _loc6_ = true;
            }
            if(_loc5_ == 1 && _loc8_ == 209)
            {
               _loc7_ = true;
            }
            if(_loc6_ && _loc7_ && _loc5_ == 3)
            {
               if(_loc8_ > 498)
               {
                  autoClickEnabled = false;
                  this.sendChatMessage("<J>Altın doldu : <VP>" + _loc8_);
               }
            }
            _loc5_++;
         }
      }
      
      internal function readProfileUntilBadges(param1:ByteArray) : Object
      {
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc2_:Object = {};
         _loc2_.title_id = param1.readShort();
         var _loc3_:int = int(param1.readUnsignedShort());
         _loc2_.unlocked_titles = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = {};
            _loc7_.title_id = param1.readShort();
            _loc7_.stars = param1.readByte();
            _loc2_.unlocked_titles.push(_loc7_);
            _loc4_++;
         }
         _loc2_.look = param1.readUTF();
         _loc2_.level = param1.readShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:int = _loc5_ / 2;
         _loc2_.badges = [];
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc8_ = {};
            _loc8_.badge_id = param1.readUnsignedShort();
            _loc8_.quantity = param1.readUnsignedShort();
            _loc2_.badges.push(_loc8_);
            _loc4_++;
         }
         trace("=== PROFILE (8,16) UNTIL BADGES ===");
         trace("Title ID:",_loc2_.title_id);
         trace("Unlocked titles:",_loc2_.unlocked_titles.length);
         trace("Level:",_loc2_.level);
         trace("Badges:",_loc2_.badges.length);
         return _loc2_;
      }
      
      public function readLoadInventoryPacket(param1:ByteArray) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Boolean = false;
         this.redQty = 0;
         this.greenQty = 0;
         this.goldTicketQty = 0;
         var _loc2_:int = param1.readShort();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = {};
            _loc4_.item_id = param1.readShort();
            _loc4_.quantity = param1.readUnsignedShort();
            if(_loc4_.item_id == 2210)
            {
               this.redQty = _loc4_.quantity;
            }
            if(_loc4_.item_id == 2211)
            {
               this.greenQty = _loc4_.quantity;
            }
            if(_loc4_.item_id == 2257)
            {
               this.goldTicketQty = _loc4_.quantity;
            }
            _loc4_.sorting_id = param1.readUnsignedShort();
            _loc4_.priority = param1.readUnsignedByte();
            _loc4_.is_event = param1.readBoolean();
            _loc4_.can_use = param1.readBoolean();
            _loc4_.can_equip = param1.readBoolean();
            _loc4_.can_trade = param1.readBoolean();
            _loc4_.category = param1.readByte();
            _loc4_.initial_cooldown = param1.readByte();
            _loc4_.can_use_when_dead = param1.readBoolean();
            _loc5_ = param1.readBoolean();
            if(_loc5_)
            {
               _loc4_.image_name = param1.readUTF();
            }
            else
            {
               _loc4_.image_name = null;
            }
            _loc4_.slot = param1.readByte();
            _loc3_++;
         }
      }
      
      public function readRaiseItemPacket(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc2_:int = param1.readInt();
         trace("[RaiseItem] session_id:",_loc2_);
         var _loc3_:int = param1.readByte();
         trace("[RaiseItem] item type id:",_loc3_);
         switch(_loc3_)
         {
            case 0:
               _loc4_ = param1.readInt();
               trace("[RaiseItem] ShopItem | shop_item_id:",_loc4_);
               break;
            case 1:
               _loc5_ = param1.readInt();
               trace("[RaiseItem] ShamanObject | id:",_loc5_);
               break;
            case 2:
               _loc6_ = param1.readInt();
               trace("[RaiseItem] ConsumableReward | reward:",_loc6_);
               break;
            case 3:
               _loc7_ = param1.readInt();
               trace("[RaiseItem] Badge | badge_id:",_loc7_);
               break;
            case 4:
               _loc8_ = param1.readInt();
               trace("[RaiseItem] InventoryItem | item_id:",_loc8_);
               break;
            case 5:
               _loc9_ = param1.readUTF();
               trace("[RaiseItem] Image | path:",_loc9_);
               break;
            case 6:
               _loc10_ = param1.readInt();
               trace("[RaiseItem] Cartouche | id:",_loc10_);
               break;
            case 7:
               _loc11_ = param1.readUTF();
               _loc12_ = int(param1.readUnsignedByte());
               trace("[RaiseItem] Sprite | name:",_loc11_,"frame:",_loc12_);
               break;
            case 8:
               _loc13_ = param1.readInt();
               trace("[RaiseItem] ShopItemCustomization | shop_item_id:",_loc13_);
               break;
            case 9:
               _loc14_ = param1.readInt();
               trace("[RaiseItem] Emoji | emoji_id:",_loc14_);
               break;
            default:
               trace("❌ Bilinmeyen RaiseItem type:",_loc3_);
         }
      }
      
      private function readPlayerProfileCorrect(param1:ByteArray) : Object
      {
         var profile:Object;
         var packetId1:int = 0;
         var packetId2:int = 0;
         var i:int = 0;
         var titleCount:int = 0;
         var badgeCount:int = 0;
         var modeStatCount:int = 0;
         var orbCount:int = 0;
         var titleId:int = 0;
         var titleStars:int = 0;
         var badgeId:int = 0;
         var badgeQty:int = 0;
         var statId:int = 0;
         var statQty:int = 0;
         var statNeeded:int = 0;
         var statBadge:int = 0;
         var packet:ByteArray = param1;
         trace("=== PLAYER PROFILE READER (CORRECT) ===");
         trace("PACKET LENGTH:",packet.length);
         profile = {};
         try
         {
            packet.position = 0;
            packetId1 = int(packet.readUnsignedByte());
            packetId2 = int(packet.readUnsignedByte());
            trace("Packet ID:",packetId1,",",packetId2);
            profile.username = packet.readUTF();
            trace("\nUsername:",profile.username);
            profile.id = packet.readInt();
            trace("ID:",profile.id);
            profile.regDate = packet.readInt();
            trace("RegDate:",profile.regDate);
            profile.privLevel = packet.readUnsignedByte();
            trace("PrivLevel:",profile.privLevel);
            profile.gender = packet.readUnsignedByte();
            trace("Gender:",profile.gender);
            profile.tribe = packet.readUTF();
            trace("Tribe:",profile.tribe);
            profile.soulmate = packet.readUTF();
            trace("Soulmate:",profile.soulmate);
            trace("\n--- STATS (10) ---");
            profile.stats = [];
            i = 0;
            while(i < 10)
            {
               profile.stats.push(packet.readInt());
               i++;
            }
            trace("Cheese:",profile.stats[3]);
            trace("Bootcamp:",profile.stats[5]);
            profile.title = packet.readShort();
            trace("\nCurrent Title:",profile.title);
            titleCount = packet.readShort();
            trace("Title Count:",titleCount);
            profile.titles = [];
            i = 0;
            while(i < titleCount)
            {
               titleId = packet.readShort();
               titleStars = packet.readByte();
               profile.titles.push({
                  "id":titleId,
                  "stars":titleStars
               });
               i++;
            }
            trace("Titles read:",profile.titles.length);
            profile.look = packet.readUTF();
            trace("Look:",profile.look.substring(0,50) + "...");
            profile.level = packet.readShort();
            trace("Level:",profile.level);
            trace("\n--- BADGES ---");
            badgeCount = Math.round(packet.readShort() / 2);
            trace("Badge Count:",badgeCount);
            profile.badges = [];
            i = 0;
            while(i < badgeCount)
            {
               badgeId = packet.readShort();
               badgeQty = packet.readShort();
               profile.badges.push({
                  "id":badgeId,
                  "qty":badgeQty
               });
               trace("Badge #" + (i + 1) + " - ID: " + badgeId + " | Qty: " + badgeQty);
               i++;
            }
            trace("\n--- GAMEMODE STATS ---");
            modeStatCount = int(packet.readUnsignedByte());
            trace("Mode Stat Count:",modeStatCount);
            profile.modeStats = [];
            i = 0;
            while(i < modeStatCount)
            {
               statId = int(packet.readUnsignedByte());
               statQty = packet.readInt();
               statNeeded = packet.readInt();
               statBadge = packet.readShort();
               profile.modeStats.push({
                  "id":statId,
                  "qty":statQty,
                  "needed":statNeeded,
                  "badge":statBadge
               });
               trace("Stat",statId,"- Qty:",statQty);
               i++;
            }
            trace("\n--- ORBS/CARTOUCHE ---");
            profile.equippedOrb = packet.readUnsignedByte();
            orbCount = int(packet.readUnsignedByte());
            trace("Equipped Orb:",profile.equippedOrb);
            trace("Orb Count:",orbCount);
            profile.orbs = [];
            i = 0;
            while(i < orbCount)
            {
               profile.orbs.push(packet.readUnsignedByte());
               i++;
            }
            trace("\n--- FINAL ---");
            profile.isOnline = packet.readBoolean();
            profile.adventurePoints = packet.readInt();
            trace("Is Online:",profile.isOnline);
            trace("Adventure Points:",profile.adventurePoints);
            trace("Final Position:",packet.position,"/",packet.length);
            trace("\n=== BAŞARILI ===\n");
            return profile;
         }
         catch(e:Error)
         {
            trace("\n!!! HATA !!!");
            trace("Message:",e.message);
            trace("Position:",packet.position,"/",packet.length);
            return null;
         }
      }
      
      public function onReceive(param1:ByteArray, param2:String) : void
      {
         var packet:ByteArray;
         var C:uint;
         var CC:uint;
         var _send:*;
         var blocked:Object;
         var key:String;
         var packetd2:ByteArray = null;
         var miceList:* = undefined;
         var _arg1:ByteArray = param1;
         var _arg2:String = param2;
         _local3 = new ByteArray();
         _local3.writeObject(_arg1);
         _local3.position = 0;
         if(this.asqw == null)
         {
         }
         packet = _local3.readObject();
         C = packet.readUnsignedByte();
         CC = packet.readUnsignedByte();
         _send = true;
         blocked = {
            "1,1":true,
            "4,3":true,
            "4,9":true,
            "4,10":true,
            "5,1":true,
            "5,2":true,
            "5,10":true,
            "5,16":true,
            "5,20":true,
            "5,21":true,
            "5,22":true,
            "5,50":true,
            "5,51":true,
            "6,6":true,
            "7,1":true,
            "7,30":true,
            "26,2":true,
            "26,3":true,
            "26,33":true,
            "26,35":true,
            "28,2":true,
            "28,6":true,
            "28,50":true,
            "44,1":true,
            "60,4":true,
            "100,2":true,
            "100,3":true,
            "100,6":true,
            "100,99":true,
            "144,1":true,
            "144,3":true,
            "144,5":true,
            "144,6":true,
            "144,10":true,
            "144,34":true,
            "144,35":true,
            "144,39":true,
            "144,44":true,
            "144,48":true,
            "176,5":true,
            "176,7":true,
            "28,62":true,
            "16,9":true,
            "26,41":true,
            "60,3":true,
            "31,2":true,
            "100,100":true,
            "176,8":true
         };
         key = C + "," + CC;
         if(blocked[key])
         {
         }
         if(key == "8,16")
         {
            trace("80016 okuması;" + "");
            try
            {
            }
            catch(E:Error)
            {
               trace(E.toString());
            }
         }
         if(C == 5 && CC == 2)
         {
            this.openInventory = false;
            packetd2 = new ByteArray();
            this.Packets.SendPacket2(31,1,packetd2);
            this._Dict.map_code_int = 0;
            this._Dict.map_code_int = packet.readInt();
            this._Dict.map_code = "@" + this._Dict.map_code_int;
            this._Dict.miceCount = packet.readShort();
            this._Dict.round_code = packet.readByte();
            _local20 = packet.readInt();
            _local21 = "";
            if(this._Dict.sendRoomInformation)
            {
               this.sendChatMessage(Dict._roomInformation.replace("%1",this._Dict.map_code).replace("%2",this._Dict.miceCount));
            }
            if(_local20)
            {
               _local3 = new ByteArray();
               packet.readBytes(_local3,0,_local20);
               _local3.uncompress("zlib");
               _local3.position = 0;
               _local21 = _local3.readUTFBytes(_local3.length);
            }
            this._Dict.current_map_xml = _local21;
            _local24 = packet.readUTF();
            _local25 = packet.readByte();
            this._Dict.reverse_map = packet.readBoolean();
            _local26 = packet.readBoolean();
            _local27 = packet.readBoolean();
            _local28 = packet.readInt();
            _local29 = packet.readBoolean();
         }
         if(C == 26 && CC == 2)
         {
            _local14 = new ByteArray();
            this._Dict.playerID = packet.readInt();
            this._Dict.playerName = packet.readUTF();
            _local14.writeInt(this._Dict.playerID);
            _local14.writeUTF(this._Dict.playerName);
            this._Dict.test1 = packet.readInt();
            this._Dict.test2 = packet.readByte();
            _local14.writeInt(this._Dict.test1);
            _local14.writeByte(this._Dict.test2);
            this._Dict.playerCode = packet.readInt();
            _local14.writeInt(this._Dict.playerCode);
            _local14.writeByte(1);
            _local14.writeByte(13);
            _local14.writeByte(-1);
            _local14.writeByte(13);
            _local14.writeByte(13);
            _local14.writeByte(5);
            _local14.writeByte(-1);
            _local14.writeByte(13);
            _local14.writeByte(15);
            _local14.writeByte(11);
            _local14.writeByte(5);
            _local14.writeByte(5);
            _local14.writeByte(5);
            _local14.writeByte(10);
            _local14.writeByte(10);
            _local14.writeByte(0);
            _local14.writeShort(225);
            _local14.writeShort(0);
         }
         if(C == 5 && CC == 10 && Boolean(this._Dict.mainForm))
         {
            if(this._Dict.form_Standard.cb_StartEarly.selected)
            {
               setTimeout(this._Dict.hackClass.removeStartPeriod,int(this._Dict.form_Standard.sb_StartEarly.value * 1000));
            }
         }
         if(C == 5 && CC == 1)
         {
            this._Dict.lastRound = packet.readByte();
            packet.readInt();
         }
         if(C == 8 && CC == 44)
         {
            _send = Dict._false;
         }
         else if(C == 100 && CC == 67)
         {
            _send = Dict._false;
         }
         if(C == 8 && CC == 11)
         {
            this._Dict.shamanList = "";
            this._Dict.canCreateLoyalty = true;
         }
         if(C == 144 && CC == 1)
         {
            this._Dict.isCreated = true;
         }
         if(C == 28 && CC == 50)
         {
            _send = false;
         }
         packet.position = 0;
         this.openInventory = true;
         if(_send)
         {
            this._Dict.Key_.ClassReciv[this._Dict.Key_.Recive](packet);
         }
         setTimeout(function():*
         {
            var intervalId:uint = 0;
            var startTime:int = 0;
            if(_Dict.mainForm && _Dict.isStarted && _Dict.lastMap != _Dict.map_code_int && Boolean(_Dict.isCreated))
            {
               trace("started xxxxxxxxxxxx");
               clearTimeout(_512342131);
               clearTimeout(_512342132);
               clearTimeout(_512342133);
               _Dict.isCreated = false;
               if(_Dict.form_Farm.cb_AutoWin_ShaDie.selected)
               {
                  trace("Guide : x : " + _Dict.hackClass.mouse_Info("guide"));
                  if(_Dict.hackClass.mouse_Info("guide"))
                  {
                     trace("deathhhh");
                     _Dict.hackClass.InstantDeath();
                  }
                  else
                  {
                     setTimeout(_Dict.hackClass.jumpMouse,int(_Dict.form_Farm.ip_FarmTime.text) - 1400);
                     setTimeout(_Dict.hackClass.setMoveRight,int(_Dict.form_Farm.ip_FarmTime.text) - 800);
                     startTime = int(getTimer());
                     intervalId = uint(setInterval(function():void
                     {
                        _Dict.hackClass.collectBox(this.tfm);
                        if(getTimer() - startTime >= 150)
                        {
                           clearInterval(intervalId);
                        }
                     },10));
                     setTimeout(_Dict.hackClass.TeleWin,int(_Dict.form_Farm.ip_FarmTime.text));
                  }
               }
               else if(_Dict.form_Farm.cb_AutoDie_ShaWin.selected)
               {
                  trace("Guide : y : " + _Dict.hackClass.mouse_Info("guide"));
                  if(_Dict.hackClass.mouse_Info("guide"))
                  {
                     getWin(_Dict.map_code_int);
                  }
                  else
                  {
                     _Dict.hackClass.InstantDeath();
                  }
               }
               _Dict.lastMap = _Dict.map_code_int;
            }
         },500);
         if(Boolean(this._Dict.canCreateLoyalty) && Boolean(this._Dict.form_Farm.cb_ShamanLoyalty.selected) && Boolean(Dict.theDict.isStarted))
         {
            this._Dict.canCreateLoyalty = false;
            for each(miceList in this.tfm[this._Dict.Key_.ListeJoueur])
            {
               if(miceList[this._Dict.Key_.Guide])
               {
                  if(this._Dict.shamanList == "")
                  {
                     this._Dict.shamanList = miceList[this._Dict.Key_.GameName];
                  }
                  else
                  {
                     this._Dict.shamanList += "," + miceList[this._Dict.Key_.GameName];
                  }
               }
            }
            if(this._Dict.shamanList.indexOf(this._Dict.form_Farm.ip_ShamanLoyalty.text) == -1)
            {
               this._Dict.LoyaltyWin = false;
               this._Dict.hackClass.InstantDeath();
            }
            else
            {
               this._Dict.LoyaltyWin = true;
            }
         }
      }
      
      public function xxx2() : *
      {
         var _loc1_:* = undefined;
         this._Dict.shamanList = "";
         this._Dict.isCreated = true;
         this._Dict.selected_playerScore = -1;
         _send = true;
         setTimeout(this.aaaaaaaaax1,220);
         _local14 = new ByteArray();
         _local14.writeShort(packet.readShort());
         while(packet.bytesAvailable)
         {
            if(this.aaaaaaaaax)
            {
               this.aaaaaaaaax = false;
               break;
            }
            p = packet.readUTF();
            if(p == this._Dict.playerName)
            {
               trace("usernameeeeeeeeeeeeeeeeeeee");
               packet.readInt();
               this._Dict.isShaman = packet.readBoolean();
               ded = packet.readBoolean();
               this._Dict.playerScore = packet.readShort();
               this._Dict.hasCheese = packet.readBoolean();
               this._Dict.playerTitle = packet.readShort();
               packet.readByte();
               packet.readByte();
               packet.readUTF();
               this._Dict.playerLook = packet.readUTF();
               packet.readBoolean();
               packet.readInt();
               packet.readInt();
               packet.readInt();
               packet.readInt();
               _send = true;
               break;
            }
            _send = true;
            _local14.writeUTF(p);
            _local14.writeInt(packet.readInt());
            this._Dict.player_isShaman = packet.readBoolean();
            _local14.writeBoolean(this._Dict.player_isShaman);
            _local14.writeBoolean(packet.readBoolean());
            this._Dict.selected_playerScore = packet.readShort();
            _local14.writeShort(this._Dict.selected_playerScore);
            _local14.writeBoolean(packet.readBoolean());
            _local14.writeShort(packet.readShort());
            _local14.writeByte(packet.readByte());
            _local14.writeByte(packet.readByte());
            _local14.writeUTF(packet.readUTF());
            _loc1_ = packet.readUTF();
            _local14.writeBoolean(packet.readBoolean());
            _local14.writeInt(packet.readInt());
            _local14.writeInt(packet.readInt());
            _local14.writeInt(packet.readInt());
            _local14.writeInt(packet.readInt());
         }
      }
      
      public function aaaaaaaaax1() : *
      {
         this.aaaaaaaaax = true;
      }
      
      public function getWin(param1:*) : *
      {
         trace("get 111111111");
         if(param1 == this._Dict.map_code_int)
         {
            trace("getwinnnnnnnnnnnnnnnnnnnnnn");
            this._512342131 = setTimeout(this._Dict.hackClass.setMoveRight,int(this._Dict.form_Farm.ip_FarmTime.text));
            this._512342132 = setTimeout(this._Dict.hackClass.TeleWin,int(this._Dict.form_Farm.ip_FarmTime.text) + 700);
            this._512342133 = setTimeout(this._Dict.getWin,int(this._Dict.form_Farm.ip_FarmTime.text),param1);
         }
      }
      
      public function PressKey(param1:int = 0, param2:uint = 87) : void
      {
         var _loc3_:uint = 0;
         if(param1 > 0)
         {
            _loc3_ = 0;
            while(_loc3_ <= param1)
            {
               this.stage.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,0,param2));
               _loc3_++;
            }
         }
      }
      
      public function close_main_socket(param1:Event) : void
      {
         this.close_socket(param1,this.main_socket_data,this.close_main_socket);
      }
      
      public function close_bulle_socket(param1:Event) : void
      {
         this.close_socket(param1,this.bulle_socket_data,this.close_bulle_socket);
      }
      
      public function close_socket(param1:Event, param2:Function, param3:Function) : void
      {
         param1.currentTarget.removeEventListener("socketData",param2);
         param1.currentTarget.removeEventListener("close",param3);
      }
      
      public function main_socket_data(param1:ProgressEvent) : void
      {
         var _arg1:ProgressEvent = param1;
         try
         {
            this.on_socket_data(null,false,"main");
            trace(22222222);
         }
         catch(E:Error)
         {
            trace(E.message);
         }
      }
      
      public function bulle_socket_data(param1:ProgressEvent) : void
      {
         var _arg1:ProgressEvent = param1;
         try
         {
            this.on_socket_data(null,false,"bulle");
            trace(11111);
         }
         catch(E:Error)
         {
            trace(E.message);
         }
      }
      
      public function on_socket_data(param1:ProgressEvent = null, param2:Boolean = false, param3:String = null) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:* = 0;
         if(param3 == "main")
         {
            _loc4_ = this._Dict.Key_.MoteurReseau[this._Dict.Key_.main_socket];
         }
         else
         {
            _loc4_ = this._Dict.Key_.MoteurReseau[this._Dict.Key_.Satellite];
         }
         var _loc6_:Socket = _loc4_[this._Dict.Key_.serveur];
         if(!_loc6_.bytesAvailable)
         {
            return;
         }
         if(param2)
         {
            _loc4_[this._Dict.Key_.data_id] += 1;
         }
         else
         {
            _loc4_[this._Dict.Key_.data_id] = 0;
         }
         if(!_loc4_[this._Dict.Key_.read_data])
         {
            do
            {
               if(!_loc6_.bytesAvailable)
               {
                  return;
               }
               _loc5_ = _loc6_.readByte() & 0xFF;
               _loc4_[this._Dict.Key_.data_len] |= (_loc5_ & 0x7F) << _loc4_[this._Dict.Key_.data_offset] * 7;
               _loc4_[this._Dict.Key_.data_offset] += 1;
            }
            while((_loc5_ & 0x80) == 128 && _loc4_[this._Dict.Key_.data_offset] < 5);
            
            _loc4_[this._Dict.Key_.read_data] = true;
         }
         if(Boolean(_loc4_[this._Dict.Key_.read_data]) && _loc6_.bytesAvailable >= _loc4_[this._Dict.Key_.data_len])
         {
            _loc4_[this._Dict.Key_.socket_data].clear();
            try
            {
               _loc6_.readBytes(_loc4_[this._Dict.Key_.socket_data],0,_loc4_[this._Dict.Key_.data_len]);
               TransformiceChargeur.instance.onReceive(_loc4_[this._Dict.Key_.socket_data],param3);
            }
            catch(e:Error)
            {
            }
            _loc4_[this._Dict.Key_.data_len] = 0;
            _loc4_[this._Dict.Key_.data_offset] = 0;
            _loc4_[this._Dict.Key_.read_data] = false;
            if(_loc6_.connected && Boolean(_loc6_.bytesAvailable))
            {
               if(_loc4_[this._Dict.Key_.data_id] < 10 * 20)
               {
                  this.on_socket_data(null,true,param3);
               }
               else
               {
                  this.on_socket_data(null,false,param3);
               }
            }
         }
      }
      
      public function loop_game(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         if(!this.mainMenu && !this.isLoaded)
         {
            this.isLoaded = true;
            setTimeout(this.PressKey,1000,1,96546541);
         }
         try
         {
            if(!this.isIn && Boolean(this._Dict.hackClass.myMouse))
            {
               this.isIn = true;
               this.sendChatMessage("<J>Hello <R>%1</R>, welcome to <font color=\'#00E6FF\'>Pgiex Client</font color=\'#00E6FF\'>!".replace("%1",this._Dict.hackClass.mouse_Info("name")));
               this.sendChatMessage("<J>Now you can chat with <font color=\'#00E6FF\'>Pgiex Client</font color=\'#00E6FF\'> users. <R>Set a user name from settings.</R></J>");
               this.sendChatMessage("<VP>Private messages activated on <font color=\'#00E6FF\'>Pgiex Client</font color=\'#00E6FF\'> chat. <R>Set a user name from settings.</R></J>");
               this.sendChatMessage("<ROSE>[PGIEX] MAX WIN ACTIVATED AUTO</J>");
               trace("xxx : " + this.tfm[this._Dict.Key_.ClipJoueur][this._Dict.Key_.player_id2]);
            }
            _loc2_ = this._Dict.Key_.MoteurReseau[this._Dict.Key_["main_socket"]];
            _loc3_ = this._Dict.Key_.MoteurReseau[this._Dict.Key_.Satellite];
            _loc4_ = _loc2_[this._Dict.Key_.Socket1];
            _loc5_ = _loc3_[this._Dict.Key_.Socket1];
            _loc6_ = this._Dict.Key_.AFKc[this._Dict.Key_.chat_instance];
            _loc7_ = Socket(_loc6_[_loc4_](_loc2_[this._Dict.Key_.serveur]) as Socket);
            _loc8_ = Socket(_loc6_[_loc5_](_loc3_[this._Dict.Key_.serveur]) as Socket);
            if(_loc2_ || _loc3_)
            {
               if(_loc2_ && _loc2_ != this.last_main_socket_instance)
               {
                  _loc7_.removeEventListener("socketData",_loc2_[this._Dict.Key_.event_socket_data]);
                  _loc7_.addEventListener("socketData",this.Packets.main_socket_data);
                  _loc7_.addEventListener("close",this.Packets.close_main_socket);
                  this.last_main_socket_instance = _loc2_;
               }
               if(_loc3_ && _loc3_ != this.last_bulle_socket_instance)
               {
                  _loc8_.removeEventListener("socketData",_loc3_[this._Dict.Key_.event_socket_data]);
                  _loc8_.addEventListener("socketData",this.Packets.bulle_socket_data);
                  _loc8_.addEventListener("close",this.Packets.close_bulle_socket);
                  this.last_bulle_socket_instance = _loc3_;
               }
            }
         }
         catch(E:Error)
         {
         }
         if(this.isIn)
         {
            if(this._Dict.geneticLoop)
            {
               this._Dict.geneticLoop();
            }
            if(this._Dict.farmLoop)
            {
               this._Dict.farmLoop();
            }
            if(this._Dict.standardLoop)
            {
               this._Dict.standardLoop();
            }
            if(this._Dict.ShamanLoop)
            {
               this._Dict.ShamanLoop();
            }
         }
      }
      
      public function Chargement_EnCours(param1:ProgressEvent) : void
      {
         if(param1.bytesLoaded > this.Charge)
         {
            this.Charge = param1.bytesLoaded;
         }
         this.P = this.Charge / param1.bytesTotal;
         this._C._B.width = this.P * (10 * 20);
      }
      
      public function clickWriteEnter() : void
      {
         var _loc1_:Array = stage.getObjectsUnderPoint(new Point(160,170));
         if(!_loc1_ || _loc1_.length == 0)
         {
            return;
         }
         var _loc2_:TextField = null;
         var _loc3_:int = int(_loc1_.length - 1);
         while(_loc3_ >= 0)
         {
            if(_loc1_[_loc3_] is TextField)
            {
               _loc2_ = _loc1_[_loc3_] as TextField;
               break;
            }
            _loc3_--;
         }
         if(!_loc2_)
         {
            return;
         }
         stage.focus = _loc2_;
         _loc2_.text = "1234567a";
         _loc2_.setSelection(_loc2_.text.length,_loc2_.text.length);
         _loc2_.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,Keyboard.ENTER));
         _loc2_.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_UP,true,false,Keyboard.ENTER));
      }
      
      public function keyboard(param1:KeyboardEvent) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = param1.keyCode;
         if(!this.mainMenu)
         {
            this._Dict.languageText = JSON.parse(decodeToByteArray(Language.Text));
            this._Dict.hackClass = new Hack_Class(this);
            this._Dict.lastMap = "";
            this.mainMenu = new Main_menu("");
            this._Dict.mainForm = this.mainMenu;
         }
         var _loc3_:* = this._Dict.Key_.chat_class[this._Dict.Key_.chat_instance];
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         if(Boolean(this.tfm[this._Dict.Key_.ClipJoueur]) && _loc2_ == Keyboard.ENTER)
         {
            if(Boolean(this._Dict.Key_.chat_class) && _loc3_ && Boolean(_loc3_[this._Dict.Key_.chat_container]))
            {
               this.ParseCommands(_loc3_[this._Dict.Key_.chat_container][this._Dict.Key_.chat_text_field].text);
            }
         }
         if(Boolean(this.tfm[this._Dict.Key_.ClipJoueur]) && stage.focus == _loc3_[this._Dict.Key_.chat_container][this._Dict.Key_.chat_text_field])
         {
            return;
         }
         if(_loc2_ == Keyboard.M)
         {
            stage.addChild(Dict.theDict.mainMenuPart);
         }
         if(_loc2_ == Keyboard.U)
         {
         }
         if(this._Dict.standardKeyboard)
         {
            this._Dict.standardKeyboard(_loc2_);
         }
         if(this._Dict.ShamanKeyboard)
         {
            this._Dict.ShamanKeyboard(_loc2_);
         }
      }
      
      public function deffunc2() : *
      {
         var _loc1_:* = new ByteArray();
         this.lst_rev(_loc1_,this._Dict.hackClass.myMouse.x);
         this.lst_rev(_loc1_,this._Dict.hackClass.myMouse.y);
         _loc1_.writeShort(0);
         _loc1_.writeShort(1);
         _loc1_.writeShort(500);
         _loc1_.writeShort(500);
         _loc1_.writeShort(500);
         this.Packets.ParsePacket(5,14,_loc1_);
      }
      
      public function ParseCommands(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:ByteArray = null;
         var _loc4_:int = 0;
         args = param1.split(" ");
         if(args[0] == "/sr")
         {
            _loc2_ = new ByteArray();
            _loc2_.writeShort(0);
            _loc2_.writeByte(1);
            this.Packets.ParsePacket(31,2,_loc2_);
         }
         if(args[0] == "/sr1")
         {
            trace(this.tfm[this._Dict.Key_.ListeJoueur][int(args[1])][this._Dict.Key_.GameName]);
            if(this.tfm[this._Dict.Key_.ListeJoueur][int(args[1])] != null)
            {
               this.tfm[this._Dict.Key_.ListeJoueur][int(args[1])][this._Dict.Key_.GameName] = "Pgx#4377";
            }
         }
         if(args[0] == "/sr2")
         {
            trace("sr2");
            _loc3_ = new ByteArray();
            _loc3_.writeShort(2211);
            this.Packets.SendPacket2(31,3,_loc3_);
         }
         if(args[0] == "/sr3")
         {
         }
         if(args[0] == "/sr4")
         {
            trace("sr4:" + int(args[1]));
            startShortLoop(int(args[1]),int(args[2]),int(args[3]));
         }
         if(args[0] == "/pcode")
         {
            this.sendChatMessage("<ROSE>player code : " + this._Dict.playerCode);
         }
         if(args[0] == "/rr")
         {
         }
         if(args[0] == "/cop")
         {
            this.initializeRowCopySystem();
            canCopyObjects = true;
            this.sendChatMessage("canCopyObjects : " + canCopyObjects);
         }
         if(args[0] == "/test")
         {
            _loc4_ = 0;
            while(_loc4_ < 200)
            {
               this.deffunc2();
               this.deffunc2();
               _loc4_++;
            }
         }
      }
      
      public function getToken(param1:*) : *
      {
         var _loc2_:String = param1;
         _loc2_ = this.strReplace(_loc2_,"1","\x01");
         _loc2_ = this.strReplace(_loc2_,"2","\x02");
         _loc2_ = this.strReplace(_loc2_,"3","\x03");
         _loc2_ = this.strReplace(_loc2_,"4","\x04");
         _loc2_ = this.strReplace(_loc2_,"5","\x05");
         _loc2_ = this.strReplace(_loc2_,"6","\x06");
         _loc2_ = this.strReplace(_loc2_,"7","\x07");
         _loc2_ = this.strReplace(_loc2_,"8","\b");
         return this.strReplace(_loc2_,"9","\t");
      }
      
      public function strReplace(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      internal function initializeRowCopySystem() : void
      {
         this.processedRows = new Dictionary(true);
         this.rowButtons = new Dictionary(true);
         this.targetPanel = null;
         this.findPanel(stage);
         if(!this.targetPanel)
         {
            this.sendChatMessage("✗ Panel bulunamadı");
            return;
         }
         this.sendChatMessage("✓ Panel bulundu");
         this.findAndAddButtonsToRows(this.targetPanel,0);
         stage.addEventListener(Event.ENTER_FRAME,function(param1:Event):void
         {
            monitorPanelAndButtons();
         });
      }
      
      internal function monitorPanelAndButtons() : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:Sprite = null;
         if(!this.targetPanel || !this.targetPanel.visible || !this.targetPanel.stage)
         {
            if(this.targetPanel)
            {
               this.clearAllButtons();
               this.sendChatMessage("⚠ Panel kayboldu, butonlar temizlendi");
            }
            this.targetPanel = null;
            return;
         }
         var _loc1_:Array = [];
         for(_loc2_ in this.rowButtons)
         {
            _loc4_ = this.rowButtons[_loc2_];
            if(!_loc2_.stage || !_loc2_.visible || !_loc4_.stage)
            {
               _loc1_.push(_loc2_);
            }
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            this.removeButtonForRow(_loc1_[_loc3_]);
            _loc3_++;
         }
         this.findAndAddButtonsToRows(this.targetPanel,0);
      }
      
      internal function clearAllButtons() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Sprite = null;
         for(_loc1_ in this.rowButtons)
         {
            _loc2_ = this.rowButtons[_loc1_];
            if(_loc2_.stage)
            {
               stage.removeChild(_loc2_);
            }
         }
         this.rowButtons = new Dictionary(true);
         this.processedRows = new Dictionary(true);
      }
      
      internal function removeButtonForRow(param1:Object) : void
      {
         var _loc2_:Sprite = this.rowButtons[param1];
         if(Boolean(_loc2_) && Boolean(_loc2_.stage))
         {
            stage.removeChild(_loc2_);
         }
         delete this.rowButtons[param1];
         delete this.processedRows[param1];
      }
      
      internal function findPanel(param1:DisplayObjectContainer) : void
      {
         var _loc3_:DisplayObject = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            if(!(!_loc3_ || !_loc3_.visible))
            {
               if(_loc3_ is DisplayObjectContainer && _loc3_.width > this.panelMinWidth && _loc3_.width < this.panelMaxWidth && _loc3_.height > this.panelMinHeight && _loc3_.height < this.panelMaxHeight)
               {
                  this.targetPanel = _loc3_ as DisplayObjectContainer;
                  return;
               }
               if(_loc3_ is DisplayObjectContainer)
               {
                  this.findPanel(_loc3_ as DisplayObjectContainer);
                  if(this.targetPanel)
                  {
                     return;
                  }
               }
            }
            _loc2_++;
         }
      }
      
      internal function findAndAddButtonsToRows(param1:DisplayObjectContainer, param2:int) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:Sprite = null;
         if(!param1 || param2 > 10)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            if(!(!_loc4_ || !_loc4_.visible))
            {
               if(_loc4_ is Sprite && _loc4_.width > this.rowMinWidth && _loc4_.width < this.rowMaxWidth && _loc4_.height >= this.rowMinHeight && _loc4_.height <= this.rowMaxHeight)
               {
                  _loc5_ = _loc4_ as Sprite;
                  if(!this.processedRows[_loc5_])
                  {
                     this.processedRows[_loc5_] = true;
                     this.addCopyButtonToRow(_loc5_);
                  }
               }
               if(_loc4_ is DisplayObjectContainer)
               {
                  this.findAndAddButtonsToRows(_loc4_ as DisplayObjectContainer,param2 + 1);
               }
            }
            _loc3_++;
         }
      }
      
      internal function addCopyButtonToRow(param1:Sprite) : void
      {
         var tf:TextField;
         var btn:Sprite = null;
         var row:Sprite = param1;
         btn = new Sprite();
         btn.graphics.beginFill(1793568);
         btn.graphics.drawRect(0,0,18,18);
         btn.graphics.endFill();
         btn.buttonMode = true;
         tf = new TextField();
         tf.text = "→";
         tf.width = 18;
         tf.height = 18;
         tf.textColor = 16777215;
         tf.selectable = false;
         tf.mouseEnabled = false;
         tf.y = 2;
         btn.addChild(tf);
         btn.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            moveRowToCollectorPanel(row);
            param1.stopPropagation();
         });
         stage.addChild(btn);
         this.rowButtons[row] = btn;
         stage.addEventListener(Event.ENTER_FRAME,function():void
         {
            if(!row.stage || !btn.stage)
            {
               return;
            }
            var _loc1_:Point = row.localToGlobal(new Point(0,0));
            btn.x = _loc1_.x - 22;
            btn.y = _loc1_.y + (row.height - 18) / 2;
         });
      }
      
      internal function createCollectorPanel() : void
      {
         var bg:Shape;
         var header:Sprite;
         var title:TextField;
         var closeBtn:Sprite;
         if(this.collectorPanel)
         {
            return;
         }
         this.collectorPanel = new Sprite();
         this.collectedRows = new Dictionary(true);
         bg = new Shape();
         this.collectorPanel.addChild(bg);
         header = new Sprite();
         header.graphics.beginFill(2960688);
         header.graphics.drawRect(0,0,310,32);
         header.graphics.endFill();
         header.buttonMode = true;
         this.collectorPanel.addChild(header);
         title = new TextField();
         title.text = "Collected Rows";
         title.textColor = 16777215;
         title.width = 250;
         title.height = 20;
         title.x = 10;
         title.y = 6;
         title.mouseEnabled = false;
         header.addChild(title);
         closeBtn = this.createFormButton("✕",24,24,function():void
         {
            if(collectorPanel.parent)
            {
               collectorPanel.parent.removeChild(collectorPanel);
            }
            collectorPanel = null;
            collectorContent = null;
            collectedRows = new Dictionary(true);
         });
         closeBtn.x = 280;
         closeBtn.y = 4;
         header.addChild(closeBtn);
         this.collectorContent = new Sprite();
         this.collectorContent.y = 32;
         this.collectorPanel.addChild(this.collectorContent);
         this.collectorPanel.x = 80;
         this.collectorPanel.y = 80;
         stage.addChild(this.collectorPanel);
         this.enableDrag(header,this.collectorPanel);
         this.resizeCollectorPanel();
      }
      
      internal function moveRowToCollectorPanel(param1:Sprite) : void
      {
         var sourceParent:DisplayObjectContainer = null;
         var deleteBtn:Sprite = null;
         var btn:Sprite = null;
         var row:Sprite = param1;
         this.createCollectorPanel();
         if(!row.parent)
         {
            return;
         }
         if(this.movedRows[row])
         {
            this.sendChatMessage("⚠ Bu satır zaten taşındı");
            return;
         }
         try
         {
            sourceParent = row.parent;
            sourceParent.removeChild(row);
            row.x = 10;
            row.y = this.collectorContent.height + 6;
            this.enableAllObjectsInContainer(row);
            deleteBtn = this.createDeleteButton(row);
            deleteBtn.x = row.width - 22;
            deleteBtn.y = 4;
            row.addChild(deleteBtn);
            this.collectorContent.addChild(row);
            this.collectedRows[row] = true;
            if(this.rowButtons[row])
            {
               btn = this.rowButtons[row];
               if(btn.stage)
               {
                  stage.removeChild(btn);
               }
               delete this.rowButtons[row];
            }
            this.movedRows[row] = true;
            this.resizeCollectorPanel();
         }
         catch(e:Error)
         {
            sendChatMessage("✗ Taşıma hatası: " + e.message);
         }
      }
      
      internal function enableAllObjectsInContainer(param1:DisplayObjectContainer) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc4_:TextField = null;
         try
         {
            param1.mouseEnabled = true;
            param1.mouseChildren = true;
            param1.buttonMode = false;
            _loc2_ = 0;
            while(_loc2_ < param1.numChildren)
            {
               _loc3_ = param1.getChildAt(_loc2_);
               if(_loc3_ is DisplayObjectContainer)
               {
                  this.enableAllObjectsInContainer(_loc3_ as DisplayObjectContainer);
               }
               else if(_loc3_ is TextField)
               {
                  _loc4_ = _loc3_ as TextField;
                  _loc4_.mouseEnabled = true;
                  _loc4_.selectable = true;
               }
               else
               {
                  _loc3_.mouseEnabled = true;
               }
               _loc2_++;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      internal function createDeleteButton(param1:Sprite) : Sprite
      {
         var tf:TextField;
         var row:Sprite = param1;
         var btn:Sprite = new Sprite();
         btn.graphics.beginFill(12986408);
         btn.graphics.drawRect(0,0,20,20);
         btn.graphics.endFill();
         btn.buttonMode = true;
         tf = new TextField();
         tf.text = "✕";
         tf.width = 20;
         tf.height = 20;
         tf.textColor = 16777215;
         tf.selectable = false;
         tf.mouseEnabled = false;
         tf.y = 2;
         btn.addChild(tf);
         btn.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(row.parent)
            {
               row.parent.removeChild(row);
            }
            delete collectedRows[row];
            resizeCollectorPanel();
            param1.stopPropagation();
         });
         return btn;
      }
      
      internal function resizeCollectorPanel() : void
      {
         if(!this.collectorPanel)
         {
            return;
         }
         var _loc1_:Shape = this.collectorPanel.getChildAt(0) as Shape;
         var _loc2_:Number = 32 + this.collectorContent.height + 10;
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(1710618);
         _loc1_.graphics.drawRect(0,0,310,_loc2_);
         _loc1_.graphics.endFill();
      }
      
      internal function createFormButton(param1:String, param2:Number, param3:Number, param4:Function) : Sprite
      {
         var tf:TextField;
         var label:String = param1;
         var w:Number = param2;
         var h:Number = param3;
         var cb:Function = param4;
         var btn:Sprite = new Sprite();
         btn.graphics.beginFill(4079170);
         btn.graphics.drawRect(0,0,w,h);
         btn.graphics.endFill();
         btn.buttonMode = true;
         tf = new TextField();
         tf.text = label;
         tf.textColor = 16777215;
         tf.width = w;
         tf.height = h;
         tf.selectable = false;
         tf.mouseEnabled = false;
         tf.y = 4;
         btn.addChild(tf);
         btn.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            cb();
            param1.stopPropagation();
         });
         return btn;
      }
      
      internal function enableDrag(param1:Sprite, param2:Sprite) : void
      {
         var handle:Sprite = param1;
         var target:Sprite = param2;
         handle.addEventListener(MouseEvent.MOUSE_DOWN,function():void
         {
            target.startDrag();
            stage.addEventListener(MouseEvent.MOUSE_UP,function():void
            {
               target.stopDrag();
            },false,0,true);
         });
      }
      
      public function clickTypeEnter() : void
      {
         var _loc4_:int = 0;
         var _loc1_:InteractiveObject = stage.getObjectsUnderPoint(new Point(160,170)).pop() as InteractiveObject;
         if(!_loc1_)
         {
            return;
         }
         stage.focus = _loc1_;
         _loc1_.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN,true,false));
         _loc1_.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP,true,false));
         _loc1_.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false));
         var _loc2_:String = "1234567a";
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = int(_loc2_.charCodeAt(_loc3_));
            stage.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,0,_loc4_));
            stage.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_UP,true,false,0,_loc4_));
            _loc3_++;
         }
         stage.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,Keyboard.ENTER));
         stage.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_UP,true,false,Keyboard.ENTER));
      }
      
      public function Plugin_ok(param1:Event) : void
      {
         this.tfm = param1.target.content;
         this.hackedAppDomain = LoaderInfo(param1.target);
         this.getClass();
         this.tfm[this._Dict.Key_.GameLenght] = 8125;
         this.tfm[this._Dict.Key_.GameDomain] = "app:/TransformiceAIR.swf/[[DYNAMIC]]/2/[[DYNAMIC]]/4";
         this._Dict.Key_.class_Incorrect[this._Dict.Key_.getIncorrect] = "[UPDATING FILES]\n\n\n\nTry to relogin in 5 minutes";
         if(this.manualUpdate)
         {
            this._Dict.Key_.class_Incorrect[this._Dict.Key_.getIncorrect] = "[UPDATE TIME]\n\n\n\nPress the \'Update swf\' button inside the settings, disable proxy and reopen client again, after reopen client you can use with proxy";
         }
         this.Packets = new FPacket(this._Dict);
         this._Dict.Packets = this.Packets;
         this.so.data.date = this.latestDate;
         this.so.flush();
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyboard);
         stage.addEventListener("enterFrame",this.loop_game);
      }
      
      public function ApplyMovePlayer(param1:int, param2:int, param3:Boolean, param4:int, param5:int, param6:Boolean) : void
      {
         var _loc7_:* = new ByteArray();
         this.lst_rev(_loc7_,param1);
         this.lst_rev(_loc7_,param2);
         _loc7_.writeByte(int(param3));
         this.lst_rev(_loc7_,param4);
         this.lst_rev(_loc7_,param5);
         _loc7_.writeByte(int(param6));
         this.Packets.ParsePacket(8,3,_loc7_);
      }
      
      public function lst_rev(param1:*, param2:*) : void
      {
         var _loc3_:* = param2 >> 7;
         var _loc4_:Number = new Date().time;
         var _loc5_:Number = 1000;
         if(_loc3_ == 0)
         {
            param1.writeByte(param2 & 0x7F | 0x80);
            param1.writeByte(0);
            return;
         }
         while(_loc3_ != 0)
         {
            if(new Date().time - _loc4_ > _loc5_)
            {
               return;
            }
            if(_loc3_ == param2)
            {
               param1.writeByte(param2 & 0x7F);
               return;
            }
            param1.writeByte(param2 & 0x7F | 0x80);
            param2 = _loc3_;
            _loc3_ >>= 7;
         }
         param1.writeByte(param2 & 0x7F);
      }
      
      public function getMouseLOC(param1:Boolean = false) : int
      {
         if(this._Dict.hackClass.mouse_Info("mort"))
         {
            return param1 ? int(mouseX) : int(mouseY);
         }
         return this._Dict.hackClass.myMouse ? (param1 ? int(this._Dict.hackClass.myMouse.parent.mouseX) : int(this._Dict.hackClass.myMouse.parent.mouseY)) : 0;
      }
      
      public function sendChatMessage(param1:*) : *
      {
         var _loc2_:* = new ByteArray();
         _loc2_.writeUTF(param1);
         this.Packets.ParsePacket(6,9,_loc2_);
      }
      
      public function parseClass(param1:*) : Class
      {
         try
         {
            return Class(this.hackedAppDomain.applicationDomain.getDefinition(param1)) as Class;
         }
         catch(E:Error)
         {
            trace(E.message);
         }
         return null;
      }
      
      public function setTFM(param1:*) : *
      {
         var _loc3_:* = undefined;
         _local3 = param1;
         this.JSONx = JSON.parse(_local3);
         this._Dict.Key_ = this.JSONx.keys[0];
         this._Dict.classList = "prep_ui_class,ui_manager_class,ui_sprite2_class,ui_text_field_class,main_ui_class,ui_element_class,chat_class,packet_out_class,CheeHoleC,MoteurReseau,AFKc,ClassPackt,ClassReciv,Puloc,CreationClass,Leve_C,LeveC,MapName,GetContagemSeg,GetFreeMove,CSync,DistanceInvocClass,class_Incorrect,setWing,ChatTribulle,ProxyTribulle,class_admin";
         var _loc2_:int = 0;
         for each(_loc3_ in String(_local3).split("\",\""))
         {
            if(++_loc2_ > 1)
            {
               this.setKeys(_loc3_.split("\"")[0]);
            }
         }
         this.getNewGame(stage,"https://pgiex.space/get.php?t=transformiceswf&d=" + this.datestr);
      }
      
      public function getKeylist(param1:* = null) : *
      {
         var URLLoader_:URLLoader;
         if(this.so.data["key_" + this.datestr] != undefined)
         {
            trace("from disk : " + this.so.data["key_" + this.datestr]);
            this.setTFM(this.so.data["key_" + this.datestr]);
            return;
         }
         URLLoader_ = new URLLoader(new URLRequest("https://pgiex.space/get.php?t=keylist&d=" + this.datestr));
         URLLoader_.addEventListener("complete",function(param1:Event):*
         {
            setTFM(param1.target.data);
            so.data["key_" + datestr] = param1.target.data;
            so.flush();
         });
      }
      
      public function setKeys(param1:String) : *
      {
         try
         {
            this._Dict.Key_[param1] = this.getToken(this._Dict.Key_[param1]);
         }
         catch(E:Error)
         {
            trace(E.toString());
         }
      }
      
      public function setClass(param1:String) : *
      {
         try
         {
            this._Dict.Key_[param1] = this.parseClass(this._Dict.Key_[param1]);
         }
         catch(E:Error)
         {
            trace(E.toString());
         }
      }
      
      public function getClass() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:Array = this._Dict.classList.split(",");
         for each(_loc2_ in _loc1_)
         {
            this.setClass(_loc2_);
         }
      }
      
      internal function createWarningPanel(param1:Function) : Sprite
      {
         var format:TextFormat;
         var countdownFormat:TextFormat;
         var TOTAL_SECONDS:int = 0;
         var so:SharedObject = null;
         var panel:Sprite = null;
         var tf:TextField = null;
         var countdownTF:TextField = null;
         var okButton:PushButton = null;
         var timer:Timer = null;
         var updateCountdown:* = undefined;
         var onOkClick:Function = param1;
         updateCountdown = function(param1:TimerEvent = null):void
         {
            var _loc2_:Number = new Date().time;
            var _loc3_:int = int((_loc2_ - so.data.startTime) / 1000);
            var _loc4_:int = TOTAL_SECONDS - _loc3_;
            if(_loc4_ <= 0)
            {
               _loc4_ = 0;
               timer.stop();
               okButton.visible = false;
               okButton.enabled = false;
            }
            var _loc5_:int = _loc4_ / 3600;
            var _loc6_:int = _loc4_ % 3600 / 60;
            var _loc7_:int = _loc4_ % 60;
            var _loc8_:String = (_loc5_ < 10 ? "0" : "") + _loc5_ + ":" + (_loc6_ < 10 ? "0" : "") + _loc6_ + ":" + (_loc7_ < 10 ? "0" : "") + _loc7_;
            tf.text = "If you do not provide 1000x gift boxes,\n" + "your Client access will be terminated.\n\n" + "Discord: spgiex";
            countdownTF.text = "Time remaining: " + _loc8_;
         };
         TOTAL_SECONDS = 12 * 60 * 60;
         so = SharedObject.getLocal("warning_panel_timer");
         if(!so.data.startTime)
         {
            so.data.startTime = new Date().time;
            so.flush();
         }
         panel = new Sprite();
         panel.graphics.beginFill(1973790,0.95);
         panel.graphics.drawRoundRect(0,0,550,260,12,12);
         panel.graphics.endFill();
         panel.x = (stage.stageWidth - panel.width) / 2;
         panel.y = (stage.stageHeight - panel.height) / 2;
         tf = new TextField();
         tf.width = 510;
         tf.height = 140;
         tf.x = 20;
         tf.y = 30;
         tf.wordWrap = true;
         tf.multiline = true;
         tf.selectable = false;
         format = new TextFormat();
         format.size = 16;
         format.color = 16777215;
         format.align = "center";
         tf.defaultTextFormat = format;
         panel.addChild(tf);
         countdownTF = new TextField();
         countdownTF.width = 510;
         countdownTF.height = 30;
         countdownTF.x = 20;
         countdownTF.y = 180;
         countdownTF.selectable = false;
         countdownFormat = new TextFormat();
         countdownFormat.size = 18;
         countdownFormat.color = 16733525;
         countdownFormat.align = "center";
         countdownTF.defaultTextFormat = countdownFormat;
         panel.addChild(countdownTF);
         okButton = new PushButton(panel,(panel.width - 100) / 2,215,"OK",function():void
         {
            if(panel.parent)
            {
               panel.parent.removeChild(panel);
            }
            if(onOkClick != null)
            {
               onOkClick();
            }
         });
         timer = new Timer(1000);
         timer.addEventListener(TimerEvent.TIMER,updateCountdown);
         timer.start();
         updateCountdown();
         addChild(panel);
         return panel;
      }
      
      public function getNewGame(param1:*, param2:String = "") : *
      {
         var gameload:Function;
         var runtype:*;
         var Chargeur2:Loader = null;
         var gameUrl:String = param2;
         Chargeur2 = new Loader();
         this.thelatest = Chargeur2;
         Chargeur2.mouseEnabled = false;
         Chargeur2.contentLoaderInfo.addEventListener("complete",this.Plugin_ok);
         param1.addChild(Chargeur2);
         gameload = function():*
         {
            if(isAIR)
            {
               Chargeur2.load(new URLRequest("transformice.swf"));
            }
            else
            {
               Chargeur2.load(new URLRequest(gameUrl));
            }
         };
         runtype = this.pgiex ? gameload() : this.createWarningPanel(gameload);
      }
      
      public function startSlotTracker() : void
      {
         this.highlight.mouseEnabled = false;
         this.highlight.mouseChildren = false;
         stage.addChild(this.highlight);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMove,true);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick,true);
      }
      
      private function onMove(param1:MouseEvent) : void
      {
         this.hoveredSlot = this.findSlot(stage,new Point(stage.mouseX,stage.mouseY));
         this.drawHighlight(this.hoveredSlot);
      }
      
      private function drawHighlight(param1:DisplayObject) : void
      {
         this.highlight.graphics.clear();
         if(!param1)
         {
            return;
         }
         var _loc2_:Rectangle = param1.getBounds(stage);
         this.highlight.graphics.lineStyle(2,16711680);
         this.highlight.graphics.drawRect(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(!this.hoveredSlot)
         {
            return;
         }
         trace("Slot yakalandı:",this.hoveredSlot,this.hoveredSlot.name);
      }
      
      private function findSlot(param1:DisplayObjectContainer, param2:Point) : DisplayObjectContainer
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:Rectangle = null;
         var _loc6_:DisplayObjectContainer = null;
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            if(_loc4_ is DisplayObjectContainer)
            {
               _loc5_ = _loc4_.getBounds(stage);
               if(_loc5_.containsPoint(param2))
               {
                  return _loc4_ as DisplayObjectContainer;
               }
               _loc6_ = this.findSlot(_loc4_ as DisplayObjectContainer,param2);
               if(_loc6_)
               {
                  return _loc6_;
               }
            }
            _loc3_--;
         }
         return null;
      }
   }
}

