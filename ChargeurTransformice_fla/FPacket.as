package ChargeurTransformice_fla
{
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public dynamic class FPacket extends MovieClip
   {
      
      public var instance:FPacket = this;
      
      public var _Dict:Dictionary;
      
      public function FPacket(param1:*)
      {
         super();
         this._Dict = param1;
      }
      
      public function ParsePacket(param1:int, param2:int, param3:ByteArray) : void
      {
         var _loc4_:* = new ByteArray();
         _loc4_.writeByte(param1);
         _loc4_.writeByte(param2);
         _loc4_.writeBytes(param3);
         this._Dict.Key_.ClassReciv[this._Dict.Key_.Recive](_loc4_);
      }
      
      public function SendPacket(param1:int, param2:int, param3:ByteArray) : void
      {
         var _loc4_:* = new this._Dict.Key_.packet_out_class(param1,param2);
         _loc4_[this._Dict.Key_.socket_data].writeBytes(param3);
         this._Dict.Key_.MoteurReseau[this._Dict.Key_.Satellite][this._Dict.Key_.envoieMessage](_loc4_);
      }
      
      public function SendPacket2(param1:int, param2:int, param3:ByteArray) : void
      {
         var _loc4_:* = new this._Dict.Key_.packet_out_class(param1,param2);
         _loc4_[this._Dict.Key_.socket_data].writeBytes(param3);
         this._Dict.Key_.MoteurReseau[this._Dict.Key_.main_socket][this._Dict.Key_.envoieMessage](_loc4_);
      }
      
      public function ParseOldPacket(param1:int, param2:int, ... rest) : void
      {
         var _loc6_:* = undefined;
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeByte(param1);
         _loc5_.writeByte(param2);
         for each(_loc6_ in rest)
         {
            _loc5_.writeByte(1);
            _loc5_.writeUTFBytes(_loc6_);
         }
         _loc4_.writeShort(_loc5_.length);
         _loc4_.writeBytes(_loc5_,0,_loc5_.length);
         this.ParsePacket(1,1,_loc4_);
      }
      
      public function SendOldPacket(param1:int, param2:int, ... rest) : void
      {
         var _loc6_:* = undefined;
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeByte(param1);
         _loc5_.writeByte(param2);
         for each(_loc6_ in rest)
         {
            _loc5_.writeByte(1);
            _loc5_.writeUTFBytes(_loc6_);
         }
         _loc4_.writeShort(_loc5_.length);
         _loc4_.writeBytes(_loc5_,0,_loc5_.length);
         this.SendPacket(1,1,_loc4_);
      }
      
      public function SendOldPacket2(param1:int, param2:int, ... rest) : void
      {
         var _loc6_:* = undefined;
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeByte(param1);
         _loc5_.writeByte(param2);
         for each(_loc6_ in rest)
         {
            _loc5_.writeByte(1);
            _loc5_.writeUTFBytes(_loc6_);
         }
         _loc4_.writeShort(_loc5_.length);
         _loc4_.writeBytes(_loc5_,0,_loc5_.length);
         this.SendPacket2(1,1,_loc4_);
      }
      
      public function on_socket_data(param1:ProgressEvent = null, param2:Boolean = false, param3:String = null) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:* = 0;
         var _loc6_:* = this._Dict.Key_.AFKc[this._Dict.Key_.chat_instance];
         if(param3 == "main")
         {
            _loc4_ = this._Dict.Key_.MoteurReseau[this._Dict.Key_.main_socket];
         }
         else
         {
            _loc4_ = this._Dict.Key_.MoteurReseau[this._Dict.Key_.Satellite];
         }
         var _loc7_:Socket = _loc6_[_loc4_[this._Dict.Key_.Socket1]](_loc4_[this._Dict.Key_.serveur]) as Socket;
         if(!_loc7_.bytesAvailable)
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
               if(!_loc7_.bytesAvailable)
               {
                  return;
               }
               _loc5_ = _loc7_.readByte() & 0xFF;
               _loc4_[this._Dict.Key_.data_len] |= (_loc5_ & 0x7F) << _loc4_[this._Dict.Key_.data_offset] * 7;
               _loc4_[this._Dict.Key_.data_offset] += 1;
            }
            while((_loc5_ & 0x80) == 128 && _loc4_[this._Dict.Key_.data_offset] < 5);
            
            _loc4_[this._Dict.Key_.read_data] = true;
         }
         if(Boolean(_loc4_[this._Dict.Key_.read_data]) && _loc7_.bytesAvailable >= _loc4_[this._Dict.Key_.data_len])
         {
            _loc4_[this._Dict.Key_.socket_data].clear();
            try
            {
               _loc7_.readBytes(_loc4_[this._Dict.Key_.socket_data],0,_loc4_[this._Dict.Key_.data_len]);
               TransformiceChargeur.instance.onReceive(_loc4_[this._Dict.Key_.socket_data],param3);
            }
            catch(e:Error)
            {
            }
            _loc4_[this._Dict.Key_.data_len] = 0;
            _loc4_[this._Dict.Key_.data_offset] = 0;
            _loc4_[this._Dict.Key_.read_data] = false;
            if(_loc7_.connected && Boolean(_loc7_.bytesAvailable))
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
      
      public function main_socket_data(param1:ProgressEvent) : void
      {
         this.on_socket_data(null,false,"main");
      }
      
      public function bulle_socket_data(param1:ProgressEvent) : void
      {
         this.on_socket_data(null,false,"bulle");
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
   }
}

