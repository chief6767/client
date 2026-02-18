package ChargeurTransformice_fla
{
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public dynamic class TFM_Menu extends MovieClip
   {
      
      public var menu_ui:*;
      
      public function TFM_Menu(param1:*, param2:*, param3:*, param4:*, param5:* = false, param6:* = "Pgiex TFM", param7:* = null, param8:* = 11)
      {
         super();
         this.menu_ui = this.createMenu(param1,param2,param3,param4,param5,param6,param7,param8);
         TransformiceChargeur.instance.stage.addChild(this.menu_ui);
      }
      
      public function get _Dict() : Dictionary
      {
         return Dict.theDict;
      }
      
      public function createMenu(param1:*, param2:*, param3:*, param4:*, param5:* = false, param6:* = "Pgiex TFM", param7:* = null, param8:* = 11) : *
      {
         var _loc9_:* = undefined;
         try
         {
            _loc9_ = new this._Dict.Key_.ui_element_class(param1,param2);
            _loc9_[this._Dict.Key_.set_prep_ui](this._Dict.Key_.prep_ui_class[this._Dict.Key_.prep_ui1_instance],15);
            _loc9_.x = param3;
            _loc9_.y = param4;
            _loc9_[this._Dict.Key_.set_box](param6,param7,param8);
            if(param5)
            {
               _loc9_[this._Dict.Key_.set_draggable]();
            }
         }
         catch(E:Error)
         {
         }
         return _loc9_;
      }
      
      public function addScroll(param1:int, param2:int) : *
      {
         var _loc3_:* = new Key_.ui_element_class(param1,param2);
         ui[Key_.set_prep_ui](Key_.prep_ui_class[Key_.prep_ui4_instance],15);
         ui[Key_.set_scrollable](true);
         this.menu_ui[Key_.add_ui_element](ui);
         return ui;
      }
      
      public function set_shape(param1:*, param2:int, param3:int, param4:Boolean, param5:int, param6:int = 0, param7:int = 0) : Shape
      {
         if(!param6 && !param7)
         {
            param6 = 3500917;
            param7 = 858652;
         }
         var _loc8_:* = new Shape();
         _loc8_.graphics.lineStyle(1,param6);
         if(param4)
         {
            _loc8_.graphics.lineTo(param5,0);
            _loc8_.graphics.moveTo(0,1);
            _loc8_.graphics.lineStyle(1,param7);
            _loc8_.graphics.lineTo(param5,1);
         }
         else
         {
            _loc8_.graphics.lineTo(0,param5);
            _loc8_.graphics.moveTo(1,0);
            _loc8_.graphics.lineStyle(1,param7);
            _loc8_.graphics.lineTo(1,param5);
         }
         _loc8_.x = param2;
         _loc8_.y = param3;
         param1.addChild(_loc8_);
         return _loc8_;
      }
   }
}

