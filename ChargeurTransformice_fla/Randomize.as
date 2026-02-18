package ChargeurTransformice_fla
{
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public class Randomize
   {
      
      public var instance:Randomize = this;
      
      public function Randomize()
      {
         super();
      }
      
      public static function randomNumberGenerator(param1:int = 0, param2:int = 2147483647) : int
      {
         if(param1 == param2)
         {
            return param1;
         }
         if(param1 < param2)
         {
            return param1 + Math.random() * (param2 - param1 + 1);
         }
         return param2 + Math.random() * (param1 - param2 + 1);
      }
      
      public static function GetRandomCha(param1:int) : String
      {
         var _loc2_:Array = [" ","0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","?","!","_","*","#","$","$"];
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc3_ += _loc2_[randomNumberGenerator(0,_loc2_.length - 1)];
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function GetRandomSPCha(param1:int = 1) : String
      {
         var _loc2_:Array = ["?","!","_","*","#","$"];
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc3_ += _loc2_[randomNumberGenerator(0,_loc2_.length - 1)];
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function GetRandomCha2(param1:int) : String
      {
         var _loc2_:Array = ["a","s","d","e","f","g","h","n","o","y"];
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc3_ += _loc2_[randomNumberGenerator(0,_loc2_.length - 1)];
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function GetRandomRoomName() : String
      {
         var _loc1_:Array = ["bootcamp","racing","vanilla","village","Tutorial"];
         return _loc1_[randomNumberGenerator(0,_loc1_.length - 1)];
      }
   }
}

