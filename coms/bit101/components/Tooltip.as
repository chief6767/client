package coms.bit101.components
{
   import ChargeurTransformice_fla.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class Tooltip extends Panel
   {
      
      public var _label:Label;
      
      public var _label2:Label;
      
      public var xSprite:Sprite;
      
      public var _color_:int = 0;
      
      public function Tooltip(param1:DisplayObjectContainer = null, param2:String = "pgiex", param3:int = 1, param4:int = 0)
      {
         var Obje1:*;
         var i:int;
         var tooltipWidth:Number;
         var tooltipHeight:Number;
         this.xSprite = new Sprite();
         Obje1 = param1;
         i = 0;
         while(i < param3)
         {
            Obje1 = Obje1.parent;
            i++;
         }
         super(Obje1,5,2);
         if(param2.indexOf("remium") != -1)
         {
            this._color_ = 1498111;
         }
         else if(param2.indexOf("ERROR") != -1)
         {
            this._color_ = 16711680;
         }
         else
         {
            this._color_ = 12238127;
         }
         this._label = new Label(this.xSprite,5,2,param2,-1,this._color_);
         super.addChild(this.xSprite);
         if(param4 == 3)
         {
            this._label2 = new Label(this.xSprite,this._label.width + this._label.x + 0,2,"[Pro]",-1,4119536);
         }
         else if(param4 == 1)
         {
            this._label2 = new Label(this.xSprite,this._label.width + this._label.x + 0,2,"[Free]",-1,16777215);
         }
         else if(param4 == 2)
         {
            this._label2 = new Label(this.xSprite,this._label.width + this._label.x + 0,2,"[Plus]",-1,16763196);
         }
         super.width = this.xSprite.width + 8;
         super.height = this.xSprite.height + 4;
         super.afficherFond = true;
         super.visible = false;
         tooltipWidth = this.width;
         tooltipHeight = this.height;
         param1.addEventListener(MouseEvent.MOUSE_MOVE,function():*
         {
            if(TransformiceChargeur.instance.stage.mouseX + xSprite.width + 14 > TransformiceChargeur.instance.stage.stageWidth)
            {
               x = TransformiceChargeur.instance.stage.stageWidth - xSprite.width - 8;
            }
            else
            {
               x = TransformiceChargeur.instance.stage.mouseX;
            }
            if(TransformiceChargeur.instance.stage.mouseY + xSprite.height + 10 > TransformiceChargeur.instance.stage.stageHeight)
            {
               y = TransformiceChargeur.instance.stage.stageHeight - xSprite.height - 4;
            }
            else
            {
               y = TransformiceChargeur.instance.stage.mouseY + 25;
            }
            TransformiceChargeur.instance.stage.addChild(xSprite.parent.parent);
            visible = true;
         });
         param1.addEventListener(MouseEvent.MOUSE_OUT,function():*
         {
            visible = false;
         });
      }
      
      public function set text(param1:String) : *
      {
         this.xSprite.removeChildAt(0);
         this._label = new Label(this.xSprite,5,2,param1,-1,12238127);
         super.width = this.xSprite.width + 10;
         super.height = this.xSprite.height + 4;
      }
   }
}

